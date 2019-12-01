import MySQLdb
import pandas as pd
import math

mydb = MySQLdb.connect(
    host="localhost",
    user="datapolicy_user",
    passwd="",
    db="tb_final"
)

mycursor = mydb.cursor()
file_name = input("Digite o nome do arquivo (Caso seja mais de um, digite separado por virgula, exemplo: sia112018.csv, sia102018.csv): ")
file_names = [x.strip() for x in file_name.split(",")]

def db_save(sql, items):
    mycursor.executemany(sql, items)
    mydb.commit()

def insert_into_group(groups):
    sql = "INSERT INTO GRUPO (codGrupo, nomeGrupo) VALUES (%s, %s) ON DUPLICATE KEY UPDATE codGrupo=codGrupo"
    db_save(sql, groups)

def insert_into_subgrupo(subgroups):
    sql = "INSERT INTO SUBGRUPO (codSubgrupo, nomeSubgrupo, codGrupo) VALUES (%s, %s, %s) ON DUPLICATE KEY UPDATE codSubgrupo=codSubgrupo"
    db_save(sql, subgroups)

def insert_into_estabelecimento_cnes(estabelecimentos):
    sql = "INSERT INTO ESTABELECIMENTO_CNES (codEstabelecimento, nomeEstabelecimento) VALUES (%s, %s) ON DUPLICATE KEY UPDATE codEstabelecimento=codEstabelecimento"
    db_save(sql, estabelecimentos)

def insert_into_procedimento(procedimentos):
    sql = "INSERT INTO PROCEDIMENTO (codProcedimento, nomeProcedimento) VALUES (%s, %s) ON DUPLICATE KEY UPDATE codProcedimento=codProcedimento"
    db_save (sql, procedimentos)

def insert_into_carater_atendimento(caraters):
    sql = "INSERT INTO CARATER_ATENDIMENTO (codCarater, nomeCaraterAtendimento) VALUES (%s, %s) ON DUPLICATE KEY UPDATE codCarater=codCarater"
    db_save(sql, caraters)

def insert_into_atendimento(atendimento):
    sql = "INSERT INTO ATENDIMENTO (anoMes, quantidade, codEstabelecimento, codGrupo, codProcedimento, codCarater) VALUES (%s, %s, %s, %s, %s, %s)"
    try:
        mycursor.execute(sql, atendimento)
        mydb.commit()
    except Exception as e:
        print(error)

def get_values(df, base_column, wanted_column):
    ids = df[base_column].unique()
    result = []
    for id in ids:
        wanted_value = df.loc[df[base_column] == id][wanted_column].unique()[0]
        if type(wanted_value) is str or not math.isnan(wanted_value):
            column_result = (id, wanted_value)
            result.append(column_result)
    return result

def import_csv_data(file_name):
    data_df = pd.read_csv("./data/{0}".format(file_name), sep=";", encoding="ISO-8859-1")
    groups = get_values(data_df, 'cod_grupo', 'grupo')
    insert_into_group(groups)
    print("Inserted GRUPOS")
    subgrupos = set(list(zip(data_df['cod_subgrupo'], data_df['subgrupo'], data_df['cod_grupo'])))
    insert_into_subgrupo(subgrupos)
    print("Inserted SUBGRUPOS")
    estabelecimentos = get_values(data_df, 'cod_estabelecimento_cnes', 'estabelecimento_cnes')
    insert_into_estabelecimento_cnes(estabelecimentos)
    print("Inserted ESTABELECIMENTO_CNES")
    procedimentos = get_values(data_df, 'cod_procedimento', 'procedimento')
    insert_into_procedimento(procedimentos)
    print("Inserted PROCEDIMENTOS")
    caraters_atendimento = get_values(data_df, 'cod_carater_atendimento', 'carater_atendimento')
    insert_into_carater_atendimento(caraters_atendimento)
    print("Inserted CARATERS_ATENDIMENTO")
    subset = data_df[['ano_mes', 'quantidade', 'cod_estabelecimento_cnes', 'cod_grupo', 'cod_procedimento', 'cod_carater_atendimento']]
    atendimentos = [tuple(x) for x in subset.values]
    for atendimento in atendimentos:
        insert_into_atendimento(atendimento)
    print("Inserted ATENDIMENTOS")

if len(file_names) > 1:
    for file in file_names:
        import_csv_data(file)
else:
    import_csv_data(file_name)

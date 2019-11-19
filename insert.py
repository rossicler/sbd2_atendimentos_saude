import MySQLdb
import pandas as pd

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

def insert_into_atendimento(atendimentos):
    sql = "INSERT INTO ATENDIMENTO (anoMes, quantidade, codEstabelecimento, codGrupo, codProcedimento, codCarater) VALUES (%s, %s, %s, %s, %s, %s)"
    db_save(sql, atendimentos)

def import_csv_data(file_name):
    data_df = pd.read_csv("./data/{0}".format(file_name), sep=";", encoding="ISO-8859-1")
    groups = set(list(zip(data_df['cod_grupo'], data_df['grupo'])))
    insert_into_group(groups)
    print("Inserted GRUPOS")
    subgrupos = set(list(zip(data_df['cod_subgrupo'], data_df['subgrupo'], data_df['cod_grupo'])))
    insert_into_subgrupo(subgrupos)
    print("Inserted SUBGRUPOS")
    estabelecimentos = set(list(zip(data_df['cod_estabelecimento_cnes'].unique(), data_df['estabelecimento_cnes'])))
    insert_into_estabelecimento_cnes(estabelecimentos)
    print("Inserted ESTABELECIMENTO_CNES")
    procedimentos = set(list(zip(data_df['cod_procedimento'].unique(), data_df['procedimento'])))
    insert_into_procedimento(procedimentos)
    print("Inserted PROCEDIMENTOS")
    caraters_atendimento = set(list(zip(data_df['cod_carater_atendimento'].unique(), data_df['carater_atendimento'])))
    insert_into_carater_atendimento(caraters_atendimento)
    print("Inserted CARATERS_ATENDIMENTO")
    atendimentos = set(list(zip(data_df['ano_mes'], data_df['quantidade'], data_df['cod_estabelecimento_cnes'],
        data_df['cod_grupo'], data_df['cod_procedimento'], data_df['cod_carater_atendimento'])))
    insert_into_atendimento(atendimentos)
    print("Inserted ATENDIMENTOS")

if len(file_names) > 1:
    for file in file_names:
        import_csv_data(file)
else:
    import_csv_data(file_name)

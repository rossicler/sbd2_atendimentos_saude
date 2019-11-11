import mysql.connector
import pandas as pd

mydb = mysql.connector.connect(
    host="localhost",
    user="datapolicy_user",
    passwd="",
    database="tb_final"
)

mycursor = mydb.cursor()
file_name = input("Digite o nome do arquivo: ")

def db_save(sql, items):
    mycursor.executemany(sql, items)
    mydb.commit()

def insert_into_group(groups):
    sql = "INSERT INTO group (codGrupo, nomeGrupo) VALUES (%s, %s)"
    db_save(sql, groups)

def insert_into_subgrupo(subgroups):
    sql = "INSERT INTO subgrupo (codSubgrupo, nomeSubgrupo, codGrupo) VALUES (%s, %s, %s)"
    db_save(sql, subgroups)

def insert_into_estabelecimento_cnes(estabelecimentos):
    sql = "INSERT INTO estabelecimento_cnes (codEstabelecimento, nomeEstabelecimento) VALUES (%s, %s)"
    db_save(sql, estabelecimentos)

def insert_into_procedimento(procedimentos):
    sql = "INSERT INTO procedimento (codProcedimento, nomeProcedimento) VALUES (%s, %s)"
    db_save (sql, procedimentos)

def insert_into_carater_atendimento(caraters):
    sql = "INSERT INTO carater_atendimento (codCarater, nomeCaraterAtendimento) VALUES (%s, %s)"
    db_save(sql, caraters)

def insert_into_atendimento(atendimentos):
    sql = "INSERT INTO atendimento (anoMes, quantidade, codEstabelecimento, codGrupo, codProcedimento, codCarater) VALUES (%s, %i, %i, %i, %i, %i)"
    db_save(sql, atendimentos)

def import_csv_data(file_name):
    data_df = pd.read_csv("./data/{0}".format(file_name), sep=";", encoding="ISO-8859-1")
    groups = list(zip(data_df['cod_grupo'].unique(), data_df['grupo']))
    import pdb; pdb.set_trace()
    insert_into_group(groups)
    print("Inserted GRUPOS")
    subgrupos = list(zip(data_df['codSubgrupo'].unique(), data_df['subgrupo'], data_df['codGrupo']))
    insert_into_subgrupo(subgrupos)
    print("Inserted SUBGRUPOS")
    estabelecimentos = list(zip(data_df['cod_estabelecimento_cnes'].unique(), data_df['estabelecimento_cnes']))
    insert_into_estabelecimento_cnes(estabelecimentos)
    print("Inserted ESTABELECIMENTO_CNES")
    procedimentos = list(zip(data_df['cod_procedimento'].unique(), data_df['procedimento']))
    insert_into_procedimento(procedimentos)
    print("Inserted PROCEDIMENTOS")
    caraters_atendimento = list(zip(data_df['cod_carater_atendimento'].unique(), data_df['carater_atendimento']))
    insert_into_carater_atendimento(caraters_atendimento)
    print("Inserted CARATERS_ATENDIMENTO")
    atendimentos = list(zip(data_df['ano_mes'], data_df['quantidade'], data_df['cod_estabelecimento_cnes'],
        data_df['cod_grupo'], data_df['cod_procedimento'], data_df['cod_carater_atendimento']))
    insert_into_atendimento(atendimentos)
    print("Inserted ATENDIMENTOS")

import_csv_data(file_name)

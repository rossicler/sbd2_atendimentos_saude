import mysql.connector
import pandas as pd

mydb = mysql.connector.connect(
    host="localhost",
    user="teste",
    passwd="",
    database="trabalho_final"
)

mycursor = mydb.cursor()
file_name = input()

def db_save(sql, items);
    mycursor.execute(sql, items)
    mydb.commit()

def insert_into_group(groups):
    sql = "INSERT INTO group (codGrupo, nomeGrupo) VALUES (%i, %s)"
    db_save(sql, groups)

def insert_into_subgrupo(subgroups):
    sql = "INSERT INTO subgrupo (codSubgrupo, nomeSubgrupo, codGrupo) VALUES (%i, %s, %i)"
    db_save(sql, subgroups)

def insert_into_estabelecimento_cnes(estabelecimentos):
    sql = "INSERT INTO estabelecimento_cnes (codEstabelecimento, nomeEstabelecimento) VALUES (%i, %s)"
    db_save(sql, estabelecimentos)

def insert_into_procedimento(procedimentos):
    sql = "INSERT INTO procedimento (codProcedimento, nomeProcedimento) VALUES (%i, %s)"
    db_save (sql, procedimentos)

def insert_into_carater_atendimento(caraters):
    sql = "INSERT INTO carater_atendimento (codCarater, nomeCaraterAtendimento) VALUES (%i, %s)"
    db_save(sql, caraters)

def insert_into_atendimento(atendimentos):
    sql = "INSERT INTO atendimento (anoMes, quantidade, codEstabelecimento, codGrupo, codProcedimento, codCarater) VALUES (%s, %i, %i, %i, %i, %i)"
    db_save(sql, atendimentos)

def import_csv_data(file_name):
    data_df = pd.read_csv("./{0}".format(file_name))
    groups = list(zip(data_df['cod_grupo'], data_df['grupo']))
    insert_into_group(groups)
    subgrupos = list(zip(data_df['codSubgrupo'], data_df['subgrupo'], data_df['codGrupo']))
    insert_into_subgrupo(subgrupos)
    estabelecimentos = list(zip(data_df['cod_estabelecimento_cnes'], data_df['estabelecimento_cnes']))
    insert_into_estabelecimento_cnes(estabelecimentos)

import_csv_data(file_name)

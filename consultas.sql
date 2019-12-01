CREATE OR REPLACE VIEW v_quantidadePorEstabelecimento AS
	SELECT est.nomeEstabelecimento, count(*) as quantidade_atendimentos FROM tb_final.ATENDIMENTO atd
	INNER JOIN tb_final.ESTABELECIMENTO_CNES est
		ON atd.codEstabelecimento = est.codEstabelecimento
	GROUP BY atd.codEstabelecimento
    ORDER BY quantidade_atendimentos DESC;
    
SELECT * FROM v_quantidadePorEstabelecimento;

CREATE OR REPLACE VIEW v_quantidadePorEstabelecimentoAnoMes AS
	SELECT atd.anoMes, est.nomeEstabelecimento, count(*) as quantidade_atendimentos FROM tb_final.ATENDIMENTO atd
	INNER JOIN tb_final.ESTABELECIMENTO_CNES est
		ON atd.codEstabelecimento = est.codEstabelecimento
	GROUP BY atd.anoMes, atd.codEstabelecimento
    ORDER BY quantidade_atendimentos DESC;

SELECT * FROM v_quantidadePorEstabelecimentoAnoMes;

CREATE OR REPLACE VIEW v_quantidadePorProcedimento AS
	SELECT p.nomeProcedimento, count(*) as quantidade_atendimentos FROM tb_final.ATENDIMENTO atd
	INNER JOIN tb_final.PROCEDIMENTO p
		ON p.codProcedimento = atd.codProcedimento
	GROUP BY p.codProcedimento
    ORDER BY quantidade_atendimentos DESC;

SELECT * FROM v_quantidadePorProcedimento;

CREATE OR REPLACE VIEW v_quantidadePorCaraterAtendimento AS
	SELECT ca.nomeCaraterAtendimento, count(*) as quantidade_atendimentos FROM tb_final.ATENDIMENTO atd
	INNER JOIN tb_final.CARATER_ATENDIMENTO ca
		ON ca.codCarater = atd.codCarater
	GROUP BY ca.codCarater
    ORDER BY quantidade_atendimentos DESC;

SELECT * FROM v_quantidadePorCaraterAtendimento;
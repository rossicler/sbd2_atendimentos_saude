# sbd2_atendimentos_saude

pyenv install 3.6.4
pyenv virtualenv 3.6.4 sdb2-env
pyenv activate sdb2-env
pip install -r requirements.txt
python insert.py

## Após isso o programa perguntará o nome do arquivo a ser importado, podendo digitar o nome do arquivo em especifico, caso seja mais de um, separe por vírgula
Exemplo: sia112018.csv

### Para importar todos os datasets, cole o seguinte texto
sia112017.csv, sia122017.csv, sia022018.csv, sia032018.csv, sia042018.csv, sia042018.csv, sia052018.csv, sia072018.csv, sia082018.csv, sia092018.csv, sia102018.csv, sia112018.csv
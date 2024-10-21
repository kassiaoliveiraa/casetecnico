import requests
import re
import json
from bs4 import BeautifulSoup
from datetime import datetime
import os
from pathlib import Path
import zipfile

url = 'https://portaldatransparencia.gov.br/download-de-dados/servidores'
response = requests.get(url)
html = BeautifulSoup(response.text, 'html.parser')

regex = r'arquivos\.push\((.*?)\);'
matches = re.findall(regex, response.text)

current_month = datetime.now().month - 2
month = f'{current_month:02d}'
year = datetime.now().year

arquivos = [
    json.loads(match.replace("'", '"'))
    for match in matches
    if "SIAPE" in match and json.loads(match.replace("'", '"'))["ano"] == str(year) and
       json.loads(match.replace("'", '"'))["mes"] == month
]

save_dir = Path('./downloads_siape')
os.makedirs(save_dir, exist_ok=True)

for arquivo in arquivos:
    ano, mes, origem = arquivo["ano"], arquivo["mes"], arquivo["origem"]
    download_url = f'https://dadosabertos-download.cgu.gov.br/PortalDaTransparencia/saida/servidores/{ano}{mes}_{origem}.zip'

    print(f'Baixando arquivo: {download_url}')

    try:
        file_response = requests.get(download_url)
        file_response.raise_for_status()

        zip_path = save_dir / f'{ano}{mes}_{origem}.zip'
        with open(zip_path, 'wb') as f:
            f.write(file_response.content)

        print(f'Arquivo salvo em: {zip_path}')

        extract_dir = save_dir / f'{ano}{mes}_{origem}'
        os.makedirs(extract_dir, exist_ok=True)

        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(extract_dir)

        print(f'Arquivo descompactado em: {extract_dir}')

    except Exception as e:
        print(f'Erro ao baixar {download_url}: {e}')

print("Arquivos no diretório após o download:")
print(os.listdir(save_dir))

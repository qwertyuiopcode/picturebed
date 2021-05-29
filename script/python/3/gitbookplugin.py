import json
import os
with open("./book.json",'r',encoding='utf-8') as load_f:
    load_dict=json.load(load_f)
it=iter(load_dict['plugins'])
for x in it:
    os.system('npm install gitbook-plugin-'+x)

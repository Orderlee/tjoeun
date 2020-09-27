import pandas as pd
from hdfs import InsecureClient
import os

client_hdfs = InsecureClient('hdfs://192.168.126.101:9870',user='root')

list1 = ['kim','20']
list2 = ['park','30']
df = pd.DataFrame(data = {'list1' :list1, 'list2':list2})

with client_hdfs.write('test3.csv',encoding = 'utf-8') as writer:
    df.to_csv(writer)
with client_hdfs.read('test3.csv',encoding = 'utf-8') as reader:
    df = pd.read_csv(reader,index_col=0)

# coding=utf-8
# from apriori import * #导入自行编写的apriori函数

from __future__ import print_function
import pandas as pd
import numpy as np
from pandas.io import sql
import pymysql
import time



#自定义连接函数，用于实现L_{k-1}到C_k的连接
def connect_string(x, ms):
  x = list(map(lambda i:sorted(i.split(ms)), x))
  l = len(x[0])
  r = []
  for i in range(len(x)):
    for j in range(i,len(x)):
      if x[i][:l-1] == x[j][:l-1] and x[i][l-1] != x[j][l-1]:
        r.append(x[i][:l-1]+sorted([x[j][l-1],x[i][l-1]]))
  return r

#寻找关联规则的函数
def find_rule(d, support, confidence, ms = u'--'):
  result = pd.DataFrame(index=['support', 'confidence']) #定义输出结果

  support_series = 1.0*d.sum()/len(d) #支持度序列
  column = list(support_series[support_series > support].index) #初步根据支持度筛选
  k = 0

  while len(column) > 1:
    k = k+1
    #print(u'\n正在进行第%s次搜索...' %k)
    column = connect_string(column, ms)
    #print(u'数目：%s...' %len(column))
    sf = lambda i: d[i].prod(axis=1, numeric_only = True) #新一批支持度的计算函数

    #创建连接数据，这一步耗时、耗内存最严重。当数据集较大时，可以考虑并行运算优化。
    d_2 = pd.DataFrame(list(map(sf,column)), index = [ms.join(i) for i in column]).T

    support_series_2 = 1.0*d_2[[ms.join(i) for i in column]].sum()/len(d) #计算连接后的支持度
    column = list(support_series_2[support_series_2 > support].index) #新一轮支持度筛选
    support_series = support_series.append(support_series_2)
    column2 = []

    for i in column: #遍历可能的推理，如{A,B,C}究竟是A+B-->C还是B+C-->A还是C+A-->B？
      i = i.split(ms)
      for j in range(len(i)):
        column2.append(i[:j]+i[j+1:]+i[j:j+1])

    cofidence_series = pd.Series(index=[ms.join(i) for i in column2]) #定义置信度序列

    for i in column2: #计算置信度序列
      cofidence_series[ms.join(i)] = support_series[ms.join(sorted(i))]/support_series[ms.join(i[:len(i)-1])]

    for i in cofidence_series[cofidence_series > confidence].index: #置信度筛选
      result[i] = 0.0
      result[i]['confidence'] = cofidence_series[i]
      result[i]['support'] = support_series[ms.join(sorted(i.split(ms)))]

  result = result.T.sort_values(['confidence','support'], ascending = False) #结果整理，输出
  #print(u'\n结果为：')
  #print(result)

  return result

db_fmmall = pymysql.connect(host="localhost",
                      user='root',
                      password='root',
                      database='fmmall2')
cursor_fmmall = db_fmmall.cursor()
#关联规则分析
#sql_search_order = "select o.user_id,oi.product_id \
#                    from orders o , order_item oi\
#                    where oi.order_id = o.order_id"
# 更新时选取近一年的商品订单数据
sql_search_order = "select o.user_id,oi.product_id \
                    from orders o , order_item oi\
                    where oi.order_id = o.order_id AND oi.buy_time > date_sub(NOW(),interval 1 YEAR)" 
cursor_fmmall.execute(sql_search_order)
result_search_order = cursor_fmmall.fetchall()
result_search_order = tuple(set(result_search_order))
result_purchase_record = []
for i in range(result_search_order.__len__()):
    if result_purchase_record.__len__() == 0:
       result_purchase_record.append(list(result_search_order[i]))
    else:
        for j in range(result_purchase_record.__len__()):
            if result_search_order[i][0] == result_purchase_record[j][0]:
                result_purchase_record[j].append(result_search_order[i][1])
                break
            if j == result_purchase_record.__len__()-1:
                result_purchase_record.append(list(result_search_order[i]))
max = 0
for i in range(result_purchase_record.__len__()):
    del result_purchase_record[i][0]
    if result_purchase_record[i].__len__() > max :
        max = result_purchase_record[i].__len__()
for i in range(result_purchase_record.__len__()):
    for j in range(result_purchase_record[i].__len__(),max):
         result_purchase_record[i].append(None)

#读取excel数据
# inputfile = 'F:\Songhao\gs.数据集\数据集6-\小数据集\Apriori用户购买集-添加商品描述(4).xlsx'
# outputfile = 'F:\Songhao\gs.数据集\数据集6-\小数据集\小数据集Apriori(2).xlsx' #结果文件
# data = pd.read_excel(inputfile, header = None)

#print(u'\n转换原始数据至0-1矩阵...')
ct = lambda x : pd.Series(1, index = x[pd.notnull(x)]) #转换0-1矩阵的过渡函数
b = map(ct, np.asarray(result_purchase_record)) #用map方式执行
#print(np.asarray(result_purchase_record))
data = pd.DataFrame(list(b)).fillna(0) #实现矩阵转换，空值用0填充
#print(data)
#print(u'\n转换完毕。')
del b #删除中间变量b，节省内存

support = 0.02 #最小支持度
confidence = 0.2 #最小置信度
ms = '---' #连接符，默认'--'，用来区分不同元素，如A--B。需要保证原始表格中不含有该字符

result = find_rule(data, support, confidence, ms)#.to_excel(outputfile) #保存结果

result_index = list(result.index)

#print(result.iloc[3].values)
# 删除两个表的内容
sql_delete_related_products_items = "drop table if exists `related_products_items`"
sql_delete_related_products = "drop table if exists `related_products`"
sql_create_related_products = "CREATE TABLE `related_products` (\
  `related_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',\
  `support` decimal(10,6) DEFAULT NULL COMMENT '支持度',\
  `confidence` decimal(10,6) DEFAULT NULL COMMENT '置信度',\
  PRIMARY KEY (`related_id`) USING BTREE\
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='关联规则'"
sql_create_related_products_items ="CREATE TABLE `related_products_items` (\
  `related_item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联子项目id',\
  `product_id` varchar(64) DEFAULT NULL COMMENT '商品id',\
  `related_id` varchar(64) DEFAULT NULL COMMENT '关联规则id',\
  PRIMARY KEY (`related_item_id`) USING BTREE\
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;"
try:
  cursor_fmmall.execute(sql_delete_related_products)
  cursor_fmmall.execute(sql_delete_related_products_items)
  cursor_fmmall.execute(sql_create_related_products)
  cursor_fmmall.execute(sql_create_related_products_items)
except:
  print("ERROR:Failed to update or create related table, please confirm the database information")
try:
  for i in range(result_index.__len__()):
    related_id = "A" +  str(time.time())
    sql_insert_related_products = "insert into related_products (`related_id`,support,confidence) values ('%s',%f,%f)"%\
      (related_id,result.iloc[i].values[0],result.iloc[i].values[1])
    cursor_fmmall.execute(sql_insert_related_products)
    related_item_list = str.split(result_index[i],"---")
    for j in range(related_item_list.__len__()):
      related_item_id = "B" + str(time.time()) + related_item_list[j] + str(np.random.randint(10,99))
      #print(related_item_id)
      sql_insert_related_products_items = "insert into related_products_items (`related_item_id`,`product_id`,`related_id`) values('%s','%s','%s')"%\
                                          (related_item_id,related_item_list[j],related_id)
      cursor_fmmall.execute(sql_insert_related_products_items)
except:
  print("ERROR:Failed to write related table, please confirm the database information")

db_fmmall.commit()
db_fmmall.close()

print("Recommended rules update completed")
# result_index = []
# for i in range(result.__len__()):
  # product_list = str.split(result[i],"---")
  # result_index.append(product_list)
# print(result_index)

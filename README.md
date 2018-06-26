## ES学习笔记

ES默认端口:9200,默认[本机地址](http://localhost:9200)


#### 查看节点所有索引
[本机全部所有](http://localhost:9200/_cat/indices?v&pretty)
````
curl -XGET 'localhost:9200/_cat/indices?v&pretty'
````
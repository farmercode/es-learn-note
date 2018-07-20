## ES学习笔记
在ES中，index相当于数据库，type相当于表，而mapping则相当于表结构。
ES默认端口:9200,默认[本机地址](http://localhost:9200)

#### 查看节点所有索引
[本机全部所有](http://localhost:9200/_cat/indices?v&pretty)
````
curl -XGET 'localhost:9200/_cat/indices?v&pretty'
````

### 查看安装插件列表
````
http://localhost:9200/_cat/plugins?v&pretty
````

### 查看索引mapping
查看当前es中mapping格式大致如下。
````
http://127.0.0.1:9200/{index}/{type}/_mapping?pretty
http://localhost:9200/xzxq_content/content/_mapping?pretty
````

### 搜索索引
对指定索引进行搜索，下面的高亮tag会显示出搜索内容命中那些分词
````
curl -XPOST "http://localhost:9200/index/fulltext/_search" -H 'Content-Type: application/json' -d'
{
	"query" : {
		"match" : { "content" : "轿车漂移"}
	},
	"highlight" : {
        "pre_tags" : ["<tag1>", "<tag2>"],
        "post_tags" : ["</tag1>", "</tag2>"],
        "fields" : {
            "content" : {}
        }
    }
}'
````
## ik分词
[ik](https://github.com/medcl/elasticsearch-analysis-ik)目前提供2中分析器：ik_smart，ik_max_word。
### ik_smart和ik_max_word区别
ik_max_word: 会将文本做最细粒度的拆分，比如会将"中华人民共和国国歌"拆分为"中华人民共和国,中华人民,中华,华人,人民共和国,人民,人,民,共和国,共和,和,国国,国歌"，会穷尽各种可能的组合；
ik_smart: 会做最粗粒度的拆分，比如会将"中华人民共和国国歌"拆分为"中华人民共和国,国歌"。

### 测试分词
查看分析器将内容拆分成具体的分词,目前需要在具体的索引上面才能调用接口,下面的index是一个具体的索引。
````
curl -XPOST "http://localhost:9200/index/_analyze" -H 'Content-Type: application/json' -d'
{
  "text": "中华人民共和国国务院总理",
  "tokenizer": "ik_smart"
}'
````
返回结果
````
{
  "tokens": [
    {
      "token": "中华人民共和国",
      "start_offset": 0,
      "end_offset": 7,
      "type": "CN_WORD",
      "position": 0
    },
    {
      "token": "国务院总理",
      "start_offset": 7,
      "end_offset": 12,
      "type": "CN_WORD",
      "position": 1
    }
  ]
}
````
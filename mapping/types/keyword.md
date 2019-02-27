# Keyword类型
用于索引结构化内容的字段，例如电子邮件地址，主机名，状态代码，邮政编码或标签。 

它们通常用于过滤（查找我所有发布状态的博客帖子），排序和聚合。keyword字段只能按其确切值进行搜索。
如果你需要全文索引内容像邮件内容或者产品描述，那么你最好使用`text`类型的字段。

下面是一个keyword类型映射的例子：
````
PUT my_index
{
  "mappings": {
    "_doc": {
      "properties": {
        "tags": {
          "type":  "keyword"
        }
      }
    }
  }
}
````
## keyword类型参数
下面是keyword类型支持的参数：
参数 | 说明
--- | ----
[boost](https://www.elastic.co/guide/en/elasticsearch/reference/current/keyword.html) | Mapping field-level query time boosting. Accepts a floating point number, defaults to 1.0.
[doc_values](https://www.elastic.co/guide/en/elasticsearch/reference/current/doc-values.html) | 字段是否应该以[column-stride](https://discuss.elastic.co/t/what-does-column-stride-field-mean-regarding-doc-values-in-elasticsearch-lecune/111332)方式存储在磁盘上，以便后续用来排序，聚合或者脚本？接受`true`（默认）或者`false`值。
[eager_global_ordinals](https://www.elastic.co/guide/en/elasticsearch/reference/current/eager-global-ordinals.html)|Should global ordinals be loaded eagerly on refresh? 接受 值`true` 和 `false` (默认). 建议在频繁的使用terms聚合的字段上面启用。
[fields](https://www.elastic.co/guide/en/elasticsearch/reference/current/multi-fields.html)|多字段允许以不同目的以多种方式索引相同的字符串值, 例如一个用于搜索的字段和一个用于排序和聚合的多字段.
[ignore_above](https://www.elastic.co/guide/en/elasticsearch/reference/current/ignore-above.html)|不在索引长于此值的任何字符串。默认为`2147483647`，基本可以接受所有值。但请注意，默认动态映射规则会创建一个子keyword字段，通过设置ignore_above：256来覆盖此默认值。
[index](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-index.html)|字段是否可以搜索？接受值为`true`（默认）和`false`.
[index_options](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-options.html)|出于评分目的，应将哪些信息存储在索引中. 默认为`docs`，但也可以设置为`freqs`，以便在计算分数时考虑术语频率。
[norms](https://www.elastic.co/guide/en/elasticsearch/reference/current/norms.html)|在评分查询时是否应考虑字段长度。接受值为`true`和`false`（默认）。
[null_value](https://www.elastic.co/guide/en/elasticsearch/reference/current/null-value.html)|设置一个字符串值来代替`null`值。默认值为`null`,意味着该字段被视为缺失。
[similarity](https://www.elastic.co/guide/en/elasticsearch/reference/current/similarity.html)|应使用哪种评分算法或相似度。默认为`BM25`。



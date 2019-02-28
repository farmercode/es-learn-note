# Text类型
A field to index full-text values, such as the body of an email or the description of a product. These fields are analyzed, that is they are passed through an analyzer to convert the string into a list of individual terms before being indexed. The analysis process allows Elasticsearch to search for individual words within each full text field. Text fields are not used for sorting and seldom used for aggregations (although the significant text aggregation is a notable exception).
用于全文索引的字段，如电子邮件的内容和产品的描述。分析这些字段，即它们通过分析器传递，以在索引之前将字符串转换为单个术语的列表。分析过程允许Elasticsearch在每个全文字段中搜索单个单词。文本字段很少用来排序或者聚合。

如果您需要索引电子邮件地址，主机名，状态代码或标记等结构化内容，则可能应该使用`keyword`字段。

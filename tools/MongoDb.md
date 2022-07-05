# MongoDb

## 相关知识

[非关系型数据库NoSQL](https://www.runoob.com/mongodb/nosql.html)

SQL 是 Structured Query Language

## 要点

![截图](..\resources\710b4eff8be0b08f84fde04dab5da826.png)

mongoDb基本结构如图

搭建很简单，可以用服务

**MongoDB 所有的数据存在性依托于数据本身，不需要建库，只需要指定库名、集合和数据。数据库内的数据应该是离散式的**
## mongo shell

use admin // 切换到admin数据库，可能不需要
db; use admin; db.auth(“admin”, “admin”)

db.auth("tip","QAxTipMongo99#")
<br/>
mongo --port 27017 -u "tip" -p "QAxTipMongo99" --authenticationDatabase "admin"


## TIP 中相关模块

tip_1.0\bin\common\mongo_util\mongo_cli.py

## 建库（实际上没什么意义）

mongoimport -u tip -p QAxTipMongo99# -d tip_feedback1 -c feedback  --type=json --file /tututest/test.json --authenticationDatabase admin

mongoimport -u tip -p QAxTipMongo99# -d tip_feedback1 -c feedback --authenticationDatabase admin --jsonArray "{"

mongoimport -u tip -p QAxTipMongo99# -d tip_feedback -c feedback  --type=json --authenticationDatabase admin" --jsonArray "{"info": [{"content": "示例项目3333"}],"time": "2022-3-10 10:21:29"}"

db.feedback.find({'feedback_time': {'$lte': '1647243389', '$gte': '1647243389'}})



## 时间对比的Trick

可以将时间对象直接存成字符串，然后拿相同规则的字符串可以拿去对比。mongodb会自动识别成时间来进行对比
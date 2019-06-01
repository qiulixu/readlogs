ReadLog
====
什么东西？What?
----
用户查看远程服务器文件日志


有什么价值？
----
1、RBAC权限完善，多角色管理系统    
2、后台界面完整，多标签页面    
3、API相关页面有比较复杂的使用案例    
所以，可以作为一个基础框架使用，快速开发。初学者还可以作为熟悉beego使用。  
4、可用于中小团队API管理使用  
5、增加设置远程主机地址查看日志,可以及时查看自己平台错误，不需要登录服务器

用到了哪些？
----
1、界面框架layUI2.4.5
    
2、makedown.md    


3、beego1.8 

4、Ztree 

5、PPGO_ApiAdmin


效果展示
----
![](https://ws2.sinaimg.cn/large/006tNc79ly1g3lvmnitl4j31kk0u07c4.jpg)
![](https://ws1.sinaimg.cn/large/006tNc79ly1g3lvn6wlbyj31kp0u0grz.jpg)
![](https://ws2.sinaimg.cn/large/006tNc79ly1g3lvonbdftj31ku0u0n2q.jpg)
![](https://ws4.sinaimg.cn/large/006tNc79ly1g3lvnzp2gej31kp0u07jr.jpg)
<br/><br/>



安装方法    
----
1、go get github.com/qq1439606006/readlogs    
2、创建mysql数据库，并将readlogs.sql导入    
3、修改config 配置数据库    
4、运行 go build  


前台访问：http://127.0.0.1:8081
用户名：admin 密码：magic    

联系我
----
qq:1439606006
欢迎交流，欢迎提交代码。



[toc]

## 一. 准备工作

- 安装并启动Docker [Docker Get Started](https://www.docker.com/get-started "Docker Get Started")
- 克隆项目到本地 `git clone URL`

## 二. 安装方式

__安全前建议修改相关参数__

- services/mysql/environment/MYSQL_ROOT_PASSWORD
- services/mysql/environment/MYSQL_PASSWORD
- services/metabase/environment/MB_DB_PASS
- services/metabase/environment/JAVA_TIMEZONE

__1. 根据系统选择运行文件__

- Mac -> `setup.sh`
- Windows -> `setup.bat`

__2. 手动执行脚本__

__2.1 MacOS 安装说明__

```sh
cd metabase
docker-compose up -d
```

__2.2 Windows 安装说明__

> Windows下需手动创建目录（否则会报文件夹不存在错误）  

- `./metabase-data`
- `./mysql/data`
- `./mysql/conf.d`


```bash
cd metabase
mkdir metabase-data
mkdir mysql\data
mkdir mysql\conf.d

docker-compose up -d
```

## 三. 其他

__docker-compose.yml__

```properties
# 数据库大小写不敏感，用于解决Metabase初始化时脚本与表名大小写不一致的问题
--lower-case-table-names=1
# MySQL服务默认创建用于Metabase的数据库、用户及权限(该库的ALL权限)
MYSQL_DATABASE: metabase
MYSQL_USER: metabase
MYSQL_PASSWORD: metabasePass
```

参考资料: 

1. [Running Metabase on Docker](https://www.metabase.com/docs/latest/operations-guide/running-metabase-on-docker.html "Running Metabase on Docker")
2. [Configuring Application Database](https://www.metabase.com/docs/latest/operations-guide/configuring-application-database.html "Configuring Application Database")
3. [DockerHub MySQL](https://hub.docker.com/_/mysql "DockerHub MySQL")
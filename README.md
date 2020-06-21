## 一. 准备工作

- 安装并启动Docker

参考资料: 

1. [Docker Get Started](https://www.docker.com/get-started "Docker Get Started")

## 二. 安装方式

1. 切换至 `docker-compose.yml` 文件所在目录
2. 执行 `docker-compose up -d`

__MacOS__

```sh
cd ./metabase/
docker-compose up -d
```

__Windows__

> Windows下需手动创建目录（否则会报文件夹不存在错误）  

- `./metabase-data`
- `./mysql/data`
- `./mysql/conf.d`


```bash
# 文件夹所在盘符(例如C:、D:)
E:
cd \metabase
mkdir \metabase-data
mkdir \mysql\data
mkdir \mysql\conf.d

docker-compose up -d
```

## docker-compose.yml

__建议自定义修改参数__

- services/mysql/environment/MYSQL_ROOT_PASSWORD
- services/mysql/environment/MYSQL_PASSWORD
- services/metabase/environment/MB_DB_PASS

```properties
# 数据库大小写不敏感，用于解决Metabase初始化时脚本与表名大小写不一致的问题
--lower-case-table-names=1
# MySQL服务默认创建用于Metabase的数据库、用户及权限(该库的ALL权限)
MYSQL_DATABASE: metabase
MYSQL_USER: metabase
MYSQL_PASSWORD: metabasePass
```

```yaml
version: "3"
services:
  metabase:
    image: metabase/metabase:latest
    container_name: metabase
    ports:
      - "13000:3000"
    restart: always
    volumes:
      - "./metabase-data:/metabase-data"
    depends_on:
      - mysql
    environment:
      JAVA_TIMEZONE: Asia/Shanghai
      MB_DB_TYPE: mysql
      MB_DB_DBNAME: metabase
      MB_DB_HOST: mysql
      MB_DB_PORT: 3306
      MB_DB_USER: metabase
      MB_DB_PASS: metabasePass
  mysql:
    image: mysql:5.7
    container_name: mysql
    ports:
      - "13306:3306"
    restart: always
    volumes:
      - "./mysql/data:/var/lib/mysql"
      - "./mysql/conf.d:/etc/mysql/conf.d"
    command: [
      "--character-set-server=utf8mb4",
      "--collation-server=utf8mb4_unicode_ci",
      "--default-time-zone=+8:00",
      "--lower-case-table-names=1",
      "--default-authentication-plugin=mysql_native_password"
    ]
    environment:
      MYSQL_ROOT_PASSWORD: mysqlRootPassword.
      MYSQL_DATABASE: metabase
      MYSQL_USER: metabase
      MYSQL_PASSWORD: metabasePass
```

参考资料: 

1. [Running Metabase on Docker](https://www.metabase.com/docs/latest/operations-guide/running-metabase-on-docker.html "Running Metabase on Docker")
2. [Configuring Application Database](https://www.metabase.com/docs/latest/operations-guide/configuring-application-database.html "Configuring Application Database")
3. [DockerHub MySQL](https://hub.docker.com/_/mysql "DockerHub MySQL")
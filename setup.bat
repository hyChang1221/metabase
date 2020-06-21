@echo off
@rem 修改当前编码
chcp 65001
@rem 当前目录
chdir

@rem 初始化创建 metabase目录
if not exist "metabase-data" (
  echo ERROR_FOLDER_NOT_FOUND metabase-data
  mkdir metabase-data
  echo INFO_INIT_FOLDER metabase-data
) else (
  echo ERROR_FOLDER_IS_EXIST metabase-data
)

@rem 初始化创建 mysql目录
if not exist "mysql\data" (
	echo ERROR_FOLDER_NOT_FOUND mysql\data
  mkdir mysql\data
  echo INFO_INIT_FOLDER mysql\data
) else (
  echo ERROR_FOLDER_IS_EXIST mysql\data
)

if not exist "mysql\conf.d" (
	echo ERROR_FOLDER_NOT_FOUND mysql\conf.d
  mkdir mysql\conf.d
  echo INFO_INIT_FOLDER mysql\conf.d
) else (
  echo ERROR_FOLDER_IS_EXIST mysql\conf.d
)

@rem 创建服务
rem docker-compose up -d
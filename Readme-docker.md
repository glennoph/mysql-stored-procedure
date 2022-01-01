# mysql-stored-procedure
## setup 
* install docker, docker-compose
  * execute `docker-compose up --build` # first time
  * execute `sh start-mysql.sh` # after first time
* install gnome-keyring
  ```
  sudo apt-get install gnome-keyring
  sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service
  ``` 
* install MySQL Workbench
  * Setup New Connection 
    * Connection Name: **mysql-stored-procedure**
	* Username: **user**
	* Password - Store in Keychain: (enter mysql_password)
	
## start
* execute (start mysql & workbench)
```
cd (mysql-stored-procedure dir)
sh start-mysql.sh
```
## stop
* execute: `sh stop(tab)`
stops mysql





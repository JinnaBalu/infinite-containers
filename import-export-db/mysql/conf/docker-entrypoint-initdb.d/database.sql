CREATE USER 'live_user'@'%' IDENTIFIED BY 'password';
CREATE USER 'specs_user'@'%' IDENTIFIED BY 'password';

CREATE DATABASE live;
CREATE DATABASE specs;

GRANT ALL ON live.* TO 'live_user'@'%';
GRANT ALL ON specs.* TO 'specs_user'@'%';

FLUSH PRIVILEGES;

CREATE USER 'wordpress'@'%' IDENTIFIED BY 'somepassword';

CREATE DATABASE wordpress;

GRANT ALL ON wordpress.* TO 'wordpress'@'%';

FLUSH PRIVILEGES;

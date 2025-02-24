# docker-php-nginx
Setup environment PHP &amp; Nginx on Docker

 - PHP 8.2 fpm
 - Nginx
 - Mysql
 - PhpMyadmin (optional)

### Run
    docker-compose build
    docker-compose up -d

### Nginx default configuration
    server {
        ############# Ports #################
        listen 80;
    	listen [::]:80;
    	
        #####################################
        root /var/www/projects/;
    	
    	index index.php; 
    	error_page 404 /not_found.html;
    	
    	proxy_intercept_errors on;
    
        autoindex on;
        ########## FAST CGI CONFIG ##########
        location ~ \.php$ {
          fastcgi_index index.php;
          fastcgi_pass php:9000;
          fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
          include fastcgi_params;
        }
    	
    	location / {
            index index.php;
            try_files $uri $uri/ =404;
        }
    	
    	location = /not_found.html {
            internal;
        }
    }
### Nginx laravel configuration
    server {
        ############# Ports #################
        listen 80;
        listen [::]:80;
        server_name example.com www.example.com;
        #####################################
        root /var/www/projects/example/public/;
    
        add_header X-Frame-Options "SAMEORIGIN";
        add_header X-XSS-Protection "1; mode=block";
        add_header X-Content-Type-Options "nosniff";
    	
        index index.html index.htm index.php; 
        error_page 404 /not_found.html;
    	
        proxy_intercept_errors on;
    
        autoindex on;
        ########## FAST CGI CONFIG ##########
        location ~ \.php$ {
          fastcgi_index index.php;
          fastcgi_pass php:9000;
          fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
          include fastcgi_params;
        }
    
        charset utf-8;	
        location / {
            try_files $uri $uri/ /index.php?$query_string;
        }
    	
        location = /not_found.html {
            internal;
        }
    
        location ~ /\.(?!well-known).* {
            deny all;
        }
    }
### Makefile (Optional)
Firstly you must install make with `sudo apt install make`
##### - help
Show makefile command
`make help`

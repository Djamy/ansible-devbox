server {
    listen 80;
    server_name dev.local;
    root /var/www;
    access_log /var/log/nginx/dev_local.access.log;
    error_log /var/log/nginx/dev_local.error.log;

    server_name_in_redirect off;

    index index.php index.html;

    location = /favicon.ico {
        log_not_found off;
        access_log off;
    }

    location = /robots.txt {
        allow all;
        log_not_found off;
        access_log off;
    }

    location ~* \.(engine|inc|info|install|make|module|profile|test|po|sh|.*sql|theme|tpl(\.php)?|xtmpl)$|^(\..*|Entries.*|Repository|Root|Tag|Template)$|\.php_ {
        deny all;
    }

    location ~ /\. {
        deny all;
        access_log off;
        log_not_found off;
    }

    location ~*  \.(jpg|jpeg|png|gif|css|js|ico)$ {
        expires max;
        log_not_found off;
    }

    location / {
        try_files $uri $uri/ /index.php;
    }

    location ~ \.php$ {
        #try_files $uri =404;
        include /etc/nginx/fastcgi_params;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}

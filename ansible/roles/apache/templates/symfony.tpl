# Symfony Apache virtualhost template

<VirtualHost *:80>
    ServerName {{ servername }}
    ServerAdmin webmaster@localhost

    DocumentRoot {{ doc_root }}/web
    <Directory {{ doc_root }}/web>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride None
        Order allow,deny
        allow from all
        <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteRule ^(.*)$ /app_dev.php [QSA,L]
        </IfModule>
    </Directory>
</VirtualHost>

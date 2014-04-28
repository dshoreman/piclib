<VirtualHost *:80>

	DocumentRoot "/vagrant/public"
	ServerName localhost

	<Directory "/vagrant/public">
		Options Indexes FollowSymLinks
		AllowOverride All

		# Apache 2.2
		Order allow,deny
		Allow from all

		# Apache 2.4
		Require all granted
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log

</VirtualHost>

<a name="Installation_NRPE_4.1.0-server.md"></a>
![Nagios](./images/nagios.png)

## Configurez le paramètre SSL/TLS pour utiliser une connexion HTTPS chiffrée sécurisée.

```
nano /etc/apache2/sites-available/default-ssl.conf
```
# line 3 : change admin email
```
ServerAdmin webmaster@srv.world
```
# line 32,33 : change to the certs gotten in section [1]
```
SSLCertificateFile      /etc/letsencrypt/live/www.srv.world/cert.pem
SSLCertificateKeyFile   /etc/letsencrypt/live/www.srv.world/privkey.pem
```
# line 42 : uncomment and change to the chain-file gotten in section [1]
SSLCertificateChainFile /etc/letsencrypt/live/www.srv.world/chain.pem
```
a2ensite default-ssl
Enabling site default-ssl.
To activate the new configuration, you need to run:
  systemctl reload apache2
```
root@www:~# a2enmod ssl

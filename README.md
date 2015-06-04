# dockerizing
Some docker scripts and files to create awesome containers!


Prerequisites

+ Install docker (https://docs.docker.com/installation/)
+ Get your own SSL certificates (a great guide SSL/TLS: How do i get HTTPS for my site with a valid certificate? - https://www.sysorchestra.com/2015/02/15/ssltls-how-to-https-for-my-site-with-a-valid-certificate/)


*Apache*

+ Clone it! (git clone https://github.com/web20opensource/dockerizing.git)
+ cd dockerizing


*Edit the Dockerfile*

rename this mySite.com to your site domain (it's supposed to your SSL files are related to this domain name)

ENV APACHE_MY_CERT_NAME *mySite.com*

so for example must be

ENV APACHE_MY_CERT_NAME *google.com*

Also rename the mySite.com legend from the runIt files . Also would be good you set permission 

+ chmod +x runIt
+ chmod +x etcFake/runIt

*Then prepare the etcFake folder*

You need to replace the files into the *apache2/ssl* only, with your own ssl certificates files so just replace mySite.com.crt, mySite.com.spachebundle.crt and mySite.com.key. (I'm using right now a great SSL certificate provided by https://github.com/coolaj86/nodejs-ssl-example/tree/master/certs thanks! @coolaj86) 

Also consider changing permission on the ssl files

+ chmod 644 mySite.com.crt
+ chmod 644 mySite.com.apachebundle.crt
+ chmod 600 mySite.com.key

*Dockerizing*

Now from/since/inside the dockerizing folder do:

+ docker build .

(check the number like Successfully built 6160c269fa05)

+ docker tag 6160c269fa05 apache2:one
+ docker run -t -i --name apache2 -v /path/to/your/website:/var/www/ -v /path/to/the/dockerizing/etcFake:/root/ -p 80:80 -p 443:443 apache2:one

Boom ! You are done with your site enjoy!


*Licensed by GPL v3*
*Project created by Mario Ruiz *

check an example created with this container https://remas.website

#great docker resources

www.kencochrane.net/blog/2013/08/the-docker-guidebook/#search

www.kimh.github.io/blog/en/docker/gotchas-in-writing-dockerfile-en/

docker home page (www.docker.com)
 

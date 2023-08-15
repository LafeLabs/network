## [index.html](index.html)
## [FOLLOW TRASH ROBOT ON MASTODON!](https://kolektiva.social/@trashrobot)
## [WWW.TRASHROBOT.ORG](HTTPS://WWW.TRASHROBOT.ORG/)
## [READ THE BOOK OF TRASH FREE EBOOK!](HTTPS://TRASHBOOK.TRASHROBOT.ORG/)
## [READ GEOMETRON MAGIC FREE EBOOK!](HTTPS://TRASHBOOK.TRASHROBOT.ORG/)
## [FOLLOW TRASH ROBOT ON TIKTOK!](https://www.tiktok.com/@trash_robot)
## [LOCALHOST](http://localhost)

# [TRASH MAGIC NETWORK!](https://github.com/lafeLabs/network)

In Trash Magic we build everything we need for a good life from trash and things we can grow and spread it using self-replicating media.

1. make a new page for a person, place or thing.
2. make a new server
3. put the server on the magic dump

## 1. Replicate Trash Magic Page

We make pages for things which spread trash magic.  These things include people who all help to spread the network, as well as physical products we make from trash and distribute for free, and public shared spaces we use as the platform on which we build the physical network.

To create a new page from any given page, click on the link to "webeditor.html", which is generally at the top of most Trash Magic pages.  Enter the name of the new page in the input marked "name of new file:".

![screenshot of where on editor to enter the name of the file](https://raw.githubusercontent.com/LafeLabs/network/main/trashmagic/editor-screenshot-1b.png)

Once you have made the page, create a hyperlink to it from some existing page.  This can be whatever the index page is from the network you are building your page in.

![screenshot of where to enter the code fort the link to the new page](https://raw.githubusercontent.com/LafeLabs/network/main/trashmagic/editor-screenshot-2b.png)

Once you have created the new page and linked to it, go back to the main page, click the link.


![screenshot of the link to click to go to your new page](https://raw.githubusercontent.com/LafeLabs/network/main/trashmagic/editor-screenshot-3b.png)

Post up on the board whatever your message is to the community about what you can offer and what you need.  This is a mutual aid system, ask for help and offer it, and be creative!


![screenshot showing how to update the board](https://raw.githubusercontent.com/LafeLabs/network/main/trashmagic/editor-screenshot-4b.png)


## 2. Replicate Trash Magic Server

Go find a laptop in the trash and install Ubuntu on it.  

[Ubuntu Desktop install link](https://ubuntu.com/desktop)

Open a terminal and copy/paste the following:

```
sudo apt update
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php -y
cd /var/www/html
sudo rm index.html
sudo apt install curl
sudo curl -o replicator.php https://raw.githubusercontent.com/LafeLabs/network/main/php/replicator.txt
cd ..
sudo chmod -R 0777 *
cd html
php replicator.php
sudo chmod -R 0777 *
```

To create a folder in the desktop which is linked to the folder with all the html in it, create a symbolic link as follows:

```
ln -s /var/www/html/ /home/username/Desktop
```

Create sub-folder shortcuts as desired in a way similar to this:

```
ln -s /var/www/html/mixtape/ /home/username/Desktop
```


The Trash Magic server is now ready to share media over local networks by sharing links to the IP address of that machine on that network.  Put no personal or private data on the machine ever!  This system represents an unenclosed digital commons of which the network of trash magicians are the caretakers.  

You can use these machines to access servers over local networks, access servers over the Magic Dump, or share media on local networks.  Let us make millions and millions of these free servers!  Let us scale up the digital commons!  Let us use this system to spread a mutual aid network which we can all live on comfortably!



## 3. Replicate Magic Dump 


A TRASH MAGIC DUMP is an Internet connection controlled by a TRASH MAGIC OPERATOR, which can be set up to host multiple TRASH SERVERS and [RECURSIVE WEB](https://github.com/LafeLabs/trashmagic/tree/main/web/recursiveweb) instances.  

If you are an Operator with multiple TRASH MAGIC servers and you want to set up a dump, first choose one of the servers to act as a DUMP DIRECTOR.  To convert it to DUMP DIRECTOR you want to first stop and disable the Apache web server, since we're going to use another server instead.  A DUMP DIRECTOR is an [NGINX SERVER](https://www.nginx.com/) set up using [DOCKER ](https://www.docker.com/) and the GUI tool from [nginxproxymanager](https://nginxproxymanager.com/setup/#running-the-app). 

To stop and disable Apache from the command line type:

```
sudo update-rc.d apache2 disable
sudo service apache2 stop
```

follow the instructions to install Docker on whatever system you're running. 
[Here are some Raspberry Pi instructions](https://pimylifeup.com/raspberry-pi-docker/), which are as follows:

```
sudo apt update
sudo apt upgrade
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
sudo reboot
```
then see that docker is in the list of groups by typing 
```
groups
```
test the installation with 
```
docker run hello-world
```
Now create a file in the home directory called docker-compose.yml, and copy paste the following code into it and save it:

```
version: "3"
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      # These ports are in format <host-port>:<container-port>
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port
      # Add any other Stream port you want to expose
      # - '21:21' # FTP

    # Uncomment the next line if you uncomment anything in the section
    # environment:
      # Uncomment this if you want to change the location of 
      # the SQLite DB file within the container
      # DB_SQLITE_FILE: "/data/database.sqlite"

      # Uncomment this if IPv6 is not enabled on your host
      # DISABLE_IPV6: 'true'

    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
```
Then run docker on this with 

```
docker compose up -d
```

(note there is a critical typo in the tutorial above it says docker-compose instead of "docker compose").

When this is set up, either go to [http://localhost:81] on the DUMP DIRECTOR or point a browser on another machine on the network to [ip address of DUMP DIRECTOR]:81 to get to the control panel.  Create a proxy host for each of the various domains you are pointing to your home network. You need a separate entry for [domain].[tld] than you do for www.[domain].[tld].  You can forward to any TRASH SERVER on the local network by IP address this way.  After they're set up, edit the entries to add ssl "let's encrypt" certificates.  Also be sure to add forwarding of the service "https" on your home router on port 443(you've already got port 80 from the above TRASH MAGIC SERVER setup).

Domains which operators purchase which are linked to physical spaces on the STREET and WATERSHED network are pointed to subdirectories of /var/www/html on one of the trash servers, allowing one server to hold many RECURSIVE WEB instances.  If several domains are forwarding to the same physical trash server in different subdirectories, we can route the incoming traffic correctly using apache virtual hosts. 


To do this, go to /etc/apache2/sites-available and run 

```
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/example.net.conf
```
Then 
```
sudo nano /etc/apache2/sites-available/example.net.conf
```
and edit as follows:

```
    DocumentRoot /var/www/html/web/southplattedotnet
    ServerName southplatte.net
    ServerAlias www.southplatte.net
```
And save with control X

Then use [a2ensite](https://manpages.ubuntu.com/manpages/trusty/man8/a2ensite.8.html) to enable the virtual host and [systemctl](https://man7.org/linux/man-pages/man1/systemctl.1.html) to reload apache:

```
sudo a2ensite southplatte.net
sudo systemctl reload apache2
```

With a dump set up like this, an operator can add any number of physical trash servers as well as any number of trash magic servers of all kinds on many domains all at one DUMP.  The TRASH MAGIC OPERATOR lives or works at a DUMP, which is a place they control the network connection and can set up hosting and can also store stuff for the TRASH MAGIC physical media feed, creating art and products from trash and distributing it along the WATERSHED and STREET networks.

To create a new server with the RECRURSIVE WEB, go to the local web on a TRASH MAGIC server and create a fork with the name of your domain like southbroadwaydotnet/. Use the apache virtual hosts above to forward traffic to that location, and use nginxproxymanager to forward traffic from that domain to whatever trash magic server holds this recursive web page.

THE RECURSIVE WEB IS MADE OF WORLDS AND QUESTS. YOU CONSTRUCT, REPLICATE AND DESTROY WORLDS AND QUESTS TO BUILD TRASH MAGIC.


To run apache on the same DUMP DIRECTOR machine that is running nginxproxymanager, change the port of apache from 80 to 8080, and forward whatever domains you want to host on that machine to that port and to the IP address of the machine(not localhost).  Set up the /var/www/html/web/placenamedotxyz folder as you would for another recursive web trash magic server as described above.  Each .conf file in /etc/apache2/sites-available should have the port set to 8080, including 000default.conf.  ALSO change the port in the file /etc/apache2/ports.conf, changing from "listen 80" to "listen 8080".


### Subdomain

to make a subdomain like [https://art.sloanslake.art](art.sloanslake.art) one repeats the process above.  This subdomain needs its own entry in the DNS A records from whoever manages the domain you own.  

You first add another entry to "@" and "www" which is whatever the first word is, e.g. "art" with art.sloanslake.art which points to your home IP address.

Then go to the NGINX proxy manager at [ip address of dump director]
:81 and add an entry for art.sloanslake.art, forwarding to either port 80 on a trash server other than the Dump Director machine or port 8080 if the page is on the Dump Director.

Fork one of your servers to create a page for the new subdomain.

As with the other pages, copy the conf file from another page

```
cd /etc/apache2/sites-available
sudo cp sloanslake.art.conf art.sloanslake.art.conf
sudo nano art.sloanslake.art.conf

```

Then edit that file so that it has forwarding to the appropriate folder for the fork you made above.  When the forwarding of the DNS is set up, the forwarding in nginx proxy manager is set up, and the .conf file is set up, start it with 

```
sudo a2ensite art.sloanslake.art
sudo systemctl reload apache2
```

Then when it's all set up, enable https with lets encrypt by way of nginx proxy manager.


### Replicate the Github using localhost

 - install PHP on your machine
 - create a new github repository on a CC0 PUBLIC DOMAIN license and clone it on your machine
 - copy the file [php/replicator.txt](php/replicator.txt) into a file called replicator.php in the new repo directory
 - run `php replicator.php` on your machine, wait for all the code to copy
 - push all that code up to your github repo
 - in the same directory, type `sudo php -S localhost:80`
 - go to [http://localhost](http://localhost) and you should get back to this screen, edit all elements of the system
 - use [editor.php](editor.php) to edit the file php/replicator.txt so that the two urls are the global url for *your* repo for both dna and replicator
 - after you've edited the code, click [text2php.php](text2php.php) to convert that to php
 - push your code to your github repo
 - use the new replicator code on your github repo to replicate out that instance to all other servers(linux, windows, mac, android) and forks
 - when you figure this out, make youtube videos showing other people how to copy the whole system, tell someone about those videos so that we can all link to them


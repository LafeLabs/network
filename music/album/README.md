# Album

  - [index.html](index.html)
  - [localhost](http://localhost/)


This scroll needs to have the replicator to make a new album from scratch on a new github repository. It also needs to say that this is a self-replicating album. 

go into the music folder, or create it if it doesn't exist, and then go into it.

```
sudo mkdir music
sudo chmod -R 0777 music
cd music
```

```
mkdir albumname
cd albumname
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/album/replicator.php
php replicator.php
```

### [http://localhost/music/thelastpoet/apagefrommybook/](http://localhost/music/thelastpoet/apagefrommybook/)

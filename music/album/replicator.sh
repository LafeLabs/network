mkdir myalbum
cd myalbum
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/album/replicator.php
php replicator.php
cd tracks
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/album/tracks/elements.mp3
cd ../images
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/album/images/qrcode.png
cd ..
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/album/index.html -O index.html
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/album/replicator.sh -O replicatorsh
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/album/README.md -O README.md
cd ..

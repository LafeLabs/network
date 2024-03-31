mkdir unfinishedunreleased
cd unfinishedunreleased
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/album/replicator.php
php replicator.php
cd tracks
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/tracks/Ain%27t%20Got%20Shit%20On%20Me.mp3
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/tracks/The%20Last%20Poet%20-%20Beatin%20Up%20A%20Bitch%20%28Monaleo%20Remix%29.mp3
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/tracks/The%20Last%20Poet%20-%20Beethoven.mp3
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/tracks/The%20Last%20Poet%20-%20Spacetime%20Diamond.mp3
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/tracks/the%20Last%20Poet%20-%20Crash%20Out.mp3
cd ../images
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/images/qrcode-page.png
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/images/qrcode.png
cd ..
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/index.html -O index.html
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/replicator.sh -O replicator.sh
wget https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/README.md -O README.md
cd ..

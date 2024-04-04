mkdir trashrobot
cd trashrobot
wget https://raw.githubusercontent.com/LafeLabs/network/main/page/replicator.php
php replicator.php
cd elements
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/elements/6x9-geometron-magic.pdf
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/elements/Trash_Magic_Manifesto.pdf
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/elements/first-book-of-geometron-lettersize.pdf
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/elements/main-large-geometron-magic.pdf
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/elements/tiny-geometron-magic.pdf
cd ../images
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/images/qrcode-page.png
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/images/qrcode.png
cd ..
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/index.html -O index.html
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/replicator.sh -O replicator.sh
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/README.md -O README.md
mkdir geometronmagic
cd geometronmagic
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/geometronmagic/replicator.php
php replicator.php
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/geometronmagic/data/scrollset.txt -O data/scrollset.txt
php scrollsetreplictor.php
cd ..
mkdir bookofgeometron
cd bookofgeometron
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/bookofgeometron/replicator.php
php replicator.php
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/bookofgeometron/data/scrollset.txt -O data/scrollset.txt
php scrollsetreplictor.php
cd ..
mkdir trashbook
cd trashbook
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/trashbook/replicator.php
php replicator.php
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/trashrobot/trashbook/data/scrollset.txt -O data/scrollset.txt
php scrollsetreplictor.php
cd ..
cd ..
sudo chmod -R 0777 *

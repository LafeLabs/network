mkdir gutenberg
cd gutenberg
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/gutenberg/replicator.php
php replicator.php
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/gutenberg/scrolls/home -O scrolls/home

mkdir aliceinwonderland
cd aliceinwonderland
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/gutenberg/replicator.php
php replicator.php
wget https://raw.githubusercontent.com/LafeLabs/pibrary/main/gutenberg/aliceinwonderland/data/scrollset.txt -O data/scrollset.txt
php scrollsetreplicator.php
cd ..

mkdir lookingglass
cd lookingglass
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/gutenberg/replicator.php
php replicator.php
wget https://raw.githubusercontent.com/LafeLabs/pi/main/library/lookingglass/data/scrollset.txt -O data/scrollset.txt
php scrollsetreplicator.php
cd ..

mkdir wizard-of-oz
cd wizard-of-oz
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/gutenberg/replicator.php
php replicator.php
wget https://raw.githubusercontent.com/LafeLabs/trashbook/main/gutenberg/fiction/wizard-of-oz/data/scrollset.txt -O data/scrollset.txt
php scrollsetreplicator.php
cd ..

mkdir KJV
cd KJV
wget https://raw.githubusercontent.com/LafeLabs/network/main/books/gutenberg/replicator.php
php replicator.php
wget https://raw.githubusercontent.com/LafeLabs/pibrary/main/gutenberg/chaosbible/data/scrollset.txt -O data/scrollset.txt
php scrollsetreplicator.php
cd ..


wget https://raw.githubusercontent.com/LafeLabs/network/main/books/gutenberg/replicator.sh -O replicator.sh


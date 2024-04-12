```
sudo wget https://raw.githubusercontent.com/LafeLabs/network/main/quantumart/replicator.sh -O replicator.sh
sh replicator.sh
```


```
sudo mkdir quantumart
cd quantumart
sudo wget https://raw.githubusercontent.com/LafeLabs/network/main/quantumart/php/replicator.txt -O replicator.php
sudo php replicator.php
cd ..
sudo chmod -R 0777 *
```


# QUANTUM ART DOT ORG

## [WWW.QUANTUMART.ORG](https://www.quantumart.org)

### DESTROY ALL BINARIES!

### NO WAR BUT THE MATH WAR!

REPLICATOR URL:

```
https://raw.githubusercontent.com/LafeLabs/network/main/quantumart/php/replicator.txt
```

REPLICATOR:

```
<?php

$dnaurl = "https://quantumart.org/data/dna.txt";

if(isset($_GET["dna"])){
    $dnaurl = $_GET["dna"];
}


$baseurl = explode("data/",$dnaurl)[0];
$dnaraw = file_get_contents($dnaurl);
$dna = json_decode($dnaraw);

mkdir("data");
mkdir("php");
mkdir("trashmagic");

copy("https://quantumart.org/php/replicator.txt","replicator.php");

foreach($dna->html as $value){
    
    copy($baseurl.$value,$value);

}


foreach($dna->data as $value){
    
    copy($baseurl."data/".$value,"data/".$value);
    
}



foreach($dna->php as $value){
 
    copy($baseurl."php/".$value,"php/".$value);
    copy($baseurl."php/".$value,explode(".",$value)[0].".php");

}
    

?>
<a href = "index.html">CLICK TO GO TO NEW PAGE</a>
<style>
body{
    background-color:#9f8767;
    font-family:Comic Sans MS;
    font-size:3em;
}

a{
    font-size:3em;
}
</style>

```

![](https://raw.githubusercontent.com/LafeLabs/quantumartdotorg/main/trashmagic/qrcode.png)

![](https://raw.githubusercontent.com/LafeLabs/quantumartdotorg/main/trashmagic/qrcode-page.png)
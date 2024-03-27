<?php

$dnaurl = "https://raw.githubusercontent.com/LafeLabs/mixtape/main/data/dna.txt";

if(isset($_GET["dna"])){
    $dnaurl = $_GET["dna"];
}


$baseurl = explode("data/",$dnaurl)[0];
$dnaraw = file_get_contents($dnaurl);
$dna = json_decode($dnaraw);

mkdir("data");
mkdir("php");
mkdir("trashmagic");
mkdir("mixtape");
mkdir("skins");

copy("https://raw.githubusercontent.com/LafeLabs/mixtape/main/php/replicator.txt","replicator.php");

foreach($dna->html as $value){
    
    copy($baseurl.$value,$value);

}


foreach($dna->data as $value){
    
    copy($baseurl."data/".$value,"data/".$value);
    
}

foreach($dna->skins as $value){
    
    copy($baseurl."skins/".$value,"skins/".$value);
    
}

foreach($dna->songs as $value){
    
    copy($baseurl."mixtape/".$value,"mixtape/".$value);
    
}


foreach($dna->php as $value){
 
    copy($baseurl."php/".$value,"php/".$value);
    copy($baseurl."php/".$value,explode(".",$value)[0].".php");

}
    


?>
<a href = "index.html">CLICK TO GO TO PAGE</a>
<style>
a{
    font-size:3em;
}
</style>

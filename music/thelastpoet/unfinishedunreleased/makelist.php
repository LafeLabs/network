<!-- 
this program generates the file data/dna.txt
dna.txt is a json formatted file which points to all the files in this system, which is then used by replciator.php to copy the whole thing.  The file names are local, so that the replicator can work when pointed at any address where this system lives, which could be any new instance, so that the system can replicate without any reference to some centralized repository such as one on github. 
-->
<a href = "editor.php">editor.php</a>
<p></p>
<a href = "index.html">index.html</a>

<br/>
<pre>
<?php
    
    $songsfiles = scandir(getcwd()."/mixtape");
    $tracks = [];
    
    foreach($songsfiles as $value){
        if($value[0] != "."){
            array_push($tracks,rawurlencode($value));
        }
    }
    
    $file = fopen("data/tracks.txt","w");// create new file with this name
    fwrite($file,json_encode($tracks,JSON_PRETTY_PRINT)); //write data to file
    fclose($file);  //close file

    echo json_encode($tracks,JSON_PRETTY_PRINT);

?>
</pre>

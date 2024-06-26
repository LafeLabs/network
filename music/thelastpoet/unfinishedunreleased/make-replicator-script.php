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

    $baseurl = "https://raw.githubusercontent.com/LafeLabs/network/main/music/thelastpoet/unfinishedunreleased/";
    
    $albumname = "unfinishedunreleased";//put your album name here
    $copyscript = "mkdir ".$albumname."\n";
    $copyscript .= "cd ".$albumname."\n";
    $copyscript .= "wget https://raw.githubusercontent.com/LafeLabs/network/main/music/album/replicator.php\n";
    $copyscript .= "php replicator.php\n";
    $copyscript .= "cd tracks\n";
    
    $list = json_decode("{}");
    
    $tracks = scandir(getcwd()."/tracks");
    $tracks_array = [];
    foreach($tracks as $value){
        if($value[0] != "."){
            array_push($tracks_array,rawurlencode($value));
            $copyscript .= "wget ".$baseurl."tracks/".rawurlencode($value)."\n";
        }
    }
    $list->tracks = $tracks_array;
    
    $copyscript .= "cd ../images\n";
    $images = scandir(getcwd()."/images");
    $images_array = [];
    foreach($images as $value){
        if($value[0] != "."){
            array_push($images_array,rawurlencode($value));
            $copyscript .= "wget ".$baseurl."images/".rawurlencode($value)."\n";            
        }
    }
    $list->images = $images_array;
    $copyscript .= "cd ..\n";
    $copyscript .= "wget ".$baseurl."index.html\n";
    $copyscript .= "wget ".$baseurl."replicator.sh\n";
    $copyscript .= "wget ".$baseurl."README.md\n";

    //$copyscript .= "wget replicator.sh";
    //$copyscript .= "wget README.md";

    $copyscript .= "cd ..\n";
    
    $file = fopen("replicator.sh","w");// create new file with this name
    fwrite($file,$copyscript); //write data to file
    fclose($file);  //close file

    echo $copyscript;
//    echo json_encode($list,JSON_PRETTY_PRINT);

?>
</pre>

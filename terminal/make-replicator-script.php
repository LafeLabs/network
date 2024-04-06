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

    $baseurl = "https://raw.githubusercontent.com/LafeLabs/network/main/page/";
    
    $setname = "mynewset";//put your set name here
    $copyscript = "mkdir ".$setname."\n";
    $copyscript .= "cd ".$setname."\n";
    $copyscript .= "wget https://raw.githubusercontent.com/LafeLabs/network/main/page/replicator.php\n";
    $copyscript .= "php replicator.php\n";
    $copyscript .= "cd elements\n";
    
    $elements = scandir(getcwd()."/elements");
    $elements_array = [];
    foreach($elements as $value){
        if($value[0] != "."){
            array_push($elements_array,rawurlencode($value));
            $copyscript .= "wget ".$baseurl."elements/".rawurlencode($value)."\n";
        }
    }

    $copyscript .= "cd ../images\n";
    $images = scandir(getcwd()."/images");
    $images_array = [];
    foreach($images as $value){
        if($value[0] != "."){
            array_push($images_array,rawurlencode($value));
            $copyscript .= "wget ".$baseurl."images/".rawurlencode($value)."\n";            
        }
    }
    $copyscript .= "cd ..\n";
    $copyscript .= "wget ".$baseurl."index.html -O index.html\n";
    $copyscript .= "wget ".$baseurl."replicator.sh -O replicator.sh\n";
    $copyscript .= "wget ".$baseurl."README.md -O README.md\n";
    $copyscript .= "cd ..\n";
    
    $file = fopen("replicator.sh","w");// create new file with this name
    fwrite($file,$copyscript); //write data to file
    fclose($file);  //close file

    echo $copyscript;
//    echo json_encode($list,JSON_PRETTY_PRINT);

?>
</pre>

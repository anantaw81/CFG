<?php


include "database.php";
$check=false;
if(isset($_POST["check"])){
    $check=true;
    $sentence=explode(" ", strtolower($_POST["sentence"]));
    $table=Array();

    //Pengisian awal array
    for($i=0; $i<count($sentence); $i++){
        for($j=0; $j<count($sentence); $j++){
            if($j==$i){
                $table[$i][$j]=cekLesikon($sentence[$i],$conn);
            }else if($j>=$i){
               $table[$i][$j]=null;
            }
            else{
                $table[$i][$j]='0';
            }
        }
    }
    

   //Proses pengisian tabel filling
    $iter=1;
    $arr1=array();
    $arr2=Array();
    $l=0;
    $r=0;
    for($i=count($sentence)-1; $i>=0; $i--){
        for($j=0; $j<$i; $j++){
            $cek='';
            $p= $j+$iter;
            $set=1;
            for($y=0; $y<$iter; $y++){
                $l= $j+$set-1;
                $r= $j+$set;
                //melakukan kombinasi
                $list=explode(' ',$table[$j][$l]);
                $list2=explode(' ',$table[$r][$p]);
                $arr1=getCombinations($list, $list2);
                $arr2=array_merge($arr2,$arr1);
                $arr1=[]; $list=[]; $list2=[];
                $set++;
                
            }
            $datahead=Array();
            $arr2=array_unique($arr2);
            //mengcek hasil union di db
            foreach($arr2 as $body){
                $query=mysqli_query($conn,"select * from rule where body='$body'");
                if(mysqli_num_rows($query)>0){
                    while($data=mysqli_fetch_array($query)){
                        array_push($datahead,$data['head']);
                    }
                }
            }

            $table[$j][$j+$iter]= implode(' ',array_unique($datahead));
            $arr2=[]; 
            
        }

    $iter++;
    }
    $validSentece='none';
    $sp = in_array('KSP',explode(' ',$table[0][count($sentence)-1]));
    $spo = in_array('KSPO',explode(' ',$table[0][count($sentence)-1]));
    $spk = in_array('KSPK',explode(' ',$table[0][count($sentence)-1]));
    $spok = in_array('KSPOK',explode(' ',$table[0][count($sentence)-1]));
    if($spok){
        $validSentece='VALID | Dideteksi : S P O K';
    }else if($spk){
        $validSentece='VALID | Dideteksi : S P K';
    }else if($spo){
        $validSentece='VALID | Dideteksi : S P O';
    }else if($sp){
        $validSentece='VALID | Dideteksi : S P';
    }else{
        $validSentece='TIDAK VALID';
    }
}

function cekLesikon($key,$conn){
    $query=mysqli_query($conn,"select * from rule where body='$key'");
    if(mysqli_num_rows($query)>0){
        while($data=mysqli_fetch_array($query)){
            $result[]=$data['head'];
        }
        return implode(' ',$result);
    }else{
        return "0";
    }
}

// fungsi untuk menghasilkan kombinasi
function getCombinations(...$arrays) {
	$result = [[]];
	foreach ($arrays as $property => $property_values) {
		$temp = [];
		foreach ($result as $result_item) {
			foreach ($property_values as $property_value) {
				$temp[] = array_merge($result_item, [$property => $property_value]);
			}
		}
		$result = $temp;
    }
    for($w=0; $w<count($result); $w++){ $result[$w]=implode(' ',$result[$w]); }
	return $result;
}

?>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#box").hide(1000);
            $("#tombol_hide").hide(1000);
            $("#tombol_hide").click(function() {
            $("#box").hide(1000);
            $("#tombol_show").show(1000);
            $("#tombol_hide").hide(1000);
            })
        
            $("#tombol_show").click(function() {
            $("#box").show(1000);
            $("#tombol_hide").show(1000);
            $("#tombol_show").hide(1000);
            })
        
        });
   </script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- CSS style.css-->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- Title -->
    <title>BSP</title>
    

  </head>
  
  <body>
    <div class="card card--margin card--padding">
        <center>
            <h4 class="text-success"><i class="bi bi-card-text"></i> Balinese Syntatic Parsing</h4>
        </center>
        <h5>Enter string :</h5>
        <form class="form-inline" action="" method="POST">
            <div>
                <input class="form-control mr-sm-2" name="sentence"type="text" placeholder="Enter a balinese sentence" required>
                <button class="btn btn-success" type="submit" name="check">Go</button>
            </div>
        </form>
        
        
        <?php if($check==true): ?>

            <!-- HASIL -->
            <br>
            <div class="container-fluid">
                <div class="col-12">
                    <div class="row background--color">
                        <div class="col-6">
                            <h6> <strong>Inputted Sentence :</strong></h6>
                            <p class="sentence--input"><?=$_POST['sentence'] ?></p>
                        </div>
                        <div class="col-6">
                            <h6> <strong>Checking Result :</strong></h6>
                            <?php if($validSentece!='TIDAK VALID'){?>
                                <p class="text-success text--bold"><?=$validSentece?></p>
                            <?php } else {?>
                                <p class="text-danger text--bold"><?=$validSentece?></p>
                            <?php } ?>
                            <!-- LIHAT TABEL FILLING -->
                        </div>
                    </div>
                </div>
            </div>
            

            <br>
            <h6> <strong>Filling Table :</strong></h6>
            
            <div>
                <button id="tombol_show" class="btn btn-success">Open Table</button>
            </div>
            <br>
            <div class="row justify-content-center" id="box">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <?php for($j=-1; $j<count($sentence); $j++){ ?>
                                  <?php if($j>=0){?>
                                     <th class="text-center bg-success text-white"> <?=$j?> </th>
                                  <?php }else{ ?>
                                      <th class="bg-success"> </th>
                                  <?php } ?>
                                <?php } ?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php  for($i=0; $i<count($sentence); $i++){ ?>
                                <tr>
                                    <?php for($j=-1; $j<count($sentence); $j++){ ?>
                                        <?php if($j!=-1){?>
                                            <td class="text-center"> <?= $table[$i][$j] ?> </td>
                                        <?php }else{ ?>
                                            <th class="text-center bg-success text-white"><?=$i?></th>
                                        <?php } ?>
                                    <?php } ?>
                                </tr>
                            <?php } ?>                 
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            
            <div>
                <button id="tombol_hide" class="btn btn-success">Close Table</button>
            </div>
            <br><br>


            
        <?php endif; ?>
        <br>
        <h5>Or Get :</h5>
            <div class="pb-5">
                <a href="akurasi.php" class="btn btn-outline-success"><i class="bi bi-alt"></i>System Accurracy Test</a>
            </div>
        <br>    
    </div>
    

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
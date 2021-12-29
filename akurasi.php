<?php


include "database.php";
$check=false;
$count=0; $yes=0; $no=0;
if(isset($_POST['uji'])){
    $check=true;
    $query=mysqli_query($conn,"select * from sentence");
    if(mysqli_num_rows($query)>0){
        while($data=mysqli_fetch_assoc($query)){
            $datatest[]=$data;
        }
    }

    
    for($e=0; $e<count($datatest); $e++){
        $sentence=explode(" ", strtolower($datatest[$e]["kalimat"]));
        $table=Array();

        //Pengisian awal array
        for($i=0; $i<count($sentence); $i++){
            for($j=0; $j<count($sentence); $j++){
                if($j==$i){
                    $table[$i][$j]=cekLesikon($sentence[$i],$conn);
                }else if($j>=$i){
                // $table[$i][$j]= $i.','.$j;
                $table[$i][$j]=null;
                }
                else{
                    $table[$i][$j]='0';
                }
            }
        }
        
        //var_dump($table);

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

                    //melakukan komninasi
                    $list=explode(' ',$table[$j][$l]);
                    $list2=explode(' ',$table[$r][$p]);
                    $arr1=getCombinations($list, $list2);
                    $arr2=array_merge($arr2,$arr1);
                    $arr1=[]; $list=[]; $list2=[];

                    $set++;
                    
                }
            
                //melakukan union 
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

        $validSentece='Tidak Valid';
        if( in_array('K',explode(' ',$table[0][count($sentence)-1])) ){
            $validSentece='Valid';
            $yes++;
        }else{
            $no++;
        }
        $validSistem[]=$validSentece;
        if($validSentece==$datatest[$e]["status"]){
            $count++;
        }
        $table=[];
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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <!-- CSS style.css-->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- Title -->
    <title>CFG</title>
    

  </head>
  
  <body>

  
    <div class="card card--margin card--padding">
      <div class="warna">
        <a href="index.php" class="btn btn-outline-success"><i class="bi bi-back"></i> Return </a>
        <center>
            <h4 class="text-success"><i class="bi bi-alt"></i>System Accurracy Test</h4>
        </center>
        <br>
        
        <div class="row justify-content-center">
        <?php if(!isset($_POST['uji'])) {?>
        <form action="" method="post">
            <center>
                <button type="submit" name="uji" class="btn btn-success mb-5" id="uji"><i class="bi bi-arrow-90deg-right"></i></i> Start</button>
            </center>
        </form>
        <?php }?>
        </div>
       
        
        <?php if(isset($_POST['uji'])): ?>

            <!-- TABEL PERBANDINGAN -->
            <br>
            <h6> <strong>Comparison Table :</strong></h6>

            <div class="row justify-content-center" id="box">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center bg-success text-white"></th>
                                <th class="text-center bg-success text-white">Sentence</th>
                                <th class="text-center bg-success text-white">Manual Validation</th>
                                <th class="text-center bg-success text-white">System Validation</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php  for($i=0; $i<count($datatest); $i++){ ?>
                                <tr>
                                   <td><?=$i+1?></td>
                                   <td><?=$datatest[$i]["kalimat"]?></td>
                                   <td><?=$datatest[$i]["status"]?></td>
                                   <?php if($datatest[$i]["status"]!=$validSistem[$i]){?>
                                        <td class="bg-danger text-white"><?=$validSistem[$i]?></td>
                                    <?php }else{ ?>
                                        <td><?=$validSistem[$i]?></td>
                                    <?php } ?>
                                   
                                </tr>
                            <?php } ?>                 
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="mb-5 mt-5">
                <center>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter"><i class="bi bi-eye-fill"></i> See Calculated Accuracy</button>
                </center>
            </div>
            
            
        <?php endif; ?>
     

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Hasil Perhitungan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                <p><strong>File Data Testing : </strong></p> 
                <p>Kalimat Valid : 14</p> 
                <p>Kalimat Tidak Valid : 1</p> 
                <br>
                <p><strong> Pada Sistem : </strong></p> 
                <p>Kalimat Valid : <?=$yes?></p> 
                <p>Kalimat Tidak Valid : <?=$no?></p> 
                <br>
                <p><strong> Perhitungan: </strong></p> 
                <p>Total validasi oleh sistem yang benar : <?=$count?></p> 
                <p>Total kalimat: <?=count($datatest)?></p> 
                <p><strong> Persentase: (<?=$count?> /  <?=count($datatest)?>)*100% = <?= round($count/count($datatest)*100,2)?>% </strong></p> 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
                </div>
            </div>
            </div>
        <!-- akhir modal -->


      </div>
    </div>
    

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <!-- Font awesome JQuery script -->
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" data-auto-replace-svg="nest"></script>

  </body>
</html>
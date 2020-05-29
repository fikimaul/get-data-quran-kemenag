<?php
   ini_set('max_execution_time', '0');

   $hostname="localhost";
   $database="quran_db";
   $username="root";
   $password="";

   //DO NOT EDIT BELOW THIS LINE
   $kon = mysqli_connect($hostname, $username, $password);
   mysqli_select_db($kon,$database) or die('Could not select database');
   mysqli_set_charset($kon,"utf8");
   function GetData($url){
      $base_url = "https://quran.kemenag.go.id/api/v1/";
      
      $curl_handle=curl_init();
      curl_setopt($curl_handle,CURLOPT_URL,$base_url.$url);
      curl_setopt($curl_handle,CURLOPT_CONNECTTIMEOUT,2);
      curl_setopt($curl_handle,CURLOPT_RETURNTRANSFER,1);
      $buffer = curl_exec($curl_handle);
      
      curl_close($curl_handle);
      if (empty($buffer)){ 
         return NULL;
      }
      else{
         return json_decode($buffer,true);
      }
   }

   
   $surat = GetData('surat/0/114');
   if(!empty($surat)){
      $data_surat = $surat['data'];
      $SQL = "INSERT INTO surat (id_surat,surat_name,surat_text,surat_terjemahan,count_ayat) VALUES ";
      $SQLA = "INSERT INTO ayat (ayat_id,surat_id,ayat_number,ayat_text,juz_id,ayat_translation) VALUES ";

      foreach($data_surat as $value){
         echo "Surat ".$value['id']." :: Jumlah Ayat :".$value['count_ayat']."<br/>";
         $SQL = $SQL.' ("'.$value['id'].'","'.$value['surat_name'].'","'.$value['surat_text'].'","'.$value['surat_terjemahan'].'","'.$value['count_ayat'].'"),';

         $ayat = GetData('ayatweb/'.$value['id'].'/0/0/'.$value['count_ayat']);
         if(!empty($ayat)){
            $data_ayat = $ayat['data'];
            $max_ayat =  count($data_ayat);
            $no_ayat = 1;

            echo "&nbsp; &nbsp; Ayat : ";
            foreach($data_ayat as $v){
               echo $v['aya_number'].",";
               $SQLA = $SQLA.' ("'.$v['aya_id'].'","'.$v['sura_id'].'","'.$v['aya_number'].'","'.$v['aya_text'].'","'.$v['juz_id'].'","'.$v['translation_aya_text'].'"),';
            }
         }
         echo "<br/>";
      }

      $result = mysqli_query($kon,substr($SQL,0,-1));
      $result = mysqli_query($kon,substr($SQLA,0,-1));
   }
?>
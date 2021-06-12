<?php

include 'koneksi.php';
    	
$nama_brg = $_POST['nama_brg'];
$stok = $_POST['stok'];
$harga = $_POST['harga'];

$connect->query("INSERT INTO tb_brg (nama_brg,stok,harga) VALUES ('".$nama_brg."','".$stok."','".$harga."')");


?>
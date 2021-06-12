
<?php

include 'koneksi.php';

$id_brg = $_POST['id_brg'];
$nama_brg = $_POST['nama_brg'];
$stok = $_POST['stok'];
$harga = $_POST['harga'];

$connect->query("UPDATE tb_brg SET nama_brg='".$nama_brg."', stok='".$stok."', harga='".$harga."' WHERE id_brg=". $id_brg);



?>
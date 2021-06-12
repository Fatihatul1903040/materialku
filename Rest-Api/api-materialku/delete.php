
<?php

include 'koneksi.php';

$id_brg=$_POST['id_brg'];

$connect->query(" DELETE FROM tb_brg WHERE id_brg = '".$id_brg."'" );



?>


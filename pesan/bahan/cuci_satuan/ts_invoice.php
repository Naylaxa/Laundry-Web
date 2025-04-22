<?php
    include '../asset/koneksi.php';
    include '../asset/header.php';

    session_start();
    if (!isset($_SESSION['user_id'])) {
        echo "<script> alert('Anda harus log in untuk mengakses halaman ini!');
        window.location.href='../index.php';</script>";
        exit();
    }

    // Ambil ID pengguna yang sedang login dari sesi
    $user_id = $_SESSION['user_id'];

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/invoice1.css">
</head> 
<body>
<div class="container">
    <?php
    // Query untuk mengambil data transaksi hanya untuk pengguna yang sedang login
    $id = $_GET['id'];
    $data = mysqli_query($koneksi, "SELECT * FROM users_, tr_cuci_satuan WHERE users_.id = '$user_id' and tr_cuci_satuan.id='$id'");
    if($data) {
        // Loop melalui hasil query dan tampilkan ambil transaksi
        while($d = mysqli_fetch_assoc($data)) {
    ?>
    <div class="box">
                <div class="hd">
                    <div class="gg">
                    <h1>Detail Transaksi</h1>
                    <button><a href="bayar.php?id=<?php echo $d['id']; ?>">Bayar Sekarang</a></button>
                    </div>
                    <div class="status">
                        <div class='label'>
                            <?php
                            if($d['paket_id'] == "1"){
                                echo "<h1 class='proses'>Jaket Kulit</h1>";
                            } else if($d['paket_id'] == "2"){
                                echo "<h1 class='proses'>Jaket Non Kulit</h1>";
                            } else if($d['paket_id'] == "3"){
                                echo "<h1 class='proses'>Boneka Kecil</h1>";
                            } else if($d['paket_id'] == "4"){
                                echo "<h1 class='proses'>Boneka Sedang</h1>";
                            } else if($d['paket_id'] == "5"){
                                echo "<h1 class='proses'>Boneka Besar</h1>";
                            } else if($d['paket_id'] == "6"){
                                echo "<h1 class='proses'>Sejadah</h1>";
                            } else if($d['paket_id'] == "7"){
                                echo "<h1 class='proses'>Selimut</h1>";
                            } else if($d['paket_id'] == "8"){
                                echo "<h1 class='proses'>Keset</h1>";
                            }
                        ?>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="data">
                    <div class="dt">
                        <h3>Pelanggan,</h3>
                        <p><?php echo $d['username']; ?></p>
                        <p><?php echo $d['alamat']; ?></p>
                        <p><?php echo $d['no_hp']; ?></p>
                    </div>
                    <div class="dt">
                        <h3>Date,</h3>
                        <p>Tgl Mulai. <?php echo $d['tgl_masuk']; ?></p>
                        <p>Tgl Selesai. <?php echo $d['tgl_keluar']; ?></p>
                    </div>
                    <div class="dt">
                        <h3>Durasi Kerja,</h3>
                        <h1><?php echo $d['waktu']; ?> Jam</h1>
                    </div>
                </div>
                <div class="tbl">
                    <table>
                        <tr>
                            <th>Jumlah</th>
                            <th>Harga Per-Kg</th>
                            <th>Total Bayar</th>
                        </tr>
                        <tr>
                            <td><?php echo $d['jumlah']; ?> kg</td>
                            <td><?php echo "Rp. " . number_format($d['tarif']) . " ,-"; ?></td>
                            <td><?php echo "Rp. " . number_format($d['total_bayar']) . " ,-"; ?></td>
                        </tr>
                    </table>
                    <div class="foot">
                        <h3>*SALAM BERSIH, SALAM SEHAT*</h3>
                    </div>
                </div>
            </div>
    <?php
        }
    } else {
        // Tampilkan pesan jika query tidak berhasil dieksekusi
        echo "Query error: " . mysqli_error($koneksi);
    }
    ?>
</div>


    <?php
    include '../asset/footer.php';
?>
</body>
</html>
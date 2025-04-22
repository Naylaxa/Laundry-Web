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
$id = $_GET['id'];

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/bukti1.css">
</head>
<body>
<div class="container">
    <?php
    // Query untuk mengambil data transaksi hanya untuk pengguna yang sedang login
    $id = $_GET['id'];
    $data = mysqli_query($koneksi, "SELECT * FROM users_, tr_cuci_komplit WHERE users_.id = '$user_id' and tr_cuci_komplit.id='$id'");
    if($data) {
        // Loop melalui hasil query dan tampilkan ambil transaksi
        while($d = mysqli_fetch_assoc($data)) {
    ?>
    <div class="box">
        <div class="hd">
            <h1>Transaksi <span>SUKSES</span></h1>
            <div class="status">
                <div class='label'>
                    <?php
                    if($d['paket_id'] == "1"){
                        echo "<h2 class='reguler'>Cuci Komplit Reguler</h2>";
                    } else if($d['paket_id'] == "2"){
                        echo "<h2 class='kilat'>Cuci Komplit Kilat</h2>";
                    } else if($d['paket_id'] == "3"){
                        echo "<h2 class='express'>Cuci Komplit Express</h2>";
                    }
                    ?>
                </div>
                <div class="cetak">
                    <a href="ts_cetak.php?id=<?php echo $id; ?>"><div class="imgf"><img src="img/printer.png" width="30px" alt=""></div></a>
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
                    <th>Berat</th>
                    <th>Harga Per-Kg</th>
                    <th>Total Bayar</th>
                </tr>
                <tr>
                    <td><?php echo $d['berat']; ?> kg</td>
                    <td><?php echo "Rp. " . number_format($d['tarif']) . " ,-"; ?></td>
                    <td><?php echo "Rp. " . number_format($d['total_bayar']) . " ,-"; ?></td>
                </tr>
                <?php 
                $query_paket = mysqli_query($koneksi, "SELECT nominal_bayar, metode_pembayaran FROM pembayaran WHERE id_komplit = $id");
                if (!$query_paket) {
                    die("Query paket gagal: " . mysqli_error($koneksi));
                }
                $row_paket = mysqli_fetch_assoc($query_paket);
                if (!$row_paket) {
                    echo "<script>alert('Data tidak valid!'); window.location.href='ts_invoice.php';</script>";
                    exit();
                }
                $bayar = $row_paket['nominal_bayar'];
                $total_harga = $d['total_bayar'];
                $harga = $bayar - $total_harga;
                
                $uang_kembali = $harga;
                ?>
                <tr>
                    <td colspan="2" class="nominal">Nominal Bayar</td>
                    <td><?php echo "Rp. " . number_format($bayar) . " ,-"; ?></td>
                </tr>
                <tr>
                    <td colspan="2" class="nominalpa">Uang Kembali</td>
                    <td><?php echo "Rp. " . number_format($uang_kembali) . " ,-"; ?></td>
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

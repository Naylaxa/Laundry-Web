
<?php
    include '../asset/koneksi.php';

    session_start();
    if (!isset($_SESSION['user_id'])) {
        echo "<script> alert('Anda harus log in untuk mengakses halaman ini!');
        window.location.href='../index.php';</script>";
        exit();
    }

    // Ambil ID pengguna yang sedang login dari sesi
    $user_id = $_SESSION['user_id'];

?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/cetak.css">
</head>
<body>
    <?php
    include '../asset/koneksi.php';
    ?>
    <div class="page" size="A4">
    <?php
    // Query untuk mengambil data transaksi hanya untuk pengguna yang sedang login
    $id = $_GET['id'];
    $data = mysqli_query($koneksi, "SELECT * FROM users_, tr_cuci_kering WHERE users_.id = '$user_id' and tr_cuci_kering.id='$id'");
    if($data) {
        // Loop melalui hasil query dan tampilkan ambil transaksi
        while($d = mysqli_fetch_assoc($data)) {
    ?>
        <div class="header">
            <div class="logo">
                <h1>TOP</h1>
                <h4>Laundry</h4>
            </div>
            <div class="inv">
                <h1>Invoice <span>SUKSES</span></h1>
                <p>Tgl. <?php echo $d['tgl_masuk']; ?></p>
            </div>
        </div>
        <hr>
        <div class="data-cust">
            <div class="cust">
                <div class="data">
                    <h3>Customer,</h3>
                    <h1><?php echo $d['username']; ?></h1>
                </div>
            </div>
            <div class="info">
                <div class="data">
                    <h3>Metode,</h3>
                    <h1>
                    <?php
                            if($d['paket_id'] == "1"){
                                echo "Cuci Kering Reguler";
                            } else if($d['paket_id'] == "2"){
                                echo "Cuci Kering Kilat";
                            } else if($d['paket_id'] == "3"){
                                echo "Cuci Kering Express";
                            }
                        ?>
                    </h1>
                </div>
            </div>
        </div>
        <div class="tbl">
            <table>
                <table>
                    <tr>
                        <th>Berat</th>
                        <th>Harga Per-Kg</th>
                        <th>Durasi</th>
                        <th>Total Bayar</th>
                    </tr>
                    <tr>
                        <td><?php echo $d['berat']; ?> kg</td>
                        <td><?php echo "Rp. " . number_format($d['tarif']) . " ,-"; ?></td>
                        <td><?php echo $d['waktu']; ?> jam</td>
                        <td><?php echo "Rp. " . number_format($d['total_bayar']) . " ,-"; ?></td>
                    </tr>
                    <?php 
                $query_paket = mysqli_query($koneksi, "SELECT nominal_bayar, metode_pembayaran FROM pembayaran WHERE id_kering = $id");
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
                </div>
                <?php } ?>
            </table>
        </div>
        <div class="foot">
            <h3>*SALAM BERSIH, SALAM SEHAT*</h3>
        </div>
        <?php
        }
     else {
        // Tampilkan pesan jika query tidak berhasil dieksekusi
        echo "Query error: " . mysqli_error($koneksi);
    }
    ?>
    </div>
    <script type="text/javascript">
        window.print();
    </script>
</body>
</html>
<?php
include '../asset/koneksi.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    echo "<script> alert('Anda harus log in untuk mengakses halaman ini!');
    window.location.href='../index.php';</script>";
    exit();
}

$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $transaksi_id = $_POST['transaksi_id'];
    $nominal_bayar = $_POST['nominal_bayar'];
    $metode_pembayaran = $_POST['metode_pembayaran'];

    $check_query = "SELECT * FROM pembayaran WHERE id_kering = '$transaksi_id' OR id_komplit = '$transaksi_id' OR id_satuan = '$transaksi_id'";
    $check_result = mysqli_query($koneksi, $check_query);

    if (mysqli_num_rows($check_result) > 0) {
        echo "<script>
            alert('Transaksi ini sudah dibayar sebelumnya.');
            window.location.href='ts_bukti.php?id=$transaksi_id';
        </script>";
        exit();
    }

    $result = mysqli_query($koneksi, "SELECT total_bayar FROM tr_cuci_kering WHERE id = '$transaksi_id'");
    $row = mysqli_fetch_assoc($result);
    $total_bayar = $row['total_bayar'];

    if ($nominal_bayar < $total_bayar) {
        echo "<script>
            alert('Nominal pembayaran tidak mencukupi! Harap masukkan nominal yang benar.');
            window.location.href='bayar.php?id=$transaksi_id';
        </script>";
        exit();
    }

    $id_kering = $transaksi_id;
    // $id_komplit = "NULL";
    // $id_satuan = "NULL";

    // $id_kering = $transaksi_id;

    $query = "INSERT INTO pembayaran (id_kering, id_komplit, id_satuan, user_id, nominal_bayar, metode_pembayaran) VALUES ($id_kering, null, null, '$user_id', '$nominal_bayar', '$metode_pembayaran')";
    
    if (mysqli_query($koneksi, $query)) {
        echo "<script>
            alert('Pembayaran berhasil!');
            window.location.href='ts_bukti.php?id=$transaksi_id';
        </script>";
    } else {
        echo "Error: " . mysqli_error($koneksi);
    }
}
?>

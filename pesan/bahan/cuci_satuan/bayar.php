<?php
include '../asset/koneksi.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    echo "<script> alert('Anda harus log in untuk mengakses halaman ini!');
    window.location.href='../index.php';</script>";
    exit();
}

$user_id = $_SESSION['user_id'];
$id = $_GET['id']; // Pastikan transaksi_id diambil dari URL atau sumber lain yang benar

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Pembayaran</title>
    <link rel="stylesheet" href="../payment .css">
</head>
<body>
    <div class="card-payment">
      <div class="icon-header">
         <img src="img/bayar.png" alt="Icon Payment" width="70">
      </div>

        <!-- Form Pembayaran -->
        <div class="payment-form">
         <h3>Pembayaran</h3>
         <form action="proses_pembayaran.php" method="POST">
             <input type="hidden" name="transaksi_id" value="<?php echo htmlspecialchars($id); ?>">
             <div class="form-group">
                 <label for="nominal_bayar">Nominal Bayar:</label>
                 <input type="number" name="nominal_bayar" id="nominal_bayar" required>
             </div>
             <div class="form-group">
                 <label for="metode_pembayaran">Metode Pembayaran:</label>
                 <select name="metode_pembayaran" id="metode_pembayaran" required>
                     <option value="cash">Cash</option>
                     <option value="transfer">Transfer</option>
                     <option value="debit">Debit</option>
                 </select>
             </div>
             <button type="submit">Bayar</button>
         </form>
     </div>
     <!-- End Form Pembayaran -->
</body>
</html>

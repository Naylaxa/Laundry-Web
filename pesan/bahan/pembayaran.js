document.addEventListener('DOMContentLoaded', function() {
    const formPembayaran = document.getElementById('formPembayaran');
    const resultDiv = document.getElementById('result');
    const resultMessage = document.getElementById('resultMessage');

    formPembayaran.addEventListener('submit', function(event) {
        event.preventDefault();  // Mencegah form dari submit secara default

        const nominal = document.getElementById('nominal').value;

        // Validasi input nominal
        if (nominal.trim() === '' || isNaN(nominal)) {
            resultMessage.textContent = 'Nominal tidak valid!';
            resultDiv.style.display = 'block';
            return;
        }

        // Buat objek untuk data yang akan dikirim
        const data = {
            nominal: nominal
        };

        // Kirim data menggunakan fetch API
        fetch('proses_pembayaran.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                resultMessage.textContent = 'Pembayaran berhasil!';
            } else {
                resultMessage.textContent = 'Pembayaran gagal: ' + data.message;
            }
            resultDiv.style.display = 'block';
        })
        .catch(error => {
            resultMessage.textContent = 'Terjadi kesalahan: ' + error.message;
            resultDiv.style.display = 'block';
        });
    });
});

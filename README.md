# sysrecon.sh

Script Bash untuk enumerasi awal sebuah sistem Linux. Mengumpulkan
identitas mesin, resource, user yang bisa login, konfigurasi jaringan,
port yang terbuka, dan file SUID ke dalam satu laporan.

Dibuat sebagai proyek akhir pembelajaran Linux fundamentals, sebagai
latihan langkah pertama seorang pentester setelah mendapat akses ke mesin.

## Fitur

- Identitas: user, host, kernel, distro
- Resource: penggunaan RAM dan disk
- Daftar user dengan shell login (bash/zsh)
- Jaringan: IP, gateway, DNS
- Port yang sedang listening
- Pencarian file SUID (kandidat privilege escalation)

## Cara pakai

\`\`\`bash
chmod +x sysrecon.sh
./sysrecon.sh          # sebagai user biasa
sudo ./sysrecon.sh     # sebagai root, hasil lebih lengkap
\`\`\`

Laporan tersimpan sebagai `recon_<host>_<tanggal>.txt`.

## Contoh output

Lihat `contoh/contoh-output.txt` (data jaringan sudah disensor).

## Catatan

File laporan asli tidak disertakan karena memuat informasi jaringan
internal. Jalankan sendiri untuk menghasilkan laporan di mesinmu.

## Dipelajari di proyek ini

- Redirection & stderr (`> `, `2>/dev/null`, `2>&1`)
- Command substitution `$(...)`
- Memproses teks dengan `grep`, `cut`, `awk`
- Membaca permission & bit SUID

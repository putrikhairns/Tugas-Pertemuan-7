program Soall3;
uses crt;

type
    TMataKuliah = record // record mengelompokkan data satu mata kuliah
    namaMK : string; 
    sks    : integer; 
    nilai  : string; 
    bobot  : real;  
    skor   : real;  
end;

    TMahasiswa = record // record mengelompokkan data satu mahasiswa
    nama      : string; 
    nim       : string; 
    jumlahMK  : integer;

    mk        : array[1..5] of TMataKuliah; // array menyimpan maksimal 5 mata kuliah
    totalSKS  : integer;
    totalSkor : real;
    ip        : real;
end;

var
    mhs : array[1..30] of TMahasiswa;  // array menyimpan maksimal 30 data mahasiswa
    jumlahMhs, i, j : integer; // i untuk urutan mahasiswa, j untuk urutan mata kuliah

begin
clrscr;

    writeln('PROGRAM HASIL STUDI MAHASISWA');
    writeln('============================');

repeat // mengulang input sampai jumlah mahasiswa berada antara 1 sampai 30
    write('Jumlah mahasiswa (1-30): ');
    readln(jumlahMhs);
until (jumlahMhs >= 1) and (jumlahMhs <= 30);

for i := 1 to jumlahMhs do // perulangan untuk memasukkan data setiap mahasiswa
begin
writeln;
    writeln('Mahasiswa ke-', i);
    writeln('----------------------------');

        write('Nama : '); // menyimpan nama dan nim mahasiswa ke-i
        readln(mhs[i].nama);

        write('NIM  : ');
        readln(mhs[i].nim);

repeat // mengulang input jika jumlah mata kuliah di luar 1 sampai 5
    write('Jumlah mata kuliah (1-5): ');
    readln(mhs[i].jumlahMK);
until (mhs[i].jumlahMK >= 1) and (mhs[i].jumlahMK <= 5);

    mhs[i].totalSKS := 0;
    mhs[i].totalSkor := 0;

for j := 1 to mhs[i].jumlahMK do // jumlah pengulangan mengikuti jumlah mata kuliah mahasiswa
    begin
    writeln;
        writeln('Mata kuliah ke-', j);

        write('Nama mata kuliah : ');
        readln(mhs[i].mk[j].namaMK); // i menunjukkan urutan mahasiswa, j menunjukkan urutan mata kuliah

        write('Jumlah SKS       : ');
        readln(mhs[i].mk[j].sks);

        write('Nilai (A/B+/B/C+/C/D/E): ');
        readln(mhs[i].mk[j].nilai);

// mengubah nilai huruf menjadi bobot
if mhs[i].mk[j].nilai = 'A' then mhs[i].mk[j].bobot := 4
        else if mhs[i].mk[j].nilai = 'B+' then mhs[i].mk[j].bobot := 3.5
            else if mhs[i].mk[j].nilai = 'B' then mhs[i].mk[j].bobot := 3
                else if mhs[i].mk[j].nilai = 'C+' then mhs[i].mk[j].bobot := 2.5
                    else if mhs[i].mk[j].nilai = 'C' then mhs[i].mk[j].bobot := 2
                        else if mhs[i].mk[j].nilai = 'D' then mhs[i].mk[j].bobot := 1
                            else if mhs[i].mk[j].nilai = 'E' then mhs[i].mk[j].bobot := 0
else mhs[i].mk[j].bobot := 0;

// skor mata kuliah = sks dikali dengan bobot nilai
    mhs[i].mk[j].skor := mhs[i].mk[j].sks * mhs[i].mk[j].bobot;

// menambahkan sks ke total sks sebelumnya
    mhs[i].totalSKS := mhs[i].totalSKS + mhs[i].mk[j].sks;

// menambahkan skor ke total skor sebelumnya
    mhs[i].totalSkor := mhs[i].totalSkor + mhs[i].mk[j].skor;
end;

// menghitung ip = total skor dibagi total sks
    mhs[i].ip := mhs[i].totalSkor / mhs[i].totalSKS;
end;

// menampilkan hasil 
    for i := 1 to jumlahMhs do
begin
clrscr;

    writeln('HASIL STUDI MAHASISWA');
    writeln('Nama : ', mhs[i].nama);
    writeln('NIM  : ', mhs[i].nim);

    writeln('-------------------------------------------------------------------');
    writeln('  No  |          Mata Kuliah          |  SKS  | Nilai  |  Skor ');
    writeln('-------------------------------------------------------------------');

    for j := 1 to mhs[i].jumlahMK do
    begin
        write(j:3, '  | '); // nomor urut
        write(mhs[i].mk[j].namaMK:30, ' | '); // kolom mata kuliah
        write(mhs[i].mk[j].sks:3, '  | '); // kolom sks
        write(mhs[i].mk[j].nilai:5, '  | '); // kolom nilai
    writeln(mhs[i].mk[j].skor:5:1, ' '); // kolom skor dengan 1 angka di belakang koma
    end;

    writeln('-------------------------------------------------------------------');

// menampilkan hasil perhitungan
    writeln('Total skor : ', mhs[i].totalSkor:0:1);
    writeln('Jumlah SKS : ', mhs[i].totalSKS);
    writeln('IP         : ', mhs[i].ip:0:2);
writeln;

if i < jumlahMhs then
    writeln('Tekan sembarang tombol untuk data selanjutnya...')
else
    writeln('Semua data selesai. Tekan sembarang tombol...');

readkey; // menunggu tombol ditekan sebelum melanjutkan program
end;
end.

.model small
.code
org 100h
start:
    jmp mulai

nama        db 13,10,'Nama Anda : $'
nomor       db 13,10,'Nomor HP  : $'
domisili    db 13,10,'Domisili  : $' 
lanjut      db 13,10,'Lanjut tekan y untuk lanjut >>>>>>>>>>>>> $'
tampung_nama        db 30,?,30 dup(?)
tampung_nomor       db 13,?,13 dup(?)
tampung_domisili    db 30,?,30 dup(?)


a db 01
b db 02
c db 03
d db 04
e db 05
j dw 15


daftar  db 13,10,'+-----------------------------------------------------------------+'
                db 13,10,'+------------------PENDAFTARAN PENDIDIKAN DAN PELATIHAN-------------------------'
                db 13,10,'+-------------------------------------------------------------------------------'
                db 13,10,'|      JENIS PELATIHAN        |          LOKASI       |      HARGA BIMBINGAN   |'
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|01|  PELATIHAN DASAR         |   KODIM 0315 BINTAN   |         3,500,000      |'
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|02|  PELATIHAN SURVIVAL      |    LANTAMAL IV TNJ    |         10,750,000     |'
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|03| BIMBINGAN BINA FISIK     | KOREM 033/WIRA PRATAMA|         8,000,000      |'    
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|04|  BIMBINGAN AKADEMIK      | LANUD RAJA HAJIFSB TNJ|         12,500,000     |'
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|05| PELATIHAN PASKIBRAKA     |     POLRES BINTAN     |           GRATIS       |'
                db 13,10,'+--+----------------------------------------------------------------------------' 
                
                                
pilih_spt   db 13,10,'Silahkan Masukkan Kode Jenis Pelatihan yang anda pilih $'
succes      db 13,10,'Selamat Anda Berhasil $'
error       db 13,10,'Pilihan Anda Tidak Tersedia $'

mulai:
        mov ah,09
        lea dx, nama
        int 21h
        mov ah,0ah
        lea dx, tampung_nama
        int 21h
        push dx  
        
        mov ah,09
        lea dx, nomor
        int 21h
        mov ah,0ah
        lea dx, tampung_nomor
        int 21h
        push dx    
        
        mov ah,09
        lea dx, domisili
        int 21h
        mov ah,0ah
        lea dx, tampung_domisili
        int 21h
        push dx  
        
        mov ah,09h
	    mov dx,offset daftar
	    int 21h
	    mov ah,09h
    	mov dx,offset lanjut
	    int 21h
	    mov ah,01h
	    int 21h
	    cmp al,'y'
	    je proses
	    jne error_nsg   
	    
error_nsg:
    mov ah,09h
    mov dx, offset error
    int 21h
    int 20h
    
proses:
    mov ah,09h
    mov dx,offset pilih_spt
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2


    cmp bh,'0'
    cmp bl,'3'
    je hasil3


    cmp bh,'0'
    cmp bl,'4'
    je hasil4
    
    cmp bh,'0'
    cmp bl,'5'
    je hasil5
    
    
    
;------------------------------------------------------------------------ 
hasil1:
    mov ah,09h
    lea dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    lea dx,teks2
    int 21h
    int 20h

hasil3:
    mov ah,09h
    lea dx,teks3
    int 21h
    int 20h

hasil4:
    mov ah,09h
    lea dx,teks4
    int 21h
    int 20h    
    
hasil5:
    mov ah,09h
    lea dx,teks5
    int 21h
    int 20h
    
    
;------------------------------------------------------------------------
teks1		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH PELATIHAN DASAR' 
		db 13,10,'Bertempat di KODIM 0315 BINTAN'
		db 13,10,'Biaya Pelatihan : Rp 3,500,000'
		db 13,10,'Terima Kasih $'

teks2		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH PELATIHAN SURVIVAL' 
		db 13,10,'Bertempat di LANTAMAL IV TANJUNGPINANG'
		db 13,10,'Biaya Pelatihan : Rp 10,750,000'
		db 13,10,'Terima Kasih $'

teks3		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH BIMBINGAN BINA FISIK' 
		db 13,10,'Bertempat di KOREM 033/WIRA PRATAMA'
		db 13,10,'Biaya Pelatihan : Rp 8,000,000'
		db 13,10,'Terima Kasih $'

teks4		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH BIMBINGAN AKADEMIK' 
		db 13,10,'Bertempat di LANUD RAJA HAJIFSB TNJ'
		db 13,10,'Biaya Pelatihan : 12,500,000'
		db 13,10,'Terima Kasih $'

teks5		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH PELATIHAN PASKIBRAKA' 
		db 13,10,'Bertempat di POLRES BINTAN'
		db 13,10,'Biaya Pelatihan : GRATIS'
		db 13,10,'Terima Kasih $'



end start        	                
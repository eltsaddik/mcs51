org 		4000h
ljmp	start
org		4100h
start:
           	nop
           	call 	initserial
           	mov 	dptr,#MyCharacter
gets: 
		clr 	A
           	Movc 	A,@A+dptr
           	cjne 	A,#0,Next
           	sjmp 	getout
Next: 
		call 	sendout
           	inc 	dptr
           	sjmp 	gets
           
getout:  
	  	sjmp 	start
initserial:
           	mov 	scon,#52h ; Konfigurasi komunikasi serial mode 1
           	mov	tmod,#20h ; Baud rate 2400 BPS
           	mov 	th1,#0F3H
           	setb 	tr1
           	ret 
           	       
inchar:
detecti:
		jnb 		ri,detecti ; Deteksi bit RI apakah data sudah diterima  atau belum 
           	clr 		ri
           	mov 	a,sbuf
           	Subb 	A,#30h
           	Mov 	R0,A
           	ret
           
Sendout:
detecto:
		jnb 	ti,detecto; 
           	clr 	ti ; 
           	mov 	sbuf,a ; 
           	ret
MyCharacter:
           DB '$GPGGA,040824.726,0733.5091,S,11051.4830,E,1,05,1.9,130.6,M,5.6,M,,0000*73',13,10,0
           End

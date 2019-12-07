Include irvine32.inc 

.data 

msg byte "hello world",0
len  = (($-msg)-1)

.code
xor eax, eax

reverse proc
	mov ecx,len
	mov esi,0

	l1:

		movzx eax,msg[esi]
		push eax
		inc esi
		loop l1

	mov ecx,len
	mov esi,0

	l2:
		pop eax
		mov msg[esi],al
		inc esi
		loop l2

	mov edx,offset msg
	call writestring
	ret
reverse endp
main proc

	call reverse

exit
main endp
end main
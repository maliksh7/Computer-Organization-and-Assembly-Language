include irvine32.inc 

Student STRUCT

	Age Byte 0
	Gender Word 10 DUP(0)
	Address Word 10 DUP(0)

Student ENDS

.data
	st1 Student <>
	st2 Student <>
	st3 Student <>

	message1 byte "Enter Student's data. In thr order Age, Gender, Address ", 0

	age Byte "Age of Student is: ", 0Dh, 0Ah, 0
	gender Byte "Gender of Student is: ", 0Dh, 0Ah, 0
	address Byte "Address of Student is ", 0Dh, 0Ah, 0

.code
main proc
	mov edx, offset message1
	call writestring
	call crlf

	;Enter age
	call readint
	mov st1.Age , al

	
	;Enter Gender
	mov edx, offset st1.Gender
	mov ecx, (sizeof st1.Gender)
	call readstring

	;Enter Address
	mov edx , offset st1.Address
	mov ecx , (sizeof st1.Address)
	call readstring

	;Show age
	mov edx, offset age
	call writestring
	mov al,  st1.Age
	call writeint
	call crlf

	;Show Gender
	mov edx, offset gender
	call writestring
	mov edx ,offset st1.Gender
	call writestring
	call crlf

	;Show address
	mov edx, offset address
	call writestring
	mov edx,offset st1.Address
	call writestring
	call crlf

exit
main ENDP
end main


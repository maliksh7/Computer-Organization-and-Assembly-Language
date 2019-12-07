include irvine32.inc

Employee STRUCT
	IdNum BYTE "0000000"
	LastName BYTE 30 DUP(0)
	Years WORD 0
	SalaryHistory DWORD 0, 0, 0, 0
Employee ENDS

.data
	message1 byte "Enter Employee's data. In thr order ID, LastName, Years Worked and salary history ", 0
	message2 byte "Employee's Record, In the order  ID, LastName, Years Worked and salary history " , 0
	
	Id byte "User ID is: ", 0Dh, 0Ah, 0
	LName byte "Last Name: ", 0Dh, 0Ah, 0
	YearsWorked byte "Years Worked: ", 0Dh, 0Ah, 0
	SHistory byte "Salary History is ", 0Dh, 0Ah, 0

	person1 Employee <>
	person2 Employee <>
	person3 Employee <>
	person4 Employee <>
	person5 Employee <>

.code
main proc

	mov edx, offset message1
	call writestring
	call crlf

	xor eax,eax

	;Enter ID
	mov edx, offset person1.IdNum
	mov ecx, (sizeof person1.IdNum)
	call readstring

	;Enter LastName
	mov edx, offset person1.LastName
	mov ecx, (sizeof person1.LastName)
	call readstring

	;Enter Years Worked
	call readint
	mov person1.Years , ax

	;Enter Salary History
	mov cx, 4
	mov esi, offset person1.SalaryHistory

	L1:
		call readint
		mov DWORD PTR [esi] , eax
		add esi, 4
	loop L1

	mov edx , offset message2
	call writestring
	call crlf

	;Show IdNum
	mov edx, offset Id
	call writestring 
	mov edx, offset person1.IdNum
	call writestring
	call crlf

	;Show LastName
	mov edx, offset LName
	call writestring
	mov edx, offset person1.LastName
	call writestring
	call crlf

	;Show Years Worked
	mov edx, offset YearsWorked
	call writestring
	mov ax, person1.Years
	call writedec
	call crlf

	;Show Salary history
	mov edx, offset SHistory
	call writestring
	mov cx, 4
	mov esi , offset person1.SalaryHistory

	L2:
		mov eax, [esi]
		call writedec
		call crlf
		add esi, 4
	loop L2
	
exit
main ENDP
end main


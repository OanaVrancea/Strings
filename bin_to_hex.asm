%include "io.mac"

section .text
    global bin_to_hex
    extern printf

bin_to_hex:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; hexa_value
    mov     esi, [ebp + 12]     ; bin_sequence
    mov     ecx, [ebp + 16]     ; length
    ;; DO NOT MODIFY

  
  	xor eax,eax
    add eax,ecx				;pun in eax numarul de biti

inplus:
    sub eax,4				;scad 4 pana obtin o valoare mai mica sau egala cu aceasta pentru a vedea cati biti sunt in plus		
    cmp eax,4
    jg inplus

    sub ecx,ecx
    cmp eax,4
    jl inceput				;daca sunt mai putin de 4 biti inseamna ca sunt maxim 3 biti in plus si trebuie verficat ce valoare pot
    cmp eax,4
    je label                ;daca nu sunt mai putini de 4 biti pot incepe sa ii grupez in cate 4

inceput:
	
	cmp eax,1               ;cazul in care am 1 bit in plus
	je unbitinplus
	cmp eax,2               ;caz in care am 2 biti in plus 
	je bitinplus2
	cmp eax,3               ;caz in care am 3 biti in plus
	je bitinplus3

bit1:                       ;de aici am toate cazurile posibile pentru bitii care sunt "in plus"
	mov byte[edx],'1'
	inc edx
	jmp label1

bit0:
	mov byte[edx],'0'
	inc edx
	jmp label1

bit2:
	mov byte[edx],'2'
	inc edx
	jmp label1

bit3:
	mov byte[edx],'3'
	inc edx
	jmp label1

bit4:
	mov byte[edx],'4'
	inc edx
	jmp label1

bit5:
	mov byte[edx],'5'
	inc edx
	jmp label1

bit6:
	mov byte[edx],'6'
	inc edx
	jmp label1

bit7:
	mov byte[edx],'7'
	inc edx
	jmp label1

incrementare:
	add ecx,1
	jmp unbitinplus

incrementare2:
	add ecx,1
	jmp bitinplus2

unbitinplus:
	cmp byte[esi + ecx],'1'
	je bit1
	cmp byte[esi + ecx],'0'
	je bit0

bitinplus2:
	cmp byte[esi + ecx],'1'
	je bit112
	cmp byte[esi + ecx],'0'
	je incrementare

bit112:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bit3
	cmp byte[esi + ecx],'0'
	je bit2


bitinplus3:
	cmp byte[esi + ecx],'1'
	je bit3112
	cmp byte[esi + ecx],'0'
	je incrementare2

bit3112:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bit11213
	cmp byte[esi + ecx],'0'
	je bit11203


 bit11213:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bit7
	cmp byte[esi + ecx],'0'
	je bit6

bit11203:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bit5
	cmp byte[esi + ecx],'0'
	je bit4

label1:
	xor ecx,ecx
	add ecx,eax
	jmp label

label:
	mov bl, [esi + ecx]               ;de aici incep sa parcurg valorile cate 4 pentru a vedea ce valoarea in hexa ii corespunde
	cmp bl,'1'
	je bitl11
	cmp bl,'0'
	je bitl10

return:
	add ecx,1
	cmp byte[esi + ecx + 1],0
	je ret
	cmp byte[esi + ecx + 1],0
	jne label


bitl11:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl1121
	cmp byte[esi + ecx],'0'
	je bitl1120

bitl1121:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl112131
	cmp byte[esi + ecx],'0'
	je bitl112130

bitl1120:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl112031
	cmp byte[esi + ecx],'0'
	je bitl112030

bitl112131:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitlF
	cmp byte[esi + ecx],'0'
	je bitlE

bitl112130:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitlD
	cmp byte[esi + ecx],'0'
	je bitlC

bitl112031:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitlB
	cmp byte[esi + ecx],'0'
	je bitlA

bitl112030:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl9
	cmp byte[esi + ecx],'0'
	je bitl8

bitl10:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl1021
	cmp byte[esi + ecx],'0'
	je bitl1020

bitl1021:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl102131
	cmp byte[esi + ecx],'0'
	je bitl102130

bitl1020:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl102031
	cmp byte[esi + ecx],'0'
	je bitl102030

bitl102131:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl7
	cmp byte[esi + ecx],'0'
	je bitl6

bitl102130:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl5
	cmp byte[esi + ecx],'0'
	je bitl4

bitl102031:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl3
	cmp byte[esi + ecx],'0'
	je bitl2

bitl102030:
	add ecx,1
	cmp byte[esi + ecx],'1'
	je bitl1
	cmp byte[esi + ecx],'0'
	je bitl0

bitl0:                               ;aici am cazurile pentru fiecare grupare posibila de 4 biti
	mov byte[edx],'0'
	inc edx
	jmp return

bitl1:
	mov byte[edx],'1'
	inc edx
	jmp return

bitl2:
	mov byte[edx],'2'
	inc edx
	jmp return

bitl3:
	mov byte[edx],'3'
	inc edx
	jmp return

bitl4:
	mov byte[edx],'4'
	inc edx
	jmp return

bitl5:
	mov byte[edx],'5'
	inc edx
	jmp return

bitl6:
	mov byte[edx],'6'
	inc edx
	jmp return

bitl7:
	mov byte[edx],'7'
	inc edx
	jmp return

bitl8:
	mov byte[edx],'8'
	inc edx
	jmp return

bitl9:
	mov byte[edx],'9'
	inc edx
	jmp return

bitlA:
	mov byte[edx],'A'
	inc edx
	jmp return

bitlB:
	mov byte[edx],'B'
	inc edx
	jmp return

bitlC:
	mov byte[edx],'C'
	inc edx
	jmp return

bitlD:
	mov byte[edx],'D'
	inc edx
	jmp return

bitlE:
	mov byte[edx],'E'
	inc edx
	jmp return

bitlF:
	mov byte[edx],'F'
	inc edx
	jmp return


ret:
	mov byte[edx],`\n`
	inc edx
	mov byte[edx],`\0`

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
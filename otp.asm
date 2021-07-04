%include "io.mac"

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
  

label:
    
    xor ebx, ebx								; "curat" registrul ebx

    mov al, [edi + ecx - 1]						; pun in al ultimul caracter al cheii 

    mov bl, al									; pe care il transfer in bl 

    xor eax,eax									;eliberez eax de orice valoare

    mov al, [esi + ecx - 1]						;il folosesc pentru a retine ultimul caracter din plaintext
 
    xor eax, ebx								;folosesc xor pe cele 2 caractere
  
    mov byte [edx + ecx - 1] , al			  	;pun rezultatul in edx la pozitia ecx - 1	
  

	loop label									;trec la litera anteriora

 
    popa
    leave
    ret

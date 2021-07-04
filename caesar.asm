%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    xor ebx,ebx
    mov eax, edi                     ;pun in eax valoarea cheii           

label:
    
    xor ebx,ebx

    mov bl, [esi + ecx - 1]         ; pun in bl ultimul caracter din plaintext


   cmp ebx,'a'                      ; daca codul ascii al caracterului este mai mare decat cel al literei 'a'
   jge conditie1                    ; verificam daca este litera mica sau nu

   cmp ebx,'Z'                     ; daca codul ascii al caracterului este mai mic decat cel al literei 'Z'
   jle conditie2                    ; verificam daca este litera mare sau nu

   jmp scriere                      ; daca are codul ascii cuprins intre codul ascii al lui 'Z' si 'a' este caracter
                                    ;si il vom scrie asa cum este


conditie1:
    cmp ebx,'z'                     ;daca codul ascii este cuprins intre cel al literei a si al literei 'z'
    jle litera_mica                 ; am gasit o litara mica
    cmp ebx,'z'                     ;daca este mai mare decat codul ascii al lui 'z'   
    jge scriere                     ;am gasit un caracter si il vom scrie, nu il modificam


conditie2:
    cmp ebx,'A'                     ;daca codul ascii este cuprins intre cel al literei 'A' si al literei 'Z'
    jge litera_mare                 ; am gasit o litara mare
    cmp ebx,'A'                     ;daca este mai mic decat codul ascii al lui 'A' 
    jle scriere                     ;am gasit un caracter si il vom scrie, nu il modificam


litera_mica:
    add ebx,  eax                   ;adaug la litera mica valoarea cheii
    cmp ebx, 'z'                    ; daca depaseste codul ascii al literei 'z' inseamna ca trebuie modificat
    jg scadere
    cmp ebx, 'z'                    ;daca este cuprins intre 'a' si 'z' il scriem
    jl scriere

litera_mare:
    add ebx,  eax                   ;adaug la litera mica valoarea cheii
    cmp ebx, 'Z'                    ; daca depaseste codul ascii al literei 'Z' inseamna ca trebuie modificat
    jg scadere  
    cmp ebx, 'Z'                    ;daca este cuprins intre 'A' si 'Z' il scriem
    jl scriere
    
scadere:
    sub ebx, 26                     ;daca valoarea depaseste codul ascii maxim respectiv trebuie scazut 26 (numarul de litere)
    cmp ebx, 'z'                   
    jg scadere                      ;daca inca depaseste valoarea necesara se va scadea in continuare
    jmp scriere                     ; daca are o valoare ascii corespunzatoare unei litere o vom scrie

scriere:
    mov byte [edx + ecx - 1],bl      ;scriem in edx la pozitia ecx - 1 caracterul "criptat"

    loop label                      ;scadem ecx



    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
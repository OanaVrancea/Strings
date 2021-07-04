%include "io.mac"

section .data
   ; count db 1

section .text
    global vigenere
    extern printf

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY

  
     sub ebx,ebx
     sub ecx,ecx

label: 

    xor eax, eax                        
    mov al, [esi + ecx]                 ; pun in al primul caracter din plaintext
    cmp al,'A'                          ; il compar cu 'A'
    jl next_char                        ; daca este mai mic sigur nu e litera
    cmp al, 'Z'                         ; il compar cu 'Z'
    jle conditie                        ; daca este mai mic decat 'Z' este litera mare si sar la conditie
    cmp al,'a'                          ; daca are valoarea mai mica decat 'a' si mai mare decat 'Z' NU e litera
    jl next_char                        
    cmp al,'z'                          ;daca are valoarea mai mare decat 'z' nu e litera
    jg next_char


conditie:                               ;daca a ajuns la acest label sigur e litera (mica)
   
    cmp byte[edi + ebx], 0              ;daca cheia nu a ajuns la final inca avem o litera
    jne aux            
    cmp byte[edi + ebx], 0              ;daca am ajuns cu indexul la finalul cheii sarim la initializare
    je initializare

aux:
  
    jmp found_letter                    ;am gasit o litera

initializare:
   
    sub ebx,ebx                         ;aici fac ca valoarea lui ebx = 0 pentru a parcurge cheia ciclic

found_letter:

    mov al, byte[edi + ebx]             ; salvez caracterul in al
    mov [edx + ecx] ,  al               ; in edx voi construi initial cheia extinsa 
    add ebx,1                           ; ma mut la urmatoarea litera


next_char:
    
     mov [edx + ecx], al               ;daca caracterul nu este litera il pun in cheia extinsa asa cum este
     add ecx,1                          ;voi scrie la urmatoarea pozitie in ecx
     cmp byte[esi + ecx],0             ;cat timp plaintext mai are caractere repetam procesul pentru a obtine cheia extinsa
     jne label



    sub ecx,ecx

    xor ebx,ebx
    xor eax, eax

label2:                                  ;in acest label verific daca caracterul parcurs este litera sau nu

    xor eax, eax                
    mov bl,[esi + ecx]
    cmp bl,'A'
    jl scriere
    cmp bl, 'Z'
    jle litera_mare
    cmp bl,'a'
    jl scriere
    cmp bl,'z'
    jg scriere
    jmp litera_mica

litera_mica:

    mov al,[edx + ecx]                 ; pun in al prima litera (mica)
    sub al, 39                          ; ii calculez "deplasarea" corespunzatoare
    add bl, al                          ; deplasez litera bl cu al pozitii
    cmp ebx, 'z'                        ; daca depasesc 'z' trebuie sa fac sa pornesc iar de la litera 'a'
    jg scadere1


litera_mare:                            ;aplic acelasi rationament si pentru litere mari

    mov al, [edx + ecx]
    sub al, 39
    add bl,  al
    cmp ebx, 'Z'
    jg scadere2

    
scadere1:                               ; voi scadea dimensiunea alfabetului pana obtin o litera mica
    sub ebx, 26
    cmp ebx, 'z'
    jg scadere1
    jmp scriere

scadere2:                               ; acelasi lucru si pentru litera mare
    sub ebx, 26
    cmp ebx, 'Z'
    jg scadere2
    jmp scriere

scriere:
    mov byte [edx + ecx ],bl            ; pun rezultatul final in edx

    add ecx,1                            ; ma mut la urmatorul caracter din cheia extinsa
    cmp byte[esi + ecx ],0               ; daca nu am ajuns la final repet procedeul    
    jne label2


    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
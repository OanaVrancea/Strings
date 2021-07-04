%include "io.mac"

section .data
   ; count db 0
section .text
    global my_strstr
    extern printf

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY


    sub ecx,ecx
    sub edx,edx    

label:
    
    mov al,[esi + ecx]          ;iau primul caracter din sirul mare
    cmp [ebx + edx ], al        ;daca este egal cu primul caracter din subsir le comapr
    je comparare
    cmp [ebx + edx ], al            
    jne part2

comparare:                      
    add edx,1                   ;trec la urmatoarele caractere pentru ambele siruri
    add ecx,1
    mov al,[esi + ecx ]
    cmp [ebx + edx ], al        ;daca le compar si sunt egale
    je comparare                ;continui sa le compar      
    cmp [ebx + edx ], al        ;daca nu mai sunt egale verific daca tot subsirul s-a regasit in sir 
    jne concluzie

concluzie:
    cmp byte[ebx + edx],0       ;daca am gasit tot subsirul in sir sar la afisare
    je afisare
    cmp byte[ebx + edx],0       ;daca nu s-a gasit continui sa vad ce se intampla
    jne part2

part2:
    sub edx,edx 
    cmp byte[esi + ecx + 1],0  ;daca s-a terminat sirul mare trec la afisare
    je afisare2  
    add ecx,1                  ;altfel incrementez ecx
    cmp byte[esi + ecx],0      ;daca nu s-a terminat sirul repet algoritmul
    jne label  

afisare2:                     ;afisare in caz ca nu s-a gasit subsirul
    add ecx,2
    mov eax,ecx
    add eax,1                 ;trebuie sa adun 1 pentru ca numaratoare pleaca de la 0 
    mov [edi],eax
   
 afisare:                      ;afisare in caz ca s-a gasit sirul
    mov eax,ecx                ;deoarece am parcurs tot subsirul, trebuie sa ii scadem valoarea pentru a gasi indexul bun
    sub eax,edx
    mov [edi],eax



    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

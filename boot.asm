org 0x7c00
start:
    mov ax, 0xb800
    mov es, ax
    xor di, di
    mov cx, 2000
    mov ax, 0x0720
    rep stosw
    ; ОКЛЫДРЫН МЕМ
    mov byte [es:0x7ce], 'O'
    mov byte [es:0x7cf], 0x8f
    mov byte [es:0x7d0], 'K'
    mov byte [es:0x7d1], 0x8f
    ; переход в защищенку
    cli 
    lgdt [gdt_desc]

    mov eax, cr0
    or eax, 1
    mov cr0, eax  

    jmp 0x08:protected_mode 

; 32 бита убили другие биты и такое типо туц туц тутацвпвапавырваро
bits 32
protected_mode:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    mov edi, 0xb8000 + (12 * 80 + 38) * 2    
        mov byte [edi], 'O'     
        mov byte [edi+1], 0x0a 
        mov byte [edi+2], 'K'    
        mov byte [edi+3], 0x0a    
        mov byte [edi+4], 'L'
        mov byte [edi+5], 0x0a
        mov byte [edi+6], 'I'
        mov byte [edi+7], 0x0a
        mov byte [edi+8], 'D'
        mov byte [edi+9], 0x0a
        mov byte [edi+10], 'R'
        mov byte [edi+11], 0x0a
        mov byte [edi+12], 'I'
        mov byte [edi+13], 0x0a
        mov byte [edi+14], 'N'
        mov byte [edi+15], 0x0a

    jmp $

; дескрипторы
gdt_start:
    dq 0x0000000000000000
gdt_code:
    dw 0xffff 
    dw 0x0000
    db 0x00
    db 0x9a  
    db 0xcf 
    db 0x00

gdt_data:
    dw 0xffff
    dw 0x0000 
    db 0x00
    db 0x92
    db 0xcf  
    db 0x00 
gdt_end:
gdt_desc:
dw gdt_end - gdt_start - 1  
dd gdt_start



times 510 - ($ - $$) db 0
dw 0xaa55

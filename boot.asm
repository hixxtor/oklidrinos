org 0x7c00

; бредули секторные
start:
    mov ax, 0xb800
    mov es, ax
    xor di, di
    mov cx, 2000
    mov ax, 0x0720
    rep stosw
    mov byte [es:0x7ce], 'O'
    mov byte [es:0x7cf], 0x8f
    mov byte [es:0x7d0], 'K'
    mov byte [es:0x7d1], 0x8f
    jmp $

times 510 - ($ - $$) db 0
dw 0xaa55

; ======================== ZOMBIE A HIJACKER V 0.1 ======================== ;

; This code hijacks zombie A
; The zombie is forced to attack using callfar
; Our code also runs a callfar, but a more advanced one:
;	we are spraying the arena with ff1d(callfar) so that
;	when we lap we do not kill ourselves
; 	and, what is sprayed is stored in the shared mem
;	we do that by starting writing at address 0x1dff, 
; 	to avoid anti-callfar increase cs for an offset.
; after zombie sprays the entire arena, It commits suicide..

%define ZOMAWRITE 0x1243
%define K 0x10e1
%define ZOMAOFFSET 0x24
%define EMPTYFIELD 0xcc
%define JUMPTO 0x26ff
%define CALLFAR 0x1dff
%define ADD_TO_CS 10
%define CS_OFFSET 16
%define CALLFAR_LEN 2

stosw
push es
push cs
pop es

xchg cx, ax

mov bx, K 			; move zombieA constant to bx for later decryption
mov si, ZOMAWRITE               ; move SI to where zombie a writes

lodsw 				; read from SI what zombie wrote
; AX -> zombies message
; SI += 2


; == calculate the lower bound of the zombies address == ; 
xchg dx, ax 
div bx    
; ax = lower bound zombie addr

; == find the zombie == ;
mov di, ax           ; lower bound
mov al, EMPTYFIELD
cld

find_zoma:
    scasb
    je find_zoma

; == hijack the bastard! == ;
xchg si, cx
lea bx, [si + zombie_trap]
mov [si], bx
mov word [di + ZOMAOFFSET], JUMPTO
mov [di + ZOMAOFFSET + 2], si
nop

actual_code:
        pop ax
        push cs
        pop ss
        
        mov sp, CALLFAR - CALLFAR_LEN + ADD_TO_CS * CS_OFFSET
        mov word [CALLFAR - CALLFAR_LEN + ADD_TO_CS * CS_OFFSET], CALLFAR
        
        mov ds, ax
        mov bx, cs
        add bx, ADD_TO_CS
      
        xor di, di
        mov word [di], CALLFAR - CALLFAR_LEN
        mov [di+2], bx
        
        call word far [di]



%define CALLOFFSET zombie_trap + 0x3
zombie_trap:
        call next
next:
        pop ax
        sub ax, 3
        
        push cs
        nop
        pop ss
        
        mov sp, ax
        sub sp, zombie_trap
        
        add ax, zombie_call_far - zombie_trap

        push es
        pop ds

        mov [di], ax
        mov [di+2], cs
zombie_call_far:
        call far [di]
        
end:
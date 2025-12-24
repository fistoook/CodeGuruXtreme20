00000000  EB5C              jmp 0x5e
; jmp to actual code

; ===== decoy #1 ===== ;
00000002  BB2300            mov bx,0x23
00000005  AA                stosb
00000006  4F                dec di
00000007  06                push es
00000008  17                pop ss
00000009  01C3              add bx,ax
0000000B  31E4              xor sp,sp
0000000D  59                pop cx
0000000E  1E                push ds
0000000F  89C7              mov di,ax
00000011  01C8              add ax,cx
00000013  01C0              add ax,ax
00000015  29CF              sub di,cx
00000017  B96700            mov cx,0x67
0000001A  F6E1              mul cl
0000001C  07                pop es
0000001D  81C7A501          add di,0x1a5
00000021  3915              cmp [di],dx
00000023  7407              jz 0x2c
00000025  AB                stosw
00000026  81C7FE01          add di,0x1fe
0000002A  EBF5              jmp 0x21
0000002C  89D8              mov ax,bx
0000002E  EBF5              jmp 0x25

; ===== decoy #2 ===== ;
00000030  BB2300            mov bx,0x23
00000033  AA                stosb
00000034  4F                dec di
00000035  06                push es
00000036  17                pop ss
00000037  01C3              add bx,ax
00000039  31E4              xor sp,sp
0000003B  59                pop cx
0000003C  1E                push ds
0000003D  89C7              mov di,ax
0000003F  01C8              add ax,cx
00000041  01C0              add ax,ax
00000043  29CF              sub di,cx
00000045  B96700            mov cx,0x67
00000048  F6E1              mul cl
0000004A  07                pop es
0000004B  81C7A501          add di,0x1a5
0000004F  3915              cmp [di],dx
00000051  7407              jz 0x5a
00000053  AB                stosw
00000054  81C7FE01          add di,0x1fe
00000058  EBF5              jmp 0x4f
0000005A  89D8              mov ax,bx
0000005C  EBF5              jmp 0x53



; ===== Code ===== ;
0000005E  BB2300            mov bx,0x23
; bx -> 0x23

00000061  AA                stosb
; ES:DI -> AL (writes al to shared mem)
; DI++

00000062  4F                dec di
; DI -> 0

00000063  06                push es
00000064  17                pop ss
; SS -> ES

00000065  01C3              add bx,ax
; BX -> 0x23 + start_addr

00000067  31E4              xor sp,sp
; SP -> 0

00000069  59                pop cx
; CX -> AL

0000006A  1E                push ds
; write DS to shared mem

0000006B  89C7              mov di,ax
; DI -> start_addr

0000006D  01C8              add ax,cx
; AX -> AX + AL

0000006F  01C0              add ax,ax
; AX -> (AX + AL) * 2

00000071  29CF              sub di,cx
; DI -> start_addr - low8(start_addr)

00000073  B96700            mov cx,0x67
; CX -> 0x67

00000076  F6E1              mul cl
; AX -> (AX + AL) * 2 * 67

00000078  07                pop es
; ES -> DS(arena)

00000079  81C7A501          add di,0x1a5
; DI -> start_addr - low8(start_addr) + 0x1a5


; loop:
0000007D  3915              cmp [di],dx
0000007F  7407              jz 0x88
; when [DI] will be zero, jump to tell

00000081  AB                stosw
; write AX((AX + AL) * 2 * 67) to arena, at DI(start_addr - low8(start_addr) + 0x1a5)

00000082  81C7FE01          add di,0x1fe
; DI += 0x1fe

00000086  EBF5              jmp 0x7d
; jmp loop

tell: 
00000088  89D8              mov ax,bx
; AX -> 0x23 + start_addr

0000008A  EBF5              jmp 0x81
; ===== Code Ends ===== ;





; ===== decoy #3 ===== ;
0000008C  BB2300            mov bx,0x23
0000008F  AA                stosb
00000090  4F                dec di
00000091  06                push es
00000092  17                pop ss
00000093  01C3              add bx,ax
00000095  31E4              xor sp,sp
00000097  59                pop cx
00000098  1E                push ds
00000099  89C7              mov di,ax
0000009B  01C8              add ax,cx
0000009D  01C0              add ax,ax
0000009F  29CF              sub di,cx
000000A1  B96700            mov cx,0x67
000000A4  F6E1              mul cl
000000A6  07                pop es
000000A7  81C7A501          add di,0x1a5
000000AB  3915              cmp [di],dx
000000AD  7407              jz 0xb6
000000AF  AB                stosw
000000B0  81C7FE01          add di,0x1fe
000000B4  EBF5              jmp 0xab
000000B6  89D8              mov ax,bx
000000B8  EBF5              jmp 0xaf

; ===== decoy #4 ===== ;
000000BA  BB2300            mov bx,0x23
000000BD  AA                stosb
000000BE  4F                dec di
000000BF  06                push es
000000C0  17                pop ss
000000C1  01C3              add bx,ax
000000C3  31E4              xor sp,sp
000000C5  59                pop cx
000000C6  1E                push ds
000000C7  89C7              mov di,ax
000000C9  01C8              add ax,cx
000000CB  01C0              add ax,ax
000000CD  29CF              sub di,cx
000000CF  B96700            mov cx,0x67
000000D2  F6E1              mul cl
000000D4  07                pop es
000000D5  81C7A501          add di,0x1a5
000000D9  3915              cmp [di],dx
000000DB  7407              jz 0xe4
000000DD  AB                stosw
000000DE  81C7FE01          add di,0x1fe
000000E2  EBF5              jmp 0xd9
000000E4  89D8              mov ax,bx
000000E6  EBF5              jmp 0xdd

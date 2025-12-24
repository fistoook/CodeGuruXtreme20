00000000  E93601            jmp 0x139
; jmp to actual code

; ===== TABLE ===== ;
00000003  29A90080          sub [bx+di-0x8000],bp
00000007  7BFB              jpo 0x4
00000009  52                push dx
0000000A  D285055C          rol byte [di+0x5c05],cl
0000000E  DC                db 0xdc
0000000F  D7                xlatb
00000010  57                push di
00000011  AE                scasb
00000012  2EE161            loope 0x76
00000015  B83833            mov ax,0x3338
00000018  B30A              mov bl,0xa
0000001A  8A3D              mov bh,[di]
0000001C  BD1494            mov bp,0x9414
0000001F  8F                db 0x8f
00000020  0F66E6            pcmpgtd mm4,mm6
00000023  B93990            mov cx,0x9039
00000026  100B              adc [bp+di],cl
00000028  8BE2              mov sp,dx
0000002A  6215              bound dx,[di]
0000002C  95                xchg ax,bp
0000002D  EC                in al,dx
0000002E  6C                insb
0000002F  67E73E            a32 out byte 0x3e,ax
00000032  BE71F1            mov si,0xf171
00000035  48                dec ax
00000036  C8C3439A          enter word 0x43c3,byte 0x9a
0000003A  1ACD              sbb cl,ch
0000003C  4D                dec bp
0000003D  A4                movsb
0000003E  241F              and al,0x1f
00000040  9F                lahf
00000041  F67649            div byte [bp+0x49]
00000044  C9                leave
00000045  20A09B1B          and [bx+si+0x1b9b],ah
00000049  72F2              jc 0x3d
0000004B  A5                movsw
0000004C  257CFC            and ax,0xfc7c
0000004F  F777CE            div word [bx-0x32]
00000052  4E                dec si
00000053  0181D858          add [bx+di+0x58d8],ax
00000057  53                push bx
00000058  D32A              shr word [bp+si],cl
0000005A  AA                stosb
0000005B  5D                pop bp
0000005C  DD34              fnsave [si]
0000005E  B4AF              mov ah,0xaf
00000060  2F                das
00000061  8606D959          xchg al,[0x59d9]
00000065  B030              mov al,0x30
00000067  2BAB0282          sub bp,[bp+di-0x7dfe]
0000006B  35B50C            xor ax,0xcb5
0000006E  8C87075E          mov word [bx+0x5e07],es
00000072  DE911168          ficom word [bx+di+0x6811]
00000076  E8E363            call 0x645c
00000079  BA3AED            mov dx,0xed3a
0000007C  6D                insw
0000007D  C4443F            les ax,word [si+0x3f]
00000080  BF1696            mov di,0x9616
00000083  69E940C0          imul bp,cx,0xc040
00000087  BB3B92            mov bx,0x923b
0000008A  12C5              adc al,ch
0000008C  45                inc bp
0000008D  9C                pushf
0000008E  1C17              sbb al,0x17
00000090  97                xchg ax,di
00000091  EE                out dx,al
00000092  6E                outsb
00000093  21A1F878          and [bx+di+0x78f8],sp
00000097  73F3              jnc 0x8c
00000099  4A                dec dx
0000009A  CA7DFD            retf word 0xfd7d
0000009D  54                push sp
0000009E  D4CF              aam byte 0xcf
000000A0  4F                dec di
000000A1  A6                cmpsb
000000A2  26F9              es stc
000000A4  79D0              jns 0x76
000000A6  50                push ax
000000A7  4B                dec bx
000000A8  CB                retf
000000A9  22A255D5          and ah,[bp+si-0x2aab]
000000AD  2CAC              sub al,0xac
000000AF  A7                cmpsw
000000B0  27                daa
000000B1  7EFE              jng 0xb1
000000B3  B131              mov cl,0x31
000000B5  8808              mov [bx+si],cl
000000B7  0383DA5A          add ax,[bp+di+0x5ada]
000000BB  0D8DE4            or ax,0xe48d
000000BE  645F              fs pop di
000000C0  DF36B689          fbstp tword [0x89b6]
000000C4  0960E0            or [bx+si-0x20],sp
000000C7  DB5BB2            fistp dword [bp+di-0x4e]
000000CA  32E5              xor ah,ch
000000CC  65BC3C37          gs mov sp,0x373c
000000D0  B70E              mov bh,0xe
000000D2  8E41C1            mov es,word [bx+di-0x3f]
000000D5  18989313          sbb [bx+si+0x1393],bl
000000D9  6AEA              push word 0xffffffffffffffea
000000DB  9D                popf
000000DC  1D74F4            sbb ax,0xf474
000000DF  EF                out dx,ax
000000E0  6F                outsw
000000E1  C6461999          mov byte [bp+0x19],0x99
000000E5  F0                lock
000000E6  706B              jo 0x153
000000E8  EB42              jmp 0x12c
000000EA  C275F5            ret word 0xf575
000000ED  4C                dec sp
000000EE  CC                int3
000000EF  C7479E1ED1        mov word [bx-0x62],0xd11e
000000F4  51                push cx
000000F5  A828              test al,0x28
000000F7  23A3FA7A          and sp,[bp+di+0x7afa]
000000FB  2DAD04            sub ax,0x4ad
000000FE  847FFF            test [bx-0x1],bh
00000101  56                push si
00000102  D6                salc
00000103  CC                int3
00000104  CC                int3
00000105  CC                int3
00000106  CC                int3

; ===== decoy #1 ===== ;
00000107  1E                push ds
00000108  07                pop es
00000109  89C3              mov bx,ax
0000010B  83C303            add bx,0x3
0000010E  D7                xlatb
0000010F  86E0              xchg ah,al
00000111  D7                xlatb
00000112  BF1226            mov di,0x2612
00000115  AB                stosw
00000116  81C7FE0F          add di,0xffe
0000011A  EBF9              jmp 0x115
0000011C  CC                int3
0000011D  CC                int3
0000011E  CC                int3
0000011F  CC                int3
; ===== decoy #2 ===== ;
00000120  1E                push ds
00000121  07                pop es
00000122  89C3              mov bx,ax
00000124  83C303            add bx,0x3
00000127  D7                xlatb
00000128  86E0              xchg ah,al
0000012A  D7                xlatb
0000012B  BF1226            mov di,0x2612
0000012E  AB                stosw
0000012F  81C7FE0F          add di,0xffe
00000133  EBF9              jmp 0x12e
00000135  CC                int3
00000136  CC                int3
00000137  CC                int3
00000138  CC                int3



; ===== Code ===== ;
00000139  1E                push ds
0000013A  07                pop es
; move ES to arena

0000013B  89C3              mov bx,ax
; BX -> start_addr

0000013D  83C303            add bx,0x3
; BX -> start_addr + 3

00000140  D7                xlatb
; AL = [start_addr + 3 + AL]

00000141  86E0              xchg ah,al
; AH = [start_addr + 3 + AL]
; AL = high8(start_addr)

00000143  D7                xlatb
; AL = [start_addr + 3 + high8(start_addr)]

00000144  BF1226            mov di,0x2612
; move di to magic location

loop:
00000147  AB                stosw
; print AX to magic location

00000148  81C7FE0F          add di,0xffe
; incrememt di by 0xffe(4094)
0000014C  EBF9              jmp 0x147
; jmp loop
; ===== Code Ends ===== ;




0000014E  CC                int3
0000014F  CC                int3
00000150  CC                int3
00000151  CC                int3
00000152  1E                push ds
00000153  07                pop es
00000154  89C3              mov bx,ax
00000156  83C303            add bx,0x3
00000159  D7                xlatb
0000015A  86E0              xchg ah,al
0000015C  D7                xlatb
0000015D  BF1226            mov di,0x2612
00000160  AB                stosw
00000161  81C7FE0F          add di,0xffe
00000165  EBF9              jmp 0x160
00000167  CC                int3
00000168  CC                int3
00000169  CC                int3
0000016A  CC                int3
0000016B  1E                push ds
0000016C  07                pop es
0000016D  89C3              mov bx,ax
0000016F  83C303            add bx,0x3
00000172  D7                xlatb
00000173  86E0              xchg ah,al
00000175  D7                xlatb
00000176  BF1226            mov di,0x2612
00000179  AB                stosw
0000017A  81C7FE0F          add di,0xffe

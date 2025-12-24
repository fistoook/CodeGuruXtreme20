00000000  41                inc cx
; cx -> 1

00000001  EB1C              jmp 0x1f
; jmp to actual code

; ===== decoy #1 ===== ;
00000003  81C3E110          add bx,0x10e1
00000007  F7E3              mul bx
00000009  89164312          mov [0x1243],dx
0000000D  41                inc cx
0000000E  93                xchg ax,bx
0000000F  E20E              loop 0x1f
; ===== decoy #2 ===== ;
00000011  81C3E110          add bx,0x10e1
00000015  F7E3              mul bx
00000017  89164312          mov [0x1243],dx
0000001B  41                inc cx
0000001C  93                xchg ax,bx
0000001D  E200              loop 0x1f




; ===== Code ===== ;
; Loop:
0000001F  81C3E110          add bx,0x10e1 ; 0x10e1 = 4321
; bx -> 0x10e1

00000023  F7E3              mul bx
; dx:ax -> ax × bx

00000025  89164312          mov [0x1243],dx
; dx is moved to a magic location

00000029  41                inc cx
; cx -> 2

0000002A  93                xchg ax,bx
; ax -> 0x10e1
; bx -> 16_lower(ax × bx)

0000002B  E2F2              loop 0x1f 
; cx--, cx -> 1, cx != 0 -> jmp 0x1f (this is an infinite loop!)
; ===== Code Ends ===== ;




; ===== decoy #1 ===== ;
0000002D  81C3E110          add bx,0x10e1
00000031  F7E3              mul bx
00000033  89164312          mov [0x1243],dx
00000037  41                inc cx
00000038  93                xchg ax,bx
00000039  E2E4              loop 0x1f
; ===== decoy 21 ===== ;
0000003B  81C3E110          add bx,0x10e1
0000003F  F7E3              mul bx
00000041  89164312          mov [0x1243],dx
00000045  41                inc cx
00000046  93                xchg ax,bx
00000047  E2D6              loop 0x1f

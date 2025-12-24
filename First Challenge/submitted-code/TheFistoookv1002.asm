%define ALLY_CODE_LENGTH 0x62

push es
pop ds

mov di, [di]
add di, ALLY_CODE_LENGTH
push cs
pop es

mov word ax, 0xab90
stosw
dec di

jmp di
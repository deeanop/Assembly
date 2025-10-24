dosseg
.model small
.stack 100h ;declararea segmentului de stiva
.data ;sectiunea de declarare a datelor
A DB 0
B DB 0
C DB 0
X DW 7
n1 DB "Introduceti  primul numar:$"
n2 DB "Introduceti al doilea numar:$"
n3 DB "Introduceti al treilea numar:$"
result DB "Rezultatul este :$"
.code ;sectiunea in care se scrie codul sursa al programului
new_line proc
    MOV AH, 2
    MOV DL, 10 ;vloarea 10(in hexazecimal 0x04) corespunde codului ASCII al caracterului special LF(Line Feed), adica new-line
    INT 21h
    ret
new_line endp
main proc
    MOV AX, @data ;instructiuni implicite pentru incarcarea segmentului de date
    MOV DS, AX
    ;citirea primului numar de la tastatura
    MOV AH, 9
    MOV DX, OFFSET n1
    INT 21h
    MOV AH, 1
    INT 21h
    MOV A, AL
    CALL new_line
    ;citirea celui de-al doilea numar
    MOV AH, 9
    MOV DX, OFFSET n2
    INT 21h
    MOV AH, 1
    INT 21h
    MOV B, AL
    CALL new_line
    ;citirea celui de-al treilea numar de la tastatura
    MOV AH, 9
    MOV DX, OFFSET n3
    INT 21h
    MOV AH, 1
    INT 21h
    MOV C, AL
    CALL new_line
    ;afisarea liniei "Rezultatul este " pe ecran
    MOV AH, 9
    MOV DX, OFFSET result
    INT 21h
    ;calculul sumei A+B
    MOV AL, A ; primul numar, A este mutat in registrul AL pe 8 biti
    ADD AL, B ; rezultatul sumei A+B se afla in registrul AL
    ;scaderea lui C
    SUB AL, C
    ;afisarea rezultatului 
    MOV AH, 2
    MOV DL, AL ; rezultatul este copiat in registrul DL
    INT 21h
    MOV AH, 4Ch ;4C-codul functiei DOS pentru terminare program
    INT 21h
main endp
end main
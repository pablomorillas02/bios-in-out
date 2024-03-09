ORG 100h

; Tenemos que poner '>' al principio 
JMP print_symbol

print_symbol:
  MOV AH, 0ah
  MOV AL, 62 ; Caracter a representar al principio
  MOV BH, 0 ; Página de vídeo
  MOV CX, 1
  INT 10h

  JMP update_cursor

update_cursor:
  MOV AH, 03h
  INT 10h ; Obtenemos posición del cursor

  MOV AH, 02h
  ADD DL, 1 ; Movemos el cursor 1 espacio
  INT 10h

  JMP loop

loop:
  MOV AH, 02h ; Obtenemos el estado de las teclas especiales
  INT 16h

  TEST AL, 04h ; Ctrl?
  JNZ check_if_intro

  MOV AH, 00h ; Obtener tecla
  INT 16h

  CMP AL, 27 ; ESC?
  JZ exit

  CMP AL, 8 ; Backspace?
  JZ erase

  CMP AL, 0x0D ; Intro?
  JZ new_line

  MOV AH, 0ah ; Mostrar caracter
  MOV CX, 1
  INT 10h

  JMP update_cursor

exit:
  MOV AH, 4Ch
  INT 21h

erase:
  MOV AH, 02h
  INT 10h ; Obtenemos posición del cursor

  DEC DL ; Movemos el cursor 1 espacio atrás
  MOV AH, 02h
  INT 10h ; Actualizamos posición del cursor

  MOV AH, 0ah
  MOV AL, ' ' ; Ponemos un espacio para borrar
  MOV CX, 1
  INT 10h

  JMP loop

check_if_intro:
  MOV AH, 00h ; Obtener tecla para ver si es intro
  INT 16h

  CMP AL, 0x0D ; Intro?
  JZ clear_screen

clear_screen:
  MOV AH, 03h ; Obtenemos la posición actual del cursor
  INT 10h            

  XOR DL, DL ; Primera columna
  MOV DH, 24 ; Última fila
  MOV AH, 02h
  INT 10h

  ; Borramos la pantalla
  MOV AH, 06h
  MOV AL, 0
  MOV BH, 07h ; Rellenar con espacios en blanco    
  MOV CX, 0 
  MOV DX, 184Fh ; Esquina inferior derecha
  INT 10h

  JMP print_symbol

new_line:
  MOV AH, 03h
  INT 10h

  MOV AH, 02h
  XOR DL, DL ; Nos movemos al inicio
  INT 10h

  MOV AH, 06h
  MOV AL, 1 ; Subimos una línea
  MOV BH, 07h ; Atributo para las líneas vacías
  ; Seleccionamos la región (Desde arriba del todo hasta la última fila)
  MOV CH, 0 
  MOV CL, 0 
  MOV DL, 79 ; Ancho total de la pantalla (80)
  INT 10h ;

  JMP print_symbol

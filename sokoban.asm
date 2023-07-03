NADA        equ      00
JUGADOR     equ      01
PARED       equ      02
CAJA        equ      03
OBJETIVO    equ      04
SUELO       equ      05
CAJAOBJETIVO equ     06

.MODEL SMALL
.RADIX 16
.STACK
.DATA
dim_sprite_jug    db   08, 08
data_sprite_jug   db   50, 50, 50, 02, 02, 04, 50, 50
                  db   50, 50, 02, 0B, 0B, 50, 50, 50
                  db   50, 50, 50, 02, 02, 50, 50, 50
                  db   50, 50, 0A, 0A, 0A, 0A, 50, 50
                  db   50, 00, 50, 0A, 0A, 50, 00, 50
                  db   50, 50, 50, 0A, 0A, 50, 50, 50
                  db   50, 50, 0A, 50, 50, 0A, 50, 50
                  db   50, 00, 00, 50, 50, 00, 00, 50
dim_sprite_flcha  db   08, 08
data_sprite_flcha   db   00, 00, 0A, 00, 00, 00, 00, 00
                    db   00, 00, 0A, 0A, 00, 00, 00, 00
                    db   0A, 0A, 0A, 0A, 0A, 00, 00, 00
                    db   0A, 0A, 0A, 0A, 0A, 0A, 00, 00
                    db   0A, 0A, 0A, 0A, 0A, 0A, 00, 00
                    db   0A, 0A, 0A, 0A, 0A, 00, 00, 00
                    db   00, 00, 0A, 0A, 00, 00, 00, 00
                    db   00, 00, 0A, 00, 00, 00, 00, 00
dim_sprite_vacio  db   08, 08
data_sprite_vacio db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
dim_sprite_suelo  db   08, 08
data_sprite_suelo db   50, 50, 50, 50, 50, 50, 50, 50
                  db   50, 50, 50, 50, 50, 50, 50, 50
                  db   50, 50, 50, 50, 50, 50, 50, 50
                  db   50, 50, 50, 50, 50, 50, 50, 50
                  db   50, 50, 50, 50, 50, 50, 50, 50
                  db   50, 50, 50, 50, 50, 50, 50, 50
                  db   50, 50, 50, 50, 50, 50, 50, 50
                  db   50, 50, 50, 50, 50, 50, 50, 50
dim_sprite_pared  db   08, 08
data_sprite_pared db   40, 40, 41, 41, 40, 40, 41, 41
                  db   41, 40, 40, 41, 41, 40, 40, 41
                  db   40, 40, 41, 41, 40, 40, 41, 41
                  db   41, 40, 40, 41, 41, 40, 40, 41
                  db   40, 40, 41, 41, 40, 40, 41, 41
                  db   41, 40, 40, 41, 41, 40, 40, 41
                  db   40, 40, 41, 41, 40, 40, 41, 41
                  db   41, 40, 40, 41, 41, 40, 40, 41
dim_sprite_caja   db   08, 08
data_sprite_caja  db  50,50,50,50,50,50,50,50
                  db  50,50,0b,0b,0b,0b,50,50
                  db  50,0b,0f,0f,0f,0f,0b,50
                  db  50,0b,0f,0f,0f,0f,0b,50
                  db  50,0b,0f,0f,0f,0f,0b,50
                  db  50,0b,0f,0f,0f,0f,0b,50
                  db  50,50,0b,0b,0b,0b,50,50
                  db  50,50,50,50,50,50,50,50

dim_sprite_obj    db   08, 08
data_sprite_obj   db  50,50,50,50,50,50,50,50
                  db  50,28,50,50,50,50,28,50
                  db  50,50,28,50,50,28,50,50
                  db  50,50,50,28,28,50,50,50
                  db  50,50,50,28,28,50,50,50
                  db  50,50,28,50,50,28,50,50
                  db  50,28,50,50,50,50,28,50
                  db  50,50,50,50,50,50,50,50

mapa              db   398 dup (0)
msg_ganador	  db "NIVEL COMPLETADO!$"
iniciar_juego db "INICIAR JUEGO$"
cargar_nivel  db "CARGAR NIVEL$"
configuracion db "CONFIGURACION$"
puntajes      db "PUNTAJES ALTOS$"
salir         db "SALIR$"
iniciales     db "GBAV - 202004796$"
;; JUEGO
xJugador      db 0
yJugador      db 0
puntos        dw 0
;; MENÚS
opcion        db 0
maximo        db 0
xFlecha       dw 0
yFlecha       dw 0
flagObjetivo  db 0
cajasRestantes db 0
;; MENU PAUSA
pausa      	  db "---PAUSA---$"
continuar     db "seguir jugando$"
salirMenu     db "menu principal$"
opcion_pause   db 0
maximo_pause   db 0
xFlecha_pause  dw 0
yFlecha_pause  dw 0
;; MENU CONFIG
opcion_conf   db 0
maximo_conf   db 0
xFlecha_conf  dw 0
yFlecha_conf  dw 0
;; CONTROLES
control_arriba    db  48
control_abajo     db  50
control_izquierda db  4b
control_derecha   db  4d
;; NIVELES
nivel_x           db  "NIV.TXT",00
handle_nivel      dw  0000
linea             db  100 dup (0)
elemento_actual   db  0
xElemento         db  0
yElemento         db  0
;; TOKENS
tk_pared      db  05,"pared"
tk_suelo      db  05,"suelo"
tk_jugador    db  07,"jugador"
tk_caja       db  04,"caja"
tk_objetivo   db  08,"objetivo"
tk_coma       db  01,","
;;
;; CONFIGURACION 
controles     db "--CONTROLES--$"
derecha       db "DER:> $"
abajo         db "ABAJ:> $"
arriba        db "ARR:> $"
izquierda     db "IZQ:> $"
cambiar       db "Modificar$"
regresar      db "Menu$"
numero        db  5 dup (30)

;; TEXTOS A CADENAS
flechaArriba db 24, "$"
flechaAbajo  db 25, "$"
flechaDer    db 26, "$"
flechaIzq    db 27, "$"


;; LETRAS -> 
letraA      db "tecla a$"
letraB      db "tecla b$"
letraC      db "tecla c$"
letraD      db "tecla d$"
letraE      db "tecla e$"
letraF      db "tecla f$"
letraG      db "tecla g$"
letraH      db "tecla h$"
letraI      db "tecla i$"
letraJ      db "tecla j$"
letraK      db "tecla k$"
letraL      db "tecla l$"
letraM      db "tecla m$"
letraN      db "tecla n$"
letraO      db "tecla o$"
letraP      db "tecla p$"
letraQ      db "tecla q$"
letraR      db "tecla r$"
letraS      db "tecla s$"
letraT      db "tecla t$"
letraU      db "tecla u$"
letraV      db "tecla v$"
letraW      db "tecla w$"
letraX      db "tecla x$"
letraY      db "tecla y$"
letraZ      db "tecla z$"
letraArriba db "flecha Arriba$"
letraAbajo  db "flecha Abajo$"
letraDer 	db "flecha Izquierda$"
letraIzq 	db "flecha Derecha$"
;; QWERTY 
codigoQ     db 10
codigoW     db 11
codigoE     db 12
codigoR     db 13
codigoT     db 14
codigoY     db 15
codigoU     db 16
codigoI     db 17
codigoO     db 18
codigoP     db 19
codigoA     db 1e
codigoS     db 1f
codigoD     db 20
codigoF     db 21
codigoG     db 22
codigoH     db 23
codigoJ     db 24
codigoK     db 25
codigoL     db 26
codigoZ     db 2c
codigoX     db 2d
codigoC     db 2e
codigoV     db 2f
codigoB     db 30
codigoN     db 31
codigoM     db 32
codigoArr   db 48
codigoAba   db 50
codigoDer   db 4Bh
codigoIzq   db 4Dh


.CODE
.STARTUP
inicio:
		;; MODO VIDEO ;;
		mov AH, 00
		mov AL, 13
		int 10
		;;;;;;;;;;;;;;;;
		call menu_principal
		mov AL, [opcion]
		;; > INICIAR JUEGO
		cmp AL, 0
		je ciclo_juego
		;; > CARGAR NIVEL
		cmp AL, 1
		je cargar_un_nivel
		;; > CONFIGURACION
        cmp AL, 3
		je menu_configuracion
		;; > PUNTAJES ALTOS
		;; > SALIR
		cmp AL, 4
		je fin
		;;;;;;;;;;;;;;;;
ciclo_juego:
		call pintar_mapa
		call pintar_mapa2
		call entrada_juego
		jmp ciclo_juego
		;;;;;;;;;;;;;;;;

cargar_un_nivel:
		mov AL, 00
		mov DX, offset nivel_x
		mov AH, 3d
		int 21
		jc inicio
		mov [handle_nivel], AX
		;;
ciclo_lineas:
		mov BX, [handle_nivel]
		call siguiente_linea
		cmp DL, 0ff      ;; fin-del-archivo?
		je fin_parseo
		cmp DH, 00      ;; línea-con-algo?
		je ciclo_lineas
		;;;;;;;;;;;;;;;;;;;;;;;
		;; lógica del parseo ;;
		;;;;;;;;;;;;;;;;;;;;;;;
		;; al principio del buffer de la línea está: pared, caja, jugador, suelo, objetivo
		mov DI, offset linea
		push DI
		mov SI, offset tk_pared
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_pared
		pop DI
		push DI
		mov SI, offset tk_caja
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_caja
		pop DI
		push DI
		mov SI, offset tk_suelo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_suelo
		pop DI
		push DI
		mov SI, offset tk_objetivo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_objetivo
		pop DI
		push DI
		mov SI, offset tk_jugador
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_jugador
		pop DI
		jmp ciclo_lineas
es_pared:
		mov AL, PARED
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_caja:
		mov AL, CAJA
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_suelo:
		mov AL, SUELO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_objetivo:
		mov AL, OBJETIVO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_jugador:
		mov AL, JUGADOR
		mov [elemento_actual], AL
		jmp continuar_parseo0
		;; ignorar espacios
continuar_parseo0:
		pop SI         ; ignorara valor inicial de DI
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [xElemento], AL
		pop DI
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		je continuar_parseo1
		cmp AL, ','
		je continuar_parseo2
		jmp ciclo_lineas
continuar_parseo1:
		;; ignorar espacios
		call ignorar_espacios
continuar_parseo2:
		;; obtener una coma
		mov SI, offset tk_coma
		call cadena_igual
		cmp DL, 0ff
		jne ciclo_lineas
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [yElemento], AL
		pop DI
		;; ignorar_espacios
		mov AL, [DI]
		cmp AL, 20
		jne ver_final_de_linea
		call ignorar_espacios
		;; ver si es el final de la cadena
ver_final_de_linea:
		mov AL, [DI]
		cmp AL, 00
		jne ciclo_lineas
		;; usar la información
		;;
		mov DL, [elemento_actual]
		mov AH, [xElemento]
		mov AL, [yElemento]
		call colocar_en_mapa
		mov AL, JUGADOR
		cmp AL, [elemento_actual]
		je guardar_coordenadas_jugador
		jmp ciclo_lineas
guardar_coordenadas_jugador:
		mov AH, [xElemento]
		mov AL, [yElemento]
		mov [xJugador], AH
		mov [yJugador], AL
		jmp ciclo_lineas
		;;;;;;;;;;;;;;;;;;;;;;;
fin_parseo:
		;; cerrar archivo
		mov AH, 3e
		mov BX, [handle_nivel]
		int 21
		;;
		jmp ciclo_juego
		jmp fin

;; pintar_pixel - pintar un pixel
;; ENTRADA:
;;     AX --> x pixel
;;     BX --> y pixel
;;     CL --> color
;; SALIDA: pintar pixel
;; AX + 320*BX
pintar_pixel:
		push AX
		push BX
		push CX
		push DX
		push DI
		push SI
		push DS
		mov DX, 0a000
		mov DS, DX
		;; (
		;; 	posicionarse en X
		mov SI, AX
		mov AX, 140
		mul BX
		add AX, SI
		mov DI, AX
		;;
		mov [DI], CL  ;; pintar
		;; )
		pop DS
		pop SI
		pop DI
		pop DX
		pop CX
		pop BX
		pop AX
		ret

;; pintar_sprite - pinta un sprite
;; Entrada:
;;    - DI: offset del sprite
;;    - SI: offset de las dimensiones
;;    - AX: x sprite 320x200
;;    - BX: y sprite 320x200
pintar_sprite:
		push DI
		push SI
		push AX
		push BX
		push CX
		inc SI
		mov DH, [SI]  ;; vertical
		dec SI        ;; dirección de tam horizontal
		;;
inicio_pintar_fila:
		cmp DH, 00
		je fin_pintar_sprite
		push AX
		mov DL, [SI]
pintar_fila:
		cmp DL, 00
		je pintar_siguiente_fila
		mov CL, [DI]
		call pintar_pixel
		inc AX
		inc DI
		dec DL
		jmp pintar_fila
pintar_siguiente_fila:
		pop AX
		inc BX
		dec DH
		jmp inicio_pintar_fila
fin_pintar_sprite:
		pop CX
		pop BX
		pop AX
		pop SI
		pop DI
		ret

;; delay - subrutina de retardo
delay:
		push SI
		push DI
		mov SI, 0200
cicloA:
		mov DI, 0130
		dec SI
		cmp SI, 0000
		je fin_delay
cicloB:
		dec DI
		cmp DI, 0000
		je cicloA
		jmp cicloB
fin_delay:
		pop DI
		pop SI
		ret
		

;; clear_pantalla - limpia la pantalla
;; ..
;; ..
clear_pantalla:
		mov CX, 19  ;; 25
		mov BX, 00
clear_v:
		push CX
		mov CX, 28  ;; 40
		mov AX, 00
clear_h:
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		add AX, 08
		loop clear_h
		add BX, 08
		pop CX
		loop clear_v
		ret


;; menu_principal - menu principal
;; ..
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
menu_principal:
		call clear_pantalla
		mov AL, 0
		mov [opcion], AL      ;; reinicio de la variable de salida
		mov AL, 5
		mov [maximo], AL
		mov AX, 50
		mov BX, 28
		mov [xFlecha], AX
		mov [yFlecha], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; INICIAR JUEGO
		mov DL, 0c
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;; <<-- posicionar el cursor
		push DX
		mov DX, offset iniciar_juego
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CARGAR NIVEL
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset cargar_nivel
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; PUNTAJES ALTOS
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset puntajes
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CONFIGURACION
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset configuracion
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; SALIR
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir
		mov AH, 09
		int 21
		pop DX
		;;;;
		call pintar_flecha
		;;;;
		;; LEER TECLA
		;;;;
entrada_menu_principal:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_principal
		cmp AH, 50
		je sumar_opcion_menu_principal
		cmp AH, 3b  ;; le doy F1
		je fin_menu_principal
		jmp entrada_menu_principal
restar_opcion_menu_principal:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero
		mov [opcion], AL
		jmp mover_flecha_menu_principal
sumar_opcion_menu_principal:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_cero:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_maximo:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_principal
mover_flecha_menu_principal:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_principal:
		cmp CL, 0
		je pintar_flecha_menu_principal
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_principal
pintar_flecha_menu_principal:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_principal
		;;
fin_menu_principal:
		ret

;; pintar_flecha - pinta una flecha
pintar_flecha:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret

;; adaptar_coordenada - 40x25->320x200
;; ENTRADA:
;;    AH -> x 40x25
;;    AL -> y 40x25
;; SALIDA:
;;    AX -> x 320x200
;;    BX -> y 320x200
adaptar_coordenada:
		mov DL, 08
		mov CX, AX
		mul DL
		mov BX, AX
		;;
		mov AL, CH
		mul DL
		ret
		
;; colocar_en_mapa - coloca un elemento en el mapa
;; ENTRADA:
;;    - DL -> código numérico del elemento
;;    - AH -> x
;;    - AL -> y
;; ...
colocar_en_mapa:
		mov CX, AX     ;;;   AH -> x -> CH
		mov BL, 28
		mul BL   ;; AL * BL  = AX
		mov CL, CH
		mov CH, 00     ;;; CX el valor de X completo
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov [DI], DL
		ret


;; obtener_de_mapa - obtiene un elemento en el mapa
;; ENTRADA:
;;    - AH -> x
;;    - AL -> y
;; SALIDA:
;;    - DL -> código numérico del elemento
obtener_de_mapa:
		mov CX, AX
		mov BL, 28
		mul BL
		mov CL, CH
		mov CH, 00
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov DL, [DI]
		ret


;; pintar_mapa - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_mapa:
		mov AL, 00   ;; fila
		;;
ciclo_v:
		cmp AL, 19
		je fin_pintar_mapa
		mov AH, 00   ;; columna
		;;
ciclo_h:
		cmp AH, 28
		je continuar_v
		push AX
		call obtener_de_mapa
		pop AX
		;;
                cmp DL, NADA
		je pintar_vacio_mapa
		;;
                cmp DL, JUGADOR
		je pintar_jugador_mapa
		;;
                cmp DL, PARED
		je pintar_pared_mapa
		;;
                cmp DL, CAJA
		je pintar_caja_mapa
		;;
                cmp DL, OBJETIVO
		je pintar_objetivo_mapa
        ;;
                cmp DL, CAJAOBJETIVO
		je pintar_caja_mapa
		;;
                cmp DL, SUELO
		je pintar_suelo_mapa
		;;
		jmp continuar_h
pintar_vacio_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_suelo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_suelo
		mov DI, offset data_sprite_suelo
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_jugador_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug
		mov DI, offset data_sprite_jug
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_pared_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_pared
		mov DI, offset data_sprite_pared
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_caja_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_caja
		mov DI, offset data_sprite_caja
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_objetivo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_obj
		mov DI, offset data_sprite_obj
		call pintar_sprite
		pop AX
		jmp continuar_h
continuar_h:
		inc AH
		jmp ciclo_h
continuar_v:
		inc AL
		jmp ciclo_v
fin_pintar_mapa:
        call pintar_nombre
        ;call pintar_punteo
		ret


;; mapa_quemado - mapa de prueba
mapa_quemado:
		mov DL, SUELO
		mov AH, 2
		mov AL, 2
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 3
		mov AL, 2
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 4
		mov AL, 2
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 2
		mov AL, 3
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 3
		mov AL, 3
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 4
		mov AL, 3
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 2
		mov AL, 4
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 3
		mov AL, 4
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 4
		mov AL, 4
		call colocar_en_mapa
		;;
		mov DL, JUGADOR
		mov AH, [xJugador]
		mov AL, [yJugador]
		call colocar_en_mapa
		;;
		mov DL, CAJA
		mov AH, 2
		mov AL, 3
		call colocar_en_mapa
		;;
		mov DL, OBJETIVO
		mov AH, 4
		mov AL, 2
		call colocar_en_mapa
		;;
		mov DL, PARED
		mov AH, 1
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 2
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 3
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 4
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 2
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 2
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 3
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 3
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 4
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 4
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 5
		call colocar_en_mapa

		mov DL, PARED
		mov AH, 2
		mov AL, 5
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 3
		mov AL, 5
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 4
		mov AL, 5
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 5
		call colocar_en_mapa
		ret


;; entrada_juego - manejo de las entradas del juego
entrada_juego:
		mov AH, 01
		int 16
		jz fin_entrada_juego  ;; nada en el buffer de entrada
		mov AH, 00
		int 16
		;; AH <- scan code
		cmp AH, [control_arriba]
		je mover_jugador_arr
		cmp AH, [control_abajo]
		je mover_jugador_aba
		cmp AH, [control_izquierda]
		je mover_jugador_izq
		cmp AH, [control_derecha]
		je mover_jugador_der
		cmp AH, 3c
		je menu_pausa_set
		ret
menu_pausa_set: 
		jmp menu_pausa
		ret
mover_jugador_arr:
		mov AH, [xJugador] ;pisocion x de jugador
		mov AL, [yJugador] ;posicion y de jugador
		dec AL             ; se mueve arriba
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED 
		je hay_pared_arriba
        cmp DL, CAJA 
		je hay_caja_arriba
        cmp DL, OBJETIVO 
		je hay_objetivo_arriba
        cmp DL, CAJAOBJETIVO 
		je hay_cajaobjetivo_arriba
		mov [yJugador], AL          ;cambiamos posicion de jugador
		;;
		mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
		;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_arriba
        ;;
		mov DL, SUELO               ;ponemos suelo en dl 
		inc AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
hay_pared_arriba:
		ret
hay_cajaobjetivo_arriba:
        ;revisar si hay algo arriba 
        dec AL
        push AX
		call obtener_de_mapa
		pop AX
        ;si lo hay ret
        cmp DL, PARED 
		je hay_pared_arriba
        cmp DL, CAJA 
		je hay_pared_arriba
        cmp DL, OBJETIVO
        je poner_cajaObj_arriba
        ;si no lo hay, mover caja, mover jugador, poner suelo
        mov DL, CAJA             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        inc AL 
        mov [yJugador], AL          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_arriba
        ;;
		mov DL, SUELO               ;ponemos suelo en dl 
		inc AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
        inc [flagObjetivo]
		ret
hay_caja_arriba:
        ;revisar si hay algo arriba 
        dec AL
        push AX
		call obtener_de_mapa
		pop AX
        ;si lo hay ret
        cmp DL, PARED 
		je hay_pared_arriba
        cmp DL, CAJA 
		je hay_pared_arriba
        cmp DL, OBJETIVO
        je poner_cajaObj_arriba
        ;si no lo hay, mover caja, mover jugador, poner suelo
        mov DL, CAJA             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        inc AL 
        mov [yJugador], AL          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_arriba
        ;;
		mov DL, SUELO               ;ponemos suelo en dl 
		inc AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
poner_cajaObj_arriba:
        ;mover cajaObjetivo, mover jugador, poner suelo
        mov DL, CAJAOBJETIVO             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        inc AL 
        mov [yJugador], AL          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_arriba
        ;;
		mov DL, SUELO               ;ponemos suelo en dl 
		inc AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
hay_objetivo_arriba:
        inc [flagObjetivo]
        mov [yJugador], AL          ;cambiamos posicion de jugador
		;;
		mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
		;;
		mov DL, SUELO               ;ponemos suelo en dl 
		inc AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
pintar_objetivo_arriba:
        mov [flagObjetivo], 00      ;ponemos la flag en false
        mov DL, OBJETIVO            ;ponemos suelo en dl 
		inc AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
        
mover_jugador_aba:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_abajo
        cmp DL, CAJA
		je hay_caja_abajo
        cmp DL, OBJETIVO 
		je hay_objetivo_abajo
        cmp DL, CAJAOBJETIVO 
		je hay_cajaobjetivo_abajo
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
        cmp [flagObjetivo], 00
        jne pintar_objetivo_abajo
        ;;
		mov DL, SUELO
		dec AL
		call colocar_en_mapa
		ret
hay_pared_abajo:
		ret
hay_cajaobjetivo_abajo:
        ;revisar si hay algo arriba 
        inc AL
        push AX
		call obtener_de_mapa
		pop AX
        ;si lo hay ret
        cmp DL, PARED 
		je hay_pared_arriba
        cmp DL, CAJA 
		je hay_pared_arriba
        cmp DL, OBJETIVO
        je poner_cajaObj_abajo
        ;si no lo hay, mover caja, mover jugador, poner suelo
        mov DL, CAJA             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        dec AL 
        mov [yJugador], AL          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_abajo
        ;;
        mov DL, SUELO               ;ponemos suelo en dl 
		dec AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		inc [flagObjetivo]
        ret
hay_caja_abajo:
        ;revisar si hay algo arriba 
        inc AL
        push AX
		call obtener_de_mapa
		pop AX
        ;si lo hay ret
        cmp DL, PARED 
		je hay_pared_arriba
        cmp DL, CAJA 
		je hay_pared_arriba
        cmp DL, OBJETIVO
        je poner_cajaObj_abajo
        ;si no lo hay, mover caja, mover jugador, poner suelo
        mov DL, CAJA             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        dec AL 
        mov [yJugador], AL          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_abajo
        ;;
        mov DL, SUELO               ;ponemos suelo en dl 
		dec AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
poner_cajaObj_abajo:
        mov DL, CAJAOBJETIVO             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        dec AL 
        mov [yJugador], AL          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_abajo
        ;;
        mov DL, SUELO               ;ponemos suelo en dl 
		dec AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
hay_objetivo_abajo:
        inc [flagObjetivo]
        mov [yJugador], AL          ;cambiamos posicion de jugador
		;;
		mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
		;;
		mov DL, SUELO               ;ponemos suelo en dl 
		dec AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
pintar_objetivo_abajo:
        mov [flagObjetivo], 00      ;ponemos la flag en false
        mov DL, OBJETIVO            ;ponemos suelo en dl 
		dec AL                      ;lo ponemos en posicion anterior (abajo)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
mover_jugador_izq:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_izquierda
        cmp DL, CAJA
		je hay_caja_izquierda
        cmp DL, OBJETIVO
        je hay_objetivo_izquierda
        cmp DL, CAJAOBJETIVO
        je hay_cajaobjetivo_izquierda
		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
        cmp [flagObjetivo], 00
        jne pintar_objetivo_izquierda
        ;;
		mov DL, SUELO
		inc AH
		call colocar_en_mapa
		ret
hay_pared_izquierda:
		ret
hay_cajaobjetivo_izquierda:
        ;revisar si hay algo izq 
        dec AH
        push AX
		call obtener_de_mapa
		pop AX
        ;si lo hay ret
        cmp DL, PARED 
		je hay_pared_arriba
        cmp DL, CAJA 
		je hay_pared_arriba
        cmp DL, OBJETIVO 
		je poner_paredObjetivo_izq
        ;si no lo hay, mover caja, mover jugador, poner suelo
        mov DL, CAJA             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        inc AH 
        mov [xJugador], AH          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_izquierda
        ;;
        mov DL, SUELO               ;ponemos suelo en dl 
		inc AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
        inc [flagObjetivo]
		ret
hay_caja_izquierda:
        ;revisar si hay algo izq 
        dec AH
        push AX
		call obtener_de_mapa
		pop AX
        ;si lo hay ret
        cmp DL, PARED 
		je hay_pared_arriba
        cmp DL, CAJA 
		je hay_pared_arriba
        cmp DL, OBJETIVO 
		je poner_paredObjetivo_izq
        ;si no lo hay, mover caja, mover jugador, poner suelo
        mov DL, CAJA             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        inc AH 
        mov [xJugador], AH          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_izquierda
        ;;
        mov DL, SUELO               ;ponemos suelo en dl 
		inc AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
poner_paredObjetivo_izq:
        mov DL, CAJAOBJETIVO             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        inc AH 
        mov [xJugador], AH          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_izquierda
        ;;
        mov DL, SUELO               ;ponemos suelo en dl 
		inc AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
hay_objetivo_izquierda:
        inc [flagObjetivo]
        mov [xJugador], AH          ;cambiamos posicion de jugador
		;;
		mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
		;;
		mov DL, SUELO               ;ponemos suelo en dl 
		inc AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
pintar_objetivo_izquierda:
        mov [flagObjetivo], 00      ;ponemos la flag en false
        mov DL, OBJETIVO            ;ponemos suelo en dl 
		inc AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
mover_jugador_der:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_derecha
        cmp DL, CAJA
		je hay_caja_derecha
        cmp DL, OBJETIVO
        je hay_objetivo_der
        cmp DL, CAJAOBJETIVO
        je hay_cajaobjetivo_der
		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
        cmp [flagObjetivo], 00
        jne pintar_objetivo_der
        ;;
		mov DL, SUELO
		dec AH
		call colocar_en_mapa
		ret
hay_pared_derecha:
		ret
hay_cajaobjetivo_der:
        ;revisar si hay algo izq 
        inc AH
        push AX
		call obtener_de_mapa
		pop AX
        ;si lo hay ret
        cmp DL, PARED 
		je hay_pared_arriba
        cmp DL, CAJA 
		je hay_pared_arriba
        cmp DL, OBJETIVO
        je poner_paredObjetivo_der
        ;si no lo hay, mover caja, mover jugador, poner suelo
        mov DL, CAJA             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        dec AH 
        mov [xJugador], AH          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_der
        ;;
        mov DL, SUELO               ;ponemos suelo en dl 
		dec AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
        inc [flagObjetivo]
		ret
hay_caja_derecha:
        ;revisar si hay algo izq 
        inc AH
        push AX
		call obtener_de_mapa
		pop AX
        ;si lo hay ret
        cmp DL, PARED 
		je hay_pared_arriba
        cmp DL, CAJA 
		je hay_pared_arriba
        cmp DL, OBJETIVO
        je poner_paredObjetivo_der
        ;si no lo hay, mover caja, mover jugador, poner suelo
        mov DL, CAJA             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        dec AH 
        mov [xJugador], AH          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_der
        ;;
        mov DL, SUELO               ;ponemos suelo en dl 
		dec AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
poner_paredObjetivo_der:
        mov DL, CAJAOBJETIVO             ;ponemos a caja en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;movemos jugador
        dec AH 
        mov [xJugador], AH          ;cambiamos posicion de jugador
        mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
        ;;
        cmp [flagObjetivo], 00      ;revisamos si flagObjetivo es true
        jne pintar_objetivo_der
        ;;
        mov DL, SUELO               ;ponemos suelo en dl 
		dec AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
hay_objetivo_der:
        inc [flagObjetivo]
        mov [xJugador], AH          ;cambiamos posicion de jugador
		;;
		mov DL, JUGADOR             ;ponemos a jugador en registro dl
		push AX
		call colocar_en_mapa        ;lo pintamos en el mapa
		pop AX
		;;
		mov DL, SUELO               ;ponemos suelo en dl 
		dec AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
pintar_objetivo_der:
        mov [flagObjetivo], 00      ;ponemos la flag en false
        mov DL, OBJETIVO            ;ponemos suelo en dl 
		dec AH                      ;lo ponemos en posicion anterior (izq)
		call colocar_en_mapa        ;pintamos en el mapa 
		ret
fin_entrada_juego:
		ret


;; siguiente_linea - extrae la siguiente línea del archivo referenciado por el handle en BX
;; ENTRADA:
;;    - BX: handle
;; SALIDA:
;;    - [linea]: contenido de la línea que se extrajo, finalizada en 00 (nul0)
;;    - DL: si el archivo llegó a su fin
;;    - DH: la cantidad de caracteres en la línea
siguiente_linea:
		mov SI, 0000
		mov DI, offset linea
		;;
ciclo_sig_linea:
		mov AH, 3f
		mov CX, 0001
		mov DX, DI
		int 21
		cmp AX, 0000
		je fin_siguiente_linea
		mov AL, [DI]
		cmp AL, 0a
		je quitar_nl_y_fin
		inc SI
		inc DI
		jmp ciclo_sig_linea
quitar_nl_y_fin:
		mov AL, 00
		mov [DI], AL
		mov DX, SI
		mov DH, DL
		mov DL, 00    ;; no ha finalizado el archivo
		ret
fin_siguiente_linea:
		mov DL, 0ff   ;; ya finalizó el archivo
		ret


;; cadena_igual - verifica que dos cadenas sean iguales
;; ENTRADA:
;;    - SI: cadena 1, con su tamaño en el primer byte
;;    - DI: cadena 2
;; SALIDA:
;;    - DL: 0ff si son iguales, 00 si no lo son
cadena_igual:
		mov CH, 00
		mov CL, [SI]
		inc SI
ciclo_cadena_igual:
		mov AL, [SI]
		cmp AL, [DI]
		jne fin_cadena_igual
		inc SI
		inc DI
		loop ciclo_cadena_igual
cadenas_son_iguales:
		mov DL, 0ff
		ret
fin_cadena_igual:
		mov DL, 00
		ret


;; ignorar_espacios - ignora una sucesión de espacios
;; ENTRADA:
;;    - DI: offset de una cadena cuyo primer byte se supone es un espacio
;; ...
ignorar_espacios:
ciclo_ignorar:
		mov AL, [DI]
		cmp AL, 20
		jne fin_ignorar
		inc DI
		jmp ciclo_ignorar
fin_ignorar:
		ret


;; memset - memset
;; ENTRADA:
;;    - DI: offset del inicio de la cadena de bytes
;;    - CX: cantidad de bytes
;;    - AL: valor que se pondrá en cada byte
memset:
		push DI
ciclo_memset:
		mov [DI], AL
		inc DI
		loop ciclo_memset
		pop DI
		ret


;; leer_cadena_numerica - lee una cadena que debería estar compuesta solo de números
;; ENTRADA:
;;    - DI: offset del inicio de la cadena numérica
;; SALIDA:
;;    - [numero]: el contenido de la cadena numérica
leer_cadena_numerica:
		mov SI, DI
		;;
		mov DI, offset numero
		mov CX, 0005
		mov AL, 30
		call memset
		;;
		mov DI, SI
		mov CX, 0000
ciclo_ubicar_ultimo:
		mov AL, [DI]
		cmp AL, 30
		jb copiar_cadena_numerica
		cmp AL, 39
		ja copiar_cadena_numerica
		inc DI
		inc CX
		jmp ciclo_ubicar_ultimo
copiar_cadena_numerica:
		push DI   ;;   <----
		dec DI
		;;
		mov SI, offset numero
		add SI, 0004
ciclo_copiar_num:
		mov AL, [DI]
		mov [SI], AL
		dec DI
		dec SI
		loop ciclo_copiar_num
		pop DI
		ret

;; cadenaAnum
;; ENTRADA:
;;    DI -> dirección a una cadena numérica
;; SALIDA:
;;    AX -> número convertido
;;;;
cadenaAnum:
		mov AX, 0000    ; inicializar la salida
		mov CX, 0005    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DX, 000a
		mul DX          ; AX * DX -> DX:AX
		mov BH, 00
		add AX, BX 
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret
pintar_nombre: 
		;; GUARDO DX
		push DX 
		;; limpiamos DX 
		mov DL, 0002   ;; COLUMNAS y -> 
		mov DH, 18    ;; FILAS 
		mov BH, 00   ;; DISPLAY PAGE
		mov AH, 02   ;; VIDEO FUNCTION
		int 10
		mov DX, offset iniciales
		mov AH, 09 
		int 21 
		;; REGRESO DX
		pop DX
		ret 
pintar_punteo:
		;; GUARDO DX
		push DX 
		mov DL, 20  ;; COLUMNAS y -> 
		mov DH, 0000 ;; FILAS 
		mov BH, 00   ;; DISPLAY PAGE
		mov AH, 02   ;; VIDEO FUNCTION
		int 10
		mov DX, offset puntos
		mov AH, 09 
		int 21 
		;; REGRESO DX
		pop DX
		ret 
menu_pausa:
		call menu_pause_video
		mov AL, [opcion_pause]
		;; > CONTINUAR
		cmp AL, 0
		je ciclo_juego
		;; > REGRESAR
		cmp AL, 1
		je inicio
		jmp menu_pausa
retornar:
		ret

pintar_iniciales:
		call pintar_punteo
		call pintar_nombre
menu_pause_video:
		call clear_pantalla
		mov AL, 0
		mov [opcion_pause], AL      ;; reinicio de la variable de salida
		mov AL, 2
		mov [maximo_pause], AL
		mov AX, 50
		mov BX, 80 
		mov [xFlecha_pause], AX
		mov [yFlecha_pause], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; INICIAR JUEGO ;; --> 12 x 15
		mov DL, 0c ;; COLUMNAS
		mov DH, 05 ;; FILAS 
		mov BH, 00 ;; DISPLAY PAGE
		mov AH, 02 ;; VIDEO FUNCTION
		int 10
		;; <<-- posicionar el cursor
		;; CONFIGURACION 
		push DX
		add DH, 05
		mov DX, offset pausa
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; DERECHA
		add DH, 02
		add DL, 02 
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset continuar
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; ABAJO 
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salirMenu
		mov AH, 09
		int 21
		pop DX
		;;
		;;;;
		call pintar_flecha_pause
		;;;;
		;; LEER TECLA
		;;;;
entrada_menu_pause:
		mov AH, 00
		int 16
		cmp AH, [control_arriba]
		je restar_opcion_pause
		cmp AH, [control_abajo]
		je sumar_opcion_pause
		cmp AH, 3b  ;; le doy F1
		je fin_menu_pause
		jmp entrada_menu_pause
restar_opcion_pause:
		mov AL, [opcion_pause]
		dec AL
		cmp AL, 0ff
		je volver_a_cero_pause
		mov [opcion_pause], AL
		jmp mover_flecha_menu_pause
sumar_opcion_pause:
		mov AL, [opcion_pause]
		mov AH, [maximo_pause]
		inc AL
		cmp AL, AH
		je volver_a_maximo_pause
		mov [opcion_pause], AL
		jmp mover_flecha_menu_pause
volver_a_cero_pause:
		mov AL, 0
		mov [opcion_pause], AL
		jmp mover_flecha_menu_pause
volver_a_maximo_pause:
		mov AL, [maximo_pause]
		dec AL
		mov [opcion_pause], AL
		jmp mover_flecha_menu_pause
mover_flecha_menu_pause:
		mov AX, [xFlecha_pause]
		mov BX, [yFlecha_pause]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 20
		mov CL, [opcion_pause]
ciclo_ubicar_flecha_menu_pause:
		cmp CL, 0
		je pintar_flecha_menu_pause
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_pause
pintar_flecha_menu_pause:
		mov [xFlecha_pause], AX
		mov [yFlecha_pause], BX
		call pintar_flecha_pause
		jmp entrada_menu_pause
		;;
fin_menu_pause:
		ret

;; pintar_flecha - pinta una flecha
pintar_flecha_pause:
		mov AX, [xFlecha_pause]
		mov BX, [yFlecha_pause]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret

menu_configuracion:
		call menu_config
		mov AL, [opcion_conf]
		;; > CAMBIAR
		cmp AL, 0
		je cambiar_teclas
		;; > REGRESAR
		cmp AL, 1
		je ir_inicio
ir_inicio:
		call menu_principal
cambiar_teclas: 
		call clear_pantalla
		mov DX, 0000
		mov DL, 0c ;; COLUMNAS
		mov DH, 03 ;; FILAS 
		mov BH, 00 ;; DISPLAY PAGE
		mov AH, 02 ;; VIDEO FUNCTION
		int 10
		;; <<-- posicionar el cursor
		;; CONFIGURACION 
cambiar_derecha:
		push DX
		add DH, 05
		mov DX, offset derecha
		mov AH, 09
		int 21
		pop DX
		;; KEYBOARD INPUT
		push AX
		mov AH, 00
		int 16
		cmp AL, 0000
		je cambiar_derecha
		;;push AX
		;; le doy la lectura del caracter
		mov control_derecha, AH
		;pop AX 
		push AX
		push BX
		mov BL, [control_derecha] 
		call teclaCalc
		pop BX
		pop AX
		;mov [control_derecha], AL
cambiar_abajo:
		add DH, 02
		add DL, 02 
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset abajo
		mov AH, 09
		int 21
		pop DX
		;; KEYBOARD INPUT
		mov AH, 00
		int 16
		cmp AL, 0000
		je cambiar_abajo
		;push AX
		mov control_abajo, AH
		;pop AX
		push BX
		mov BL, [control_abajo]
		call teclaCalc
		pop BX
cambiar_arriba:
		add DH, 02
		;add DL, 02 
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset arriba
		mov AH, 09
		int 21
		pop DX
		;; KEYBOARD INPUT
		mov AH, 00
		int 16
		cmp AL, 00
		je cambiar_arriba
		;push AX
		;; editar aqui
		mov control_arriba, AH ;; no esta funcionando
		;pop AX 
		push BX
		mov BL, [control_arriba]
		call teclaCalc
		pop BX

cambiar_izquierda:
		add DH, 02
		;add DL, 02 
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset izquierda
		mov AH, 09
		int 21
		pop DX
		;; KEYBOARD INPUT
		mov AH, 00
		int 16
		cmp AL, 00
		je cambiar_izquierda
		;push AX
		mov control_izquierda, AH
		;pop AX 
		push BX
		mov BL, [control_izquierda]
		call teclaCalc
		pop BX
		jmp inicio
;; MENU CONFIG
;; ENTRADA -> NONE 
;; SALIDA  -> NONE
menu_config:
		call clear_pantalla
		mov AL, 0
		mov [opcion_conf], AL      ;; reinicio de la variable de salida
		mov AL, 2
		mov [maximo_conf], AL
		mov AX, 50
		mov BX, 80
		mov [xFlecha_conf], AX
		mov [yFlecha_conf], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; INICIAR JUEGO ;; --> 12 x 15
		mov DL, 0c ;; COLUMNAS
		mov DH, 05 ;; FILAS 
		mov BH, 00 ;; DISPLAY PAGE
		mov AH, 02 ;; VIDEO FUNCTION
		int 10
		;; <<-- posicionar el cursor
		;; CONFIGURACION 
		push DX
		add DH, 05
		mov DX, offset controles
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; DERECHA
		add DH, 02
		add DL, 02 
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset derecha
		mov AH, 09
		int 21
		pop DX
		;; PONER TECLA ACTUAL
		push BX
		mov BL, [control_derecha]
		call teclaCalc
		pop BX
		;;
		;;;; ABAJO 
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset abajo
		mov AH, 09
		int 21
		pop DX
		;;
		push BX
		mov BL, [control_abajo]
		call teclaCalc
		pop BX

		;;;; CONFIGURACION
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset arriba 
		mov AH, 09
		int 21
		pop DX
		;;
		push BX
		mov BL, [control_arriba]
		call teclaCalc
		pop BX
		push DX
		;;;; DERECHA
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset izquierda
		mov AH, 09
		int 21
		pop DX
		;;;; 
		push BX
		mov BL, [control_izquierda]
		call teclaCalc
		pop BX

		;;;; CAMBIAR
		add DH, 02
		sub DL, 02 
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		add DH, 05
		mov DX, offset cambiar 
		mov AH, 09
		int 21
		pop DX
		;; REGRESAR 
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset regresar
		mov AH, 09
		int 21
		pop DX
		;;;;
		call pintar_flecha_conf
		;;;;
		;; LEER TECLA
		;;;;
entrada_menu_conf:
		mov AH, 00
		int 16
		cmp AH, [control_arriba]
		je restar_opcion_conf
		cmp AH, [control_abajo]
		je sumar_opcion_conf
		cmp AH, 3b  ;; le doy F1
		je fin_menu_conf
		jmp entrada_menu_conf
restar_opcion_conf:
		mov [opcion_conf], 0
		jmp mover_flecha_menu_conf
sumar_opcion_conf:
		mov [opcion_conf], 1
		jmp mover_flecha_menu_conf
mover_flecha_menu_conf:
		mov AX, [xFlecha_conf]
		mov BX, [yFlecha_conf]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 75
		mov CL, [opcion_conf]
ciclo_ubicar_flecha_menu_conf:
		cmp CL, 0
		je pintar_flecha_menu_conf
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_conf
pintar_flecha_menu_conf:
		mov [xFlecha_conf], AX
		mov [yFlecha_conf], BX
		call pintar_flecha_conf
		jmp entrada_menu_conf
		;;
fin_menu_conf:
		ret

;; pintar_flecha - pinta una flecha
pintar_flecha_conf:
		mov AX, [xFlecha_conf]
		mov BX, [yFlecha_conf]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret

teclaCalc: 
		cmp BL, [codigoA]
		je escribirA
		cmp BL, [codigoB]
		je escribirB
		cmp BL, [codigoC]
		je escribirC
		cmp BL, [codigoD]
		je escribirD
		cmp BL, [codigoE]
		je escribirE
		cmp BL, [codigoF]
		je escribirF
		cmp BL, [codigoG]
		je escribirG
		cmp BL, [codigoH]
		je escribirH
		cmp BL, [codigoI]
		je escribirI
		cmp BL, [codigoJ]
		je escribirJ
		cmp BL, [codigoK]
		je escribirK
		cmp BL, [codigoL]
		je escribirL
		cmp BL, [codigoM]
		je escribirM
		cmp BL, [codigoN]
		je escribirN
		cmp BL, [codigoO]
		je escribirO
		cmp BL, [codigoP]
		je escribirP
		cmp BL, [codigoQ]
		je escribirQ
		cmp BL, [codigoR]
		je escribirR
		cmp BL, [codigoS]
		je escribirS
		cmp BL, [codigoT]
		je escribirT
		cmp BL, [codigoU]
		je escribirU
		cmp BL, [codigoV]
		je escribirV
		cmp BL, [codigoW]
		je escribirW
		cmp BL, [codigoX]
		je escribirX
		cmp BL, [codigoY]
		je escribirY
		cmp BL, [codigoZ]
		je escribirZ
		cmp BL, [codigoArr]
		je escribirArr
		cmp BL, [codigoAba]
		je escribirAba
		cmp BL, [codigoDer]
		je escribirDer
		cmp BL, [codigoIzq]
		je escribirIzq

;; FUNCIONES ESCRITURA -> IMPRESION
escribirA: 
	push DX
	mov DX, offset letraA
	mov AH, 09
	int 21h
	pop DX
	ret 

escribirB: 
	push DX
	mov DX, offset letraB
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters C to Y

escribirC: 
	push DX
	mov DX, offset letraC
	mov AH, 09
	int 21h
	pop DX
	ret 

escribirD: 
	push DX
	mov DX, offset letraD
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters E to X

escribirE: 
	push DX
	mov DX, offset letraE
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters F to W

escribirF: 
	push DX
	mov DX, offset letraF
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters G to V

escribirG: 
	push DX
	mov DX, offset letraG
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters H to U

escribirH: 
	push DX
	mov DX, offset letraH
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters I to T

escribirI: 
	push DX
	mov DX, offset letraI
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters J to S

escribirJ: 
	push DX
	mov DX, offset letraJ
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters K to R

escribirK: 
	push DX
	mov DX, offset letraK
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters L to Q

escribirL: 
	push DX
	mov DX, offset letraL
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters M to P

escribirM: 
	push DX
	mov DX, offset letraM
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters N to O

escribirN: 
	push DX
	mov DX, offset letraN
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters O to N

escribirO: 
	push DX
	mov DX, offset letraO
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters P to L

escribirP: 
	push DX
	mov DX, offset letraP
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters Q to K

escribirQ: 
	push DX
	mov DX, offset letraQ
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters R to J

escribirR: 
	push DX
	mov DX, offset letraR
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters S to I

escribirS: 
	push DX
	mov DX, offset letraS
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters T to H

escribirT: 
	push DX
	mov DX, offset letraT
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters U to G

escribirU: 
	push DX
	mov DX, offset letraU
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters V to F

escribirV: 
	push DX
	mov DX, offset letraV
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters W to E

escribirW: 
	push DX
	mov DX, offset letraW
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letters X to D

escribirX: 
	push DX
	mov DX, offset letraX
	mov AH, 09
	int 21h
	pop DX
	ret 

; Repeat the pattern for letters Y to C

escribirY: 
	push DX
	mov DX, offset letraY
	mov AH, 09
	int 21h
	pop DX
	ret 

; Continue the pattern for letter Z

escribirZ: 
	push DX
	mov DX, offset letraZ
	mov AH, 09
	int 21h
	pop DX
	ret 
escribirArr: 
	push DX
	mov DX, offset letraArriba
	mov AH, 09
	int 21h
	pop DX
	ret 
escribirDer: 
	push DX
	mov DX, offset letraDer
	mov AH, 09
	int 21h
	pop DX
	ret 
escribirAba: 
	push DX
	mov DX, offset letraAbajo
	mov AH, 09
	int 21h
	pop DX
	ret 
escribirIzq: 
	push DX
	mov DX, offset letraIzq
	mov AH, 09
	int 21h
	pop DX
	ret

pintar_mapa2: ;sirve para ver si ha ganado
		mov AL, 00   ;; fila
		mov [cajasRestantes],00
		;;
ciclo_v2:
		cmp AL, 19
		je fin_pintar_mapa2
		mov AH, 00   ;; columna
		;;
ciclo_h2:
		cmp AH, 28
		je continuar_v2
		push AX
		call obtener_de_mapa
		pop AX
		;;
        cmp DL, CAJA
		je inc_num_cajas
		;;
		jmp continuar_h2
inc_num_cajas:
		inc [cajasRestantes]
		jmp continuar_h
continuar_h2:
		inc AH
		jmp ciclo_h2
continuar_v2:
		inc AL
		jmp ciclo_v2
fin_pintar_mapa2:
        call pintar_nombre
        cmp[cajasRestantes],00
		je ganar_juego
		ret
ganar_juego:
		call delay
		call delay
		call clear_pantalla
		;;;; INICIAR JUEGO ;; --> 12 x 15
		mov DL, 0c ;; COLUMNAS
		mov DH, 05 ;; FILAS 
		mov BH, 00 ;; DISPLAY PAGE
		mov AH, 02 ;; VIDEO FUNCTION
		int 10
		;; <<-- posicionar el cursor
		;; CONFIGURACION 
		push DX
		add DH, 05
		mov DX, offset msg_ganador
		mov AH, 09
		int 21
		pop DX
		call delay
		call delay
		call clear_pantalla
		;;;; INICIAR JUEGO ;; --> 12 x 15
		mov DL, 0c ;; COLUMNAS
		mov DH, 05 ;; FILAS 
		mov BH, 00 ;; DISPLAY PAGE
		mov AH, 02 ;; VIDEO FUNCTION
		int 10
		;; <<-- posicionar el cursor
		;; CONFIGURACION 
		push DX
		add DH, 05
		mov DX, offset msg_ganador
		mov AH, 09
		int 21
		pop DX
		call delay
		call delay
		call clear_pantalla
		;;;; INICIAR JUEGO ;; --> 12 x 15
		mov DL, 0c ;; COLUMNAS
		mov DH, 05 ;; FILAS 
		mov BH, 00 ;; DISPLAY PAGE
		mov AH, 02 ;; VIDEO FUNCTION
		int 10
		;; <<-- posicionar el cursor
		;; CONFIGURACION 
		push DX
		add DH, 05
		mov DX, offset msg_ganador
		mov AH, 09
		int 21
		pop DX
		call delay
		call delay
		jmp inicio
fin:
.EXIT
END

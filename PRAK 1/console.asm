; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������

comment * -----------------------------------------------------
                     Build this console app with
                  "MAKEIT.BAT" on the PROJECT menu.
        ----------------------------------------------------- *

    .data?
        buffer dd ?
        number dd ?
    .data
      GREETING equ "Enter number from 1-9: "  
      BIGGER equ "bigger than 9"   
      ZERO_MSG db "zero", 10, 13, 0
      ONE_MSG db "one", 10, 13, 0
      TWO_MSG db "two", 10, 13, 0
      THREE_MSG db "three", 10, 13, 0
      FOUR_MSG db "Four", 10, 13, 0
      FIVE_MSG db "Five", 10, 13, 0
      SIX_MSG db "Six", 10, 13, 0
      SEVEN_MSG db "Seven", 10, 13, 0
      EIGHT_MSG db "Eight", 10, 13, 0
      NINE_MSG db "Nine", 10, 13, 0
      UNKNOWN_MSG db "Unknown", 10, 13, 0
      NEGATIVE_MSG db "Number is negative", 10, 13, 0
      POSITIVE_MSG db "Number is positive", 10, 13, 0

    .code

start:
   
; �������������������������������������������������������������������������

    call main
    inkey
    exit

; �������������������������������������������������������������������������

main proc

    cls

    mov buffer, input(GREETING)
    mov number, sval(buffer)

    .if number < 0
        print addr NEGATIVE_MSG
        mov eax, number
        imul eax, -1
        mov number, eax
    .else 
        print addr POSITIVE_MSG

    
    .if number == 0
        print addr ZERO_MSG
    .elseif number == 1
        print addr ONE_MSG
    .elseif number == 2 
        print addr TWO_MSG
    .elseif number == 3
        print addr THREE_MSG
    .elseif number == 4
        print addr FOUR_MSG
    .elseif number == 5
        print addr FIVE_MSG
    .elseif number == 6
        print addr SIX_MSG
    .elseif number == 7
        print addr SEVEN_MSG
    .elseif number == 8
        print addr EIGHT_MSG
    .elseif number == 9
        print addr NINE_MSG
    .else 
        print addr UNKNOWN_MSG
    .endif
    ret

main endp

; �������������������������������������������������������������������������

end start

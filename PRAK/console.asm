; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�
    include \masm32\include\masm32rt.inc
; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�

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
   
; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�

    call main
    inkey
    exit

; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�

main proc

    cls

    mov buffer, input(GREETING)
    mov number, sval(buffer)

    cmp number,0
    jl negative
    print addr POSITIVE_MSG

    ; �韲粮諞纃蒹 關鈞辮鉅 �蔡�
zero:
    ; "落譛"
    cmp number, 0
    jne one
    print addr ZERO_MSG
    ret
    
one:
    ; "冷蓁"
    cmp number, 1
    jne two
    print addr ONE_MSG
    ret

two:
    ; "亭�"
    cmp number, 2
    jne three
    print addr TWO_MSG
    jmp end_main

three:
    ; "咒�"
    cmp number, 3
    jne four
    print addr THREE_MSG
    jmp end_main

four:
    ; "怛鴿鞳"
    cmp number, 4
    jne five
    print addr FOUR_MSG
    jmp end_main

five:
    ; "��鴾"
    cmp number, 5
    jne six
    print addr FIVE_MSG
    jmp end_main

six:
    ; "懊髓�"
    cmp number, 6
    jne seven
    print addr SIX_MSG
    jmp end_main

seven:
    ; "刔踰"
    cmp number, 7
    jne eight
    print addr SEVEN_MSG
    jmp end_main

eight:
    ; "卓驟踰"
    cmp number, 8
    jne nine
    print addr EIGHT_MSG
    jmp end_main

nine:
    ; "偵��鴾"
    cmp number, 9
    jne bigger
    print addr NINE_MSG
    jmp end_main

bigger:
    print addr UNKNOWN_MSG
    cmp number,0
    jl negative
    print addr POSITIVE_MSG
    ret
    
negative:
    print addr NEGATIVE_MSG
    mov eax, number
    imul eax, -1
    mov number, eax
    jmp zero

end_main:
    ret

main endp

; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�

end start

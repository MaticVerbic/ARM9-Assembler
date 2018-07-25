 .text

TABELA:           .hword 1, 5, -1, 8, -130, 1024, 10, 64, -80, 256 
VELIKOST_TABELE:  .byte 10
                  .align
MIN:              .space 2
                  .align
MIN_INDEKS:       .space 1

          .align
          .global __start
__start:   
       ADR r0, TABELA
       LDRSH r1, [r0]
       MOV r2, r1    @first MIN
       ADR r0, VELIKOST_TABELE
       LDRB r3, [r0]
       MOV r4, #0 @loop counter
       MOV r5, #0 @odmik
       MOV r6, #0 @index counter
 
LOOP: 
       CMP r4, r3 @while loop counter <= VELIKOST_TABELE 
       BHI KONEC
       CMP r1, r2 
       BLT MANJSE @if r1 < r2
       BGE SESTEJ @else

MANJSE:
       MOV r2, r1
       MOV r7, r6
SESTEJ:
       ADD r4, #1
       ADD r5, #2
       ADD r6, #1
       ADR r0, TABELA
       LDRSH r1, [r0,r5] 
       B LOOP  

KONEC: 
       STRH r2, MIN
       STRB r7, MIN_INDEKS 
       
       
__end:    b __end
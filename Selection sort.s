 .text

TABELA:           .hword 1, 5, -1, 8, -130, 1024, 10, 64, -80, 256 
VELIKOST_TABELE:  .byte 10

          .align
          .global __start
__start:   
      MOV r3, #1 @inner števec
      MOV r4, #0 @loop števec
      MOV r6, #2 @notranji odmik
      MOV r7, #0 @zunanji odmik
      ADR r0, VELIKOST_TABELE
      LDRB r5, [r0] @velikost_tabele
         
LOOP: 
    CMP r4, r5        @while r4 < r5
    BEQ KONEC 
    ADR r0, [TABELA] 
    LDRSH r1, [r0,r7] @get first
INNER:
    CMP r3, r5 @while r3 < r5
    BEQ LOOP_CALC
    ADR r0, [TABELA] 
    LDRSH r2, [r0,r6] @get current
    CMP r1, r2
    BLT INNER_CALC    @if r2 < r0:
    STRH r1, [r0, r6] @store r1
    MOV r1, r2        @replace r1 with r2
INNER_CALC:
    ADD r6, #2
    ADD r3, #1
    B INNER
LOOP_CALC:
    STRH r1, [r0, r7]  @store min  
    ADD r7, #2
    ADD r4, #1   
    MOV r3, r4
    ADD r3, #1
    MOV r6, r7
    ADD r6, #2    
    B LOOP
KONEC:       
       
__end:    b __end
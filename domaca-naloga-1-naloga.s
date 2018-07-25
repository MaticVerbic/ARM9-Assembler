 .text              
NIZ1: .asciz "Danes je Lep Dan" 
NIZ2: .space 17 
          .align
          .global __start
__start:
     MOV r3, #0x20      @razlika       
     MOV r5, #0         @stevec     
     ADR r0, NIZ2
     MOV r4, r0         @naslov za shranjevanje                           
     ADR r0, NIZ1    
     LDRb r1, [r0, #4] 
     ADD r0, r0, #4     @naslov za nalaganje
LOOP: 
     CMP r5, #12        @while r1 is not 12:
       BEQ KONEC
     CMP r1, #0x20
       BEQ PRESLEDEK
     CMP r1, #0x60   
       BHI ODSTEJ       @if r1 > 60: 
       BLO PRISTEJ      @if r1 < 60:
ODSTEJ: 
     SUB r2, r1, r3
     B SHRANI
PRISTEJ:
     ADD r2, r1, r3
     B SHRANI
PRESLEDEK:
     MOV r2, #0x20
SHRANI: 
     STRB r2, [r4]     
     ADD r4, #1
     ADD r5, #1
     ADD r0, #1
     LDRb r1, [r0]
     B LOOP
KONEC:     
    
__end:    b __end





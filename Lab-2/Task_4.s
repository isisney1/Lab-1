.section .bss
.global ram
.lcomm ram, 256             # Reserve 256 bytes of RAM (uninitialized memory)

.section .text
.global fill_ram            # Make function visible to C program

fill_ram:
    #Store FFh into RAM locations 50H - 58H using indirect addressing

    movl $(ram + 0x50), %eax
    movb $1, %cl              # Start at 1
    movb $10, %ch             # End at n (n = 10)
    incb %ch

    ram_loop:
        addb %cl, (%eax)
        incb %cl
        cmpb %ch, %cl
        jne ram_loop

    ret                     # Return control back to C program

.section .note.GNU-stack,"",@progbits
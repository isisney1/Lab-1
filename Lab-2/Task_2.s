.section .bss
.global ram
.lcomm ram, 256             # Reserve 256 bytes of RAM (uninitialized memory)

.section .text
.global fill_ram            # Make function visible to C program

fill_ram:
    #Store FFh into RAM locations 50H - 58H using indirect addressing

    movl $(ram + 0x50), %eax

    ram_loop:
        movb $0xFF, (%eax)
        incl %eax
        cmpl $(ram + 0x59), %eax
        jne ram_loop

    ret                     # Return control back to C program

.section .note.GNU-stack,"",@progbits

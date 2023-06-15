        .text
        .set noreorder
init:
        li    $t0, 0xFFFF0010   # address to Timer registers:
                                # +0: Timer control register
                                # +4: Timer count register
                                # +8: Timer compare register

        li    $t1, 0
        sw    $t1, 4($t0)       # reset counter register

        li    $t1, 63           # count from 0 to 63
        sw    $t1, 8($t0)       # compare register := 63

        li    $t1, 0b101001     # "101001": compare interrupt enable,
                                #           compare reset enable,
                                #           timer start
        sw    $t1, 0($t0)       # control register := "101001"

        li    $t0, 0xFFFF0000   # address to I/O registers:
                                # +0: Input control register
 
        li    $t1, 0b10         # "10": interrupt enable
        sw    $t1, 0($t0)       # control register := "10"

        li    $t0, 0x0C03       # enable HW Interrupt 1 (input): bit 11
                                # enable HW Interrupt 0 (timer): bit 10
                                # set user mode:     bit 1
                                # enable interrupts: bit 0

        mtc0  $t0, $12          # CP0 status := 0xC03

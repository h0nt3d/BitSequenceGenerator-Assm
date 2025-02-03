.global _start
_start:
br  Start  

.org 0x100
Start:

	movia r11,0x00008880  # r11 = address of red leds
        movia r10,0x00008850  # r10 = address of switches 

	movia r12,0x00008890  # r12 = address of green leds
	movia r13,0x000088E0  # r13 = address of control register of green leds
	
	ori r4,r0,2	      # r4 = 2

	stwio r4,(r13)	      # send r4 to r13


	ori r3,r0,1	      # r5 OR 1

top:
	
	#ldwio r3,(r10)        # load r3 from the switches

	stwio r3,(r11)        # send r3 to the red leds	

	andi r6,r3,8 	      # r6 = r3 AND 8

	srli r6,r6,3	      # shift to bit 0 in r6 

	andi r7,r3,1 	      # r1 = r3 AND 1

	xor r6,r6,r7	      # r6 = r6 XOR r7
	
	stwio r6,(r12)        # send r6 to green LEDs

	slli r3,r3,1 	      # shift r3 left one bit
	
	or r3,r3,r6	      # r3 = r3 OR r6
	br top                # repeat forever


#----------------------------------------------




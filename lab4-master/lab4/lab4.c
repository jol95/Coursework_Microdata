char plain[132] __attribute__((section(".data")));
unsigned int coded[] __attribute__((section(".data"))) = {0x46a695d7, 0x195e7e5e, 0x49ac331d, 0x07b6216a, 0x3caf8807, 0x95a7669c, 0x9005cad7, 0x5945d28f, 0x97c04427, 0xee2452f3, 0xe708b1a1, 0x1b412da6, 0xa4231bef, 0xbf702355, 0x5432b290, 0xea53d602, 0x3f4dc272, 0xfc48f58d, 0xe27e8357, 0x9dab7d77, 0x41ab240d, 0x5ce4c1f3, 0x08530383, 0x4ab67a47, 0xe68c4e3a, 0xfb7ae1e4, 0x9c29c1cf, 0x4f31a24a, 0x5e39d08b, 0x697d7890, 0xa4da4f88, 0x969f1a94, 0xa39eee10, 0x032aed55, 0x8616a3c4, 0xefb5463a, 0x294c3d69, 0x1d82f932, 0x90da5b72, 0xefe41814, 0x000e1b85, 0x74c312a5, 0x244e4a69, 0x2fbf1e4a, 0x63383b03, 0x7bf50642, 0x8c0373b9, 0x1a1d9589, 0x2e0809d5, 0x3f951efe, 0xa0914aa5, 0x1ef530e7, 0xadbb3406, 0x730c64f8, 0x0d93a218, 0x137f7d7c, 0x27edf79a, 0x3502752d, 0x9adcf6bd, 0x9b53bf0b, 0x2e25ea87, 0x886dedfd, 0xcbdc59fe, 0x833e1140, 0x78c309f1, 0x571b7228, 0x9d07ecd3, 0x06aadb8c, 0x24f39e23, 0x1507f2bf, 0x7ba90c99, 0x49715f9b, 0x4a759a81, 0x43272643, 0};
// unsigned int abc[] = {0xf37bf755, 0x096a937b, 0x10ad04d8, 0};

/*
# FUNCTION codgen(): UNSIGNED INTEGER;
#  LOCAL SIGNED INTEGER   n;
#  LOCAL UNSIGNED INTEGER x, y;
#  BEGIN
#    n := [right-justify the five bits "seed"<31:27>, and zero-extend];
#   WHILE (n >= 0) LOOP
#    x := [multiply "seed" by the constant 8];
#    y := [divide "seed" (unsigned !) by the constant 8];
#    seed := x - y;  [ignore overflow condition]
#    n  :=  n - 1;
#   ENDLOOP;
#   RETURN( seed XOR 0x3c8c693b );
#  END;
*/
unsigned int codgen(unsigned int *seed_addr)
{
    int n;
    unsigned int x, y;
    n = (*seed_addr >> 27);     // n := [right-justify the five bits "seed"<31:27>, and zero-extend];
    while (n >= 0)              // loop including to n==0       
    {
        x = (*seed_addr << 3);  // x := [multiply "seed" by the constant 8];
        y = (*seed_addr >> 3);  // y := [divide "seed" (unsigned !) by the constant 8];
        *seed_addr = x - y;     // update seed
        n = n-1;                // decrement
    }
    return (*seed_addr ^ 0x3c8c693b);   // return seed XOR 0x3c8c693b
}

/*
# FUNCTION decode( wordarr, bytearr ): UNSIGNED INTEGER;
#    (wordarr, bytearr passed by reference)
#  LOCAL UNSIGNED INTEGER m, r, x, y;
#  BEGIN
#    x := ONE'S-COMPLEMENT of codgen();
#    IF ([contents of word at "wordarr"] = 0) THEN  
#      [byte pointed to by "bytearr"] := 0;
#      r := x;
#    ELSE
#      y := decode( wordarr+, bytearr+ );  # "k+" means "successor in k"
#      m := ( x + y ) XOR [contents of word at "wordarr"];
#      [byte pointed to by "bytearr"] := [the eight bits at "m"<30:23>];
#      r := TWO'S-COMPLEMENT OF codgen();
#      r := x + y + m + r + 5;
#    ENDIF;
#    RETURN( r );
#  END;
*/

unsigned int decode(unsigned int *wordarr, char *bytearr, unsigned int *seed_addr)
{
	unsigned int m, r, x, y;        
	x = ~codgen(seed_addr);	        // x := ONE'S-COMPLEMENT of codgen();
	if (*wordarr == 0)              // if wordarray is empty
    {
		*bytearr = 0;               // then set bytearray to empy                                    
		r = x;                      // then r = x;
	} 
    else 
    {
		y = decode(wordarr + 1, bytearr + 1, seed_addr);    // iterate decode if not complete
		wordarr--;                  // decrement wordarr
		bytearr--;                  // decrement bytearr
		m = (x + y) ^ *wordarr;		
		*bytearr = (m >> 23);       // [byte pointed to by "bytearr"] := [the eight bits at "m"<30:23>];
		r = ~codgen(seed_addr) + 1; // r := TWO'S-COMPLEMENT OF codgen();
		r = x + y + m + r + 5;      // r := x + y + m + r + 5;
	}
	return r;                       // return r
}

int main(void)
{
    unsigned int seed = 0x3179c241; //  initialize seed
	decode(coded, plain, &seed);	//  runs decode with string decoded
	while (1==1)                    // infinite loop
    {
        //loop
	}
}

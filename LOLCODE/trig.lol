HAI 1.2

I HAS A angles_given
I HAS A sides_given
I HAS A angle_solve

VISIBLE "What angle(s) are given? (A, B, or C; separate with commas if more than one)"
GIMMEH angles_given

VISIBLE "What side(s) are given? (opposite, adjacent, hypotenuse; separate with commas if more than one)"
GIMMEH sides_given

VISIBLE "What angle are you solving for? (A, B, or C)"
GIMMEH angle_solve

VISIBLE "Based on your input, you should use:"

BOTH SAEM sides_given AN "opposite, hypotenuse"
    O RLY?
        YA RLY
            VISIBLE "sine (sin)"
        NO WAI
            BOTH SAEM sides_given AN "adjacent, hypotenuse"
                O RLY?
                    YA RLY
                        VISIBLE "cosine (cos)"
                    NO WAI
                        BOTH SAEM sides_given AN "opposite, adjacent"
                            O RLY?
                                YA RLY
                                    VISIBLE "tangent (tan)"
                                NO WAI
                                    VISIBLE "Please check your input or use a combination of trig functions."
                            OIC
                OIC
    OIC

KTHXBYE

\ FF.FTH display floating point values as fractions
\ Author: Robert van Engelen

.( Loading FF...)

ANEW _FF_

0e+0 FVALUE P
0e+0 FVALUE S
0e+0 FVALUE T
0e+0 FVALUE U
0e+0 FVALUE V
0e+0 FVALUE W
0e+0 FVALUE X
0e+0 FVALUE Y
0e+0 FVALUE Z

: (FF)  ( F: r -- )

  FDUP FDUP FLOOR F= IF F. R>DROP EXIT THEN

       FDUP TO U TO X
  0e+0 FDUP TO V TO Y
  1e+0 FDUP TO W TO Z

  1e+1 PRECISION 10 UMIN NEGATE S>F F** TO P

  BEGIN

    U FLOOR     TO T
    U T F-      TO U
    T Z F* V F+ TO S
    Z           TO V
    S           TO Z
    T Y F* W F+ TO S
    Y           TO W
    S           TO Y
    Z Y F/      TO T

  U F0<> WHILE
  T X F- FABS P F> WHILE

    1e+0 U F/   TO U

  REPEAT THEN
;

\ FF. display floating point value as a fraction with the specified SET-PRECISION up to 1E-10
: FF.	( F: r -- )
  (FF) Z F. ." / " Y F.
;

\ PF. display floating point value as a proper fraction with the specified SET-PRECISION up to 1E-10
: PF.	( F: r -- )
  (FF) T FTRUNC FDUP F0= IF FDROP Z ELSE FDUP F. Y F* Z F- FABS THEN
  F. ." / " Y F.
;

use Test;

use StepByStep;
@file-src-code-lines = $?FILE.IO.slurp.lines;

{
    # Next two comments must have 4 leading spaces.
    my @linesXYZ = next-code-lines(2, :shift-left(3) );
    # SRC-LINE-X
    # SRC-LINE-Y
    is-deeply
        @linesXYZ,
        [ ' # SRC-LINE-X', ' # SRC-LINE-Y', ],
        'shift left 3 - one space left'
    ;
}

done-testing;

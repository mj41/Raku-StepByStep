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
        'shift-left - three characters'
    ;
}

$default-shift-left = 2;
{
    # Next two comments must have 4 leading spaces.
    my @linesXYZ = next-code-lines;
    # SRC-LINE-R
    # SRC-LINE-S
    is-deeply
        @linesXYZ,
        [ '  # SRC-LINE-R', '  # SRC-LINE-S', ],
        'set default shift left - two characters'
    ;
}

done-testing;

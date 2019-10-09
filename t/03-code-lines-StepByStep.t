use Test;

use StepByStep;
@file-src-code-lines = $?FILE.IO.slurp.lines;

# Next lines must be lines numbers 7 and 8.
# SRC-LINE-A
# SRC-LINE-B
is-deeply
    code-lines(7,2),
    [ '# SRC-LINE-A', '# SRC-LINE-B' ],
    'code-lines - absolute lines works'
;

# SRC-LINE-E
# SRC-LINE-F
is-deeply
    rel-code-lines(-3,2), # skip 'is-deeply'
    [ '# SRC-LINE-E', '# SRC-LINE-F' ],
    'rel-code-lines - relative lines works'
;

# SRC-LINE-I
# SRC-LINE-J
# SRC-LINE-K
my @linesIJK = prev-code-lines(3);
is-deeply
    @linesIJK,
    [ '# SRC-LINE-I', '# SRC-LINE-J', '# SRC-LINE-K' ],
    'prev-code-lines'
;


my @linesXYZ = next-code-lines(3);
# SRC-LINE-X
# SRC-LINE-Y
# SRC-LINE-Z
is-deeply
    @linesXYZ,
    [ '# SRC-LINE-X', '# SRC-LINE-Y', '# SRC-LINE-Z' ],
    'next-code-lines'
;

sub testsub-lines-before-call {
    my @lines = lines-before-call(2);
    is-deeply
        @lines,
        [ '# LINE-A-BEFORE-CALL', '# LINE-B-BEFORE-CALL' ],
        'lines before call'
    ;
}

# LINE-A-BEFORE-CALL
# LINE-B-BEFORE-CALL
testsub-lines-before-call;

sub testsub-lines-after-call {
    my @lines = lines-after-call(2);
    is-deeply
        @lines,
        [ '# LINE-A-AFTER-CALL', '# LINE-B-AFTER-CALL' ],
        'lines after call'
    ;
}

testsub-lines-after-call;
# LINE-A-AFTER-CALL
# LINE-B-AFTER-CALL


done-testing;

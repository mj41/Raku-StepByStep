use Test;

use StepByStep;
@file-src-code-lines = $?FILE.IO.slurp.lines;

# Next lines must be lines numbers 7 and 8.
# SRC-LINE-A
# SRC-LINE-B
is-deeply
    code-lines(7,2),
    [ '# SRC-LINE-A', '# SRC-LINE-B' ],
    'abs lines works'
;

# SRC-LINE-X
# SRC-LINE-Y
is-deeply
    rel-code-lines(-2,2),
    [ '# SRC-LINE-X', '# SRC-LINE-Y' ],
    'rel lines works'
;

sub test-lines-before-call {
    is-deeply
        lines-before-call(2),
        [ '# LINE-A-BEFORE-CALL', '# LINE-B-BEFORE-CALL' ],
        'lines before call'
    ;
}

# LINE-A-BEFORE-CALL
# LINE-B-BEFORE-CALL
test-lines-before-call;

sub test-lines-after-call {
    is-deeply
        lines-after-call(2),
        [ '# LINE-A-AFTER-CALL', '# LINE-B-AFTER-CALL' ],
        'lines after call'
    ;
}

test-lines-after-call;
# LINE-A-AFTER-CALL
# LINE-B-AFTER-CALL


done-testing;

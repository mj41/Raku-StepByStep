use Test;

use StepByStep;
@sbs-file-src-code-lines = $?FILE.IO.slurp.lines;

# the next line must be line number 7.
# LINE-7
is sbs-code-line(7), '# LINE-7', 'abs code line';
# The next line must be line number 10.
is sbs-rel-code-line(-3), '# LINE-7', 'minus three code line';

{
    # LINE-MINUSONE-TOTRIM
    is sbs-rel-code-line(-1), '# LINE-MINUSONE-TOTRIM', 'line to trim';
}

# PREV-CODE-LINE
is sbs-prev-code-line, '# PREV-CODE-LINE', 'prev code line';

is sbs-next-code-line, '# NEXT-CODE-LINE', 'next code line';
# NEXT-CODE-LINE

my $line = sbs-next-line-and-comment-prefix;
my $x = 10;
is $line, 'my $x = 10; # ', 'next-line-and-comment-prefix';

{
    sub testsub-line-before-call {
        is sbs-line-before-call, '# LINE-BEFORE-CALL', 'line before call';
    }

    # LINE-BEFORE-CALL
    testsub-line-before-call;
}

{
    sub testsub-call-line {
        is sbs-call-line, 'testsub-call-line; # CALL-LINE', 'call line';
    }

    testsub-call-line; # CALL-LINE
}

{
    sub testsub-line-after-call {
        is sbs-line-after-call, '# LINE-AFTER-CALL', 'line after call';
    }

    testsub-line-after-call;
    # LINE-AFTER-CALL
}

done-testing;

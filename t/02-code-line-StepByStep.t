use Test;

use StepByStep;
@file-src-code-lines = $?FILE.IO.slurp.lines;

# the next line must be line number 7.
# LINE-7
is code-line(7), '# LINE-7', 'abs code line';
# The next line must be line number 10.
is rel-code-line(-3), '# LINE-7', 'minus three code line';

{
    # LINE-MINUSONE-TOTRIM
    is rel-code-line(-1), '# LINE-MINUSONE-TOTRIM', 'line to trim';
}

# PREV-CODE-LINE
is prev-code-line, '# PREV-CODE-LINE', 'prev code line';

is next-code-line, '# NEXT-CODE-LINE', 'next code line';
# NEXT-CODE-LINE

my $line = next-line-and-comment-prefix;
my $x = 10;
is $line, 'my $x = 10; # ', 'next-line-and-comment-prefix';

sub test-line-before-call {
    is line-before-call, '# LINE-BEFORE-CALL', 'line before call';
}

# LINE-BEFORE-CALL
test-line-before-call;

sub test-line-after-call {
    is line-after-call, '# LINE-AFTER-CALL', 'line after call';
}

test-line-after-call;
# LINE-AFTER-CALL

done-testing;

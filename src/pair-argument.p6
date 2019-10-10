use StepByStep::Code;
use StepByStep::Eval;
@sbs-file-src-code-lines = $?FILE.IO.slurp.lines;

sub foo( $a ) {
    say sbs-prev-code-line;
    print sbs-next-line-and-comment-prefix(:!trim);
    say $a;
    sbs-next-code-line-and-call-line>>.say;
}

sub space {
    say "";
    say "";
}

foo 1;
space;

foo 'text-arg-1';
space;

{
    use MONKEY-SEE-NO-EVAL;
    sbs-eval-and-exception-as-comment( -> { .EVAL }, 'foo :arg1(2); ');
    sbs-eval-and-exception-as-comment( -> { .EVAL }, 'foo arg1 => 2;');
    space;
}

foo 'arg1' => 2;
space;

foo (arg1 => 2);
space;

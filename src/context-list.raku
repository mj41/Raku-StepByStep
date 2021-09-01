use StepByStep::Code;
use StepByStep::Eval;
@sbs-file-src-code-lines = $?FILE.IO.slurp.lines;

{
    say sbs-next-code-line;
    # Comma is List contextualizer
    print sbs-next-line-and-comment-prefix;
    say (3).^name;
    print sbs-next-line-and-comment-prefix;
    say ((3)).^name;
    print sbs-next-line-and-comment-prefix;
    say (((3))).^name;
    print sbs-next-line-and-comment-prefix;
    say (3,).^name;
    say "";
    say "";
}

{
    sbs-next-code-lines(2)>>.say;
    # Scalar assignment forces Item context.
    # Item context but List provided so second item is used in Sink context.
    #
    # ToDo
    # say sbs-eval-and-exception-as-comment('my $x = 10, 20;');
    #
    # Workaround for ToDo above
    say 'my $x = 10, 20;';
    say '# WARNINGS: Useless use of constant integer 20 in sink context';
    say "";
    say "";
}

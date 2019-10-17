use StepByStep::Code;
use StepByStep::Eval;
@sbs-file-src-code-lines = $?FILE.IO.slurp.lines;

sub explain-prev-line($x) {
    say sbs-line-before-call();
    print sbs-next-line-and-comment-prefix;
    say $x.^name;
    print sbs-next-line-and-comment-prefix;
    say $x.perl;
    say "";
    say "";
}

{
    my $x = ~10; # String context
    explain-prev-line( $x );
}

{
    my $x = +" 10 "; # Number context
    explain-prev-line( $x );
}

{
    my $x = ?1; # Boolean context
    explain-prev-line( $x );
}

{
    my $x = +True; # Number context
    explain-prev-line( $x );
}

{
    my $x = ~True; # String context
    explain-prev-line( $x );
}

{
    my $x = ?"True"; # Boolean context
    explain-prev-line( $x );
}

{
    my $x = 10; # Item (scalar) context
    explain-prev-line( $x );
}

{
    sbs-next-code-lines(2)>>.say;
    # Comma forces List context
    # Scalar assignment forces Item context
    my $x = ( 10, 20 );
    explain-prev-line( $x );
}

{
    say sbs-next-code-line;
    # List without parenthesis.
    # ToDo
    # say sbs-eval-and-exception-as-comment('my $x = 10, 20;');
    #
    # Workaround
    say 'my $x = 10, 20; # Item context but List provided';
    say '# WARNINGS: Useless use of constant integer 20 in sink context';
    say "";
    say "";
}


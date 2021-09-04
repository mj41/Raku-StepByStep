use Raku::StepByStep::Code;
use Raku::StepByStep::Eval;
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

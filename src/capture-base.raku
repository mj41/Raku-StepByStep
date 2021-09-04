use Raku::StepByStep::Code;
use Raku::StepByStep::Eval;
@sbs-file-src-code-lines = $?FILE.IO.slurp.lines;

sub explain-prev-lines( $cap, :$explain=True, :$lines-to-show=1, :$space=2 ) {
    sbs-lines-before-call( $lines-to-show )>>.say;
    if $explain {
        print sbs-next-line-and-comment-prefix;
        say $cap.^name;
        print sbs-next-line-and-comment-prefix;
        say $cap.list.perl;
        print sbs-next-line-and-comment-prefix;
        say $cap.hash.perl;
    }
    print sbs-next-line-and-comment-prefix;
    say $cap.perl;
    say "" for 1..$space;
}

{
    my Capture $cap = \( 1 );
    explain-prev-lines( $cap );
}
{
    my Capture $cap = \( a => 1 );
    explain-prev-lines( $cap );
}
{
    my Capture $cap = \( 1, a => 2, 3 );
    explain-prev-lines( $cap );
}
{
    # Now see how Capture with quoted named argument works.
    my Capture $cap = \( 1, 'a' => 2, 3 );
    explain-prev-lines( $cap, :2lines-to-show );
}
{
    # See another one with quoted named argument.
    my $cap1 = \( 1, 'a' => 2, 3 );
    explain-prev-lines( $cap1, :!explain, :2lines-to-show, :0space );
    my $cap2 = \( 1, a => 2, 3 );
    explain-prev-lines( $cap2, :!explain );
}


{
    my $cap1 = \( 1, 2, a => 3 );
    explain-prev-lines( $cap1, :!explain, :0space );
    # Bug https://github.com/rakudo/rakudo/issues/3258
    my $cap2 = \( 1, 2, 'a' => 3 );
    explain-prev-lines( $cap2, :!explain, :2lines-to-show );
}
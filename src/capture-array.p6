use StepByStep;
@sbs-file-src-code-lines = $?FILE.IO.slurp.lines;

sub explain-prev-lines($x, $lines-to-show=1) {
    sbs-lines-before-call( $lines-to-show )>>.say;
    print sbs-next-line-and-comment-prefix;
    say $x.perl;
    print sbs-next-line-and-comment-prefix;
    say $x.WHAT;
    say "";
}

{
    my $x = Array.new(  1, b => 2, 3  ); # Capture with two positional and one named arguments
    explain-prev-lines( $x );
}
{
    my $x = Array.new(  1, :b(2), 3  ); # The same
    explain-prev-lines( $x );
}
{
    # The solution: See another pair or parentheses.
    # Capture with one positional argument (with Array as the value).
    my $x = Array.new(  (1, b => 2, 3)  );
    explain-prev-lines( $x, 3 );
}
{
    # Capture with two positional and one quoted named argument
    my $x = Array.new(  1, 'b' => 2, 3  );
    explain-prev-lines( $x, 2 );
}
{
    my $c = \( 1, 'b' => 2, 3 ); # A stand-alone Capture
    my $x = Array.new( |$c );
    explain-prev-lines( $x, 2 );
}

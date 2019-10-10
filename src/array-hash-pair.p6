use StepByStep::Code;
@sbs-file-src-code-lines = $?FILE.IO.slurp.lines;

sub explain-prev-line($x) {
    say sbs-line-before-call();
    print sbs-next-line-and-comment-prefix;
    say $x.gist;
    print sbs-next-line-and-comment-prefix;
    say $x.perl;
    print sbs-next-line-and-comment-prefix;
    say WHAT $x;
    print sbs-next-line-and-comment-prefix;
    say WHAT $x[0];
    print sbs-next-line-and-comment-prefix;
    say $x[0]<b>;
    say "";
}

{
    my $x = [ { b => 4 }, ]; # Note the comma
    explain-prev-line( $x );
}
{
    my $x = [ { b => 4 } ]; # !WARN! without comma Hash -> Pair
    explain-prev-line( $x );
}
{
    my $x = [ Hash.new('b',4) ]; # !WARN! again, we are even more explicit
    explain-prev-line( $x );
}
{
    my $x = [ ('b',4).Hash ]; # !WARN! again, we are even more explicit
    explain-prev-line( $x );
}
{
    my $x = [ ${ b => 4 } ]; # No comma - Put Hash inside Scalar container
    explain-prev-line( $x );
}
{
    my $x = [ $({ b => 4 }) ]; # No comma - Scalar container with brackets around
    explain-prev-line( $x );
}
{
    my $x = [ ${ b => 4 }, ]; # A comma will not make it worse
    explain-prev-line( $x );
}
{
    my $x = [ $(%( b => 4 )) ]; # No comma - another Hash syntax
    explain-prev-line( $x );
}
{
    my $x = [ b => 4 ]; # A Pair
    explain-prev-line( $x );
}
{
    my $x = [ $( b => 4 ) ]; # Still a Pair
    explain-prev-line( $x );
}

use Raku::StepByStep::Code;
@sbs-file-src-code-lines = $?FILE.IO.slurp.lines;

sub explain-prev-line($x) {
    say sbs-line-before-call();
    print sbs-next-line-and-comment-prefix;
    say $x.gist;
    print sbs-next-line-and-comment-prefix;
    say $x.perl;
    print sbs-next-line-and-comment-prefix;
    say $x[0]<b>;
    print sbs-next-line-and-comment-prefix;
    say $x.^name;
    print sbs-next-line-and-comment-prefix;
    say $x[0].^name;
    say "";
}

sub foo( $a ) {
    say sbs-prev-code-line;
    print sbs-next-line-and-comment-prefix(:!trim);
    say $a;
    print sbs-next-line-and-comment-prefix(:!trim);
    say $a.^name;
    sbs-next-code-line-and-call-line>>.say;
}

sub space {
    say "";
    say "";
}

{
    # Hash as positional argument works as expected.
    say sbs-prev-code-line;
    foo( {b => 4} );
    space;
}

{
    # Hash as Array constructor argument doesn't.
    say sbs-prev-code-line;
    my $x = Array.new( {b => 4} );
    explain-prev-line( $x );
    space;
}
{
    # Hash as Array constructor argument doesn't.
    say sbs-prev-code-line;
    my $x = circumfix:<[ ]>( {b => 4} );
    explain-prev-line( $x );
    space;
}
{
    # Hash as Array constructor argument doesn't.
    say sbs-prev-code-line;
    my $x = [ {b => 4} ];
    explain-prev-line( $x );
    space;
}
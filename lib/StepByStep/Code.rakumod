unit module StepByStep::Code;

our @sbs-file-src-code-lines is export;
our $sbs-default-shift-left is export = 0;

sub sbs-code-line(
    $line-num,
    :$shift-left=$sbs-default-shift-left,
    :$trim=True
) is export {
    my $line = @sbs-file-src-code-lines[ $line-num - 1 ];
    return $line.substr($shift-left) if $shift-left;
    return $line.trim if $trim and !$shift-left;
    return $line;
}

sub sbs-call-frame-line($level-offset) {
    callframe(1 + $level-offset).line;
}

sub sbs-rel-code-line($line-offset=0, :$level-offset=0, *%sl-trim ) is export {
    my $line-num = sbs-call-frame-line(1+$level-offset) + $line-offset;
    return sbs-code-line( $line-num, |%sl-trim );
}

sub sbs-prev-code-line(:$level-offset=0, *%sl-trim ) is export {
    sbs-rel-code-line(-1, level-offset => 1+$level-offset, |%sl-trim )
}

#| Return line of code as Str.
sub sbs-next-code-line(:$level-offset=0, *%sl-trim ) is export {
    sbs-rel-code-line(1, level-offset => 1+$level-offset, |%sl-trim )
}

sub sbs-next-code-line-and-call-line( :$level-offset=0, *%sl-trim ) is export {
    return
        sbs-next-code-line(
            level-offset => $level-offset + 1,
            |%sl-trim
        ),
        sbs-call-line(
            level-offset => $level-offset + 1,
            |%sl-trim
        )
    ;
}

sub sbs-next-line-and-comment-prefix( *%sl-trim ) is export {
    sbs-next-code-line(level-offset => 1, |%sl-trim) ~ " # ";
}

sub sbs-line-before-call( :$level-offset=0, *%sl-trim ) is export {
    sbs-prev-code-line( level-offset => 2+$level-offset, |%sl-trim );
}

sub sbs-line-after-call( :$level-offset=0, *%sl-trim ) is export {
    sbs-next-code-line( level-offset => 2+$level-offset, |%sl-trim );
}

sub sbs-code-lines($lines-from, $lines-num, :$level-offset=0, *%sl-trim) is export {
    my @lines;
    for $lines-from..($lines-from+$lines-num-1) -> $line-num {
        push @lines,  sbs-code-line(
            $line-num,
            |%sl-trim
        );
    }
    return @lines;
}

sub sbs-rel-code-lines($line-offset, $lines-num, :$level-offset=0, *%sl-trim) is export {
    my $call-frame-line = sbs-call-frame-line(1 + $level-offset);
    $call-frame-line++ if $line-offset < 0;
    return sbs-code-lines(
        $call-frame-line + $line-offset,
        $lines-num,
        level-offset => $level-offset + 1,
        |%sl-trim
    );
}

sub sbs-prev-code-lines( $lines-num=2, :$level-offset=0, *%sl-trim ) is export {
    sbs-rel-code-lines(
        -($lines-num + 1),
        $lines-num,
        level-offset => $level-offset + 1,
        |%sl-trim
    );
}

sub sbs-next-code-lines( $lines-num=2, :$level-offset=0, *%sl-trim ) is export {
    sbs-rel-code-lines(
        1,
        $lines-num,
        level-offset => $level-offset + 1,
        |%sl-trim
    );
}

sub sbs-next-code-lines-and-call-line( $lines-num=2, :$level-offset=0, *%sl-trim ) is export {
    return
        |sbs-next-code-lines(
            $lines-num,
            level-offset => $level-offset + 1,
            |%sl-trim
        ),
        sbs-call-line(
            level-offset => $level-offset + 1,
            |%sl-trim
        )
    ;
}

sub sbs-lines-before-call( $lines-num=2, :$level-offset=0, *%sl-trim ) is export {
    sbs-rel-code-lines(
        -($lines-num + 1),
        $lines-num,
        level-offset => $level-offset + 2,
        |%sl-trim
    );
}

sub sbs-call-line( :$level-offset=0, *%sl-trim ) is export {
    sbs-rel-code-line(
        level-offset => $level-offset + 2,
        |%sl-trim
    );
}

sub sbs-lines-after-call( $lines-num=2, :$level-offset=0, *%sl-trim ) is export {
    sbs-rel-code-lines(
        1,
        $lines-num,
        level-offset => $level-offset + 2,
        |%sl-trim
    );
}

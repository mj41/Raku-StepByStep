unit module StepByStep;

our @file-src-code-lines is export;
our $default-shift-left is export = 0;

sub code-line(
    $line-num,
    :$shift-left=$default-shift-left,
    :$trim=True
) is export {
    my $line = @file-src-code-lines[ $line-num - 1 ];
    return $line.substr($shift-left) if $shift-left;
    return $line.trim if $trim and !$shift-left;
    return $line;
}

sub call-frame-line($level-offset) {
    callframe(1 + $level-offset).line;
}

sub rel-code-line($line-offset=0, :$level-offset=0, *%sl-trim ) is export {
    my $line-num = call-frame-line(1+$level-offset) + $line-offset;
    return code-line( $line-num, |%sl-trim );
}

sub prev-code-line(:$level-offset=0, *%sl-trim ) is export {
    rel-code-line(-1, level-offset => 1+$level-offset, |%sl-trim )
}

sub next-code-line(:$level-offset=0, *%sl-trim ) is export {
    rel-code-line(1, level-offset => 1+$level-offset, |%sl-trim )
}

sub next-line-and-comment-prefix is export {
    next-code-line(level-offset => 1, :trim) ~ " # ";
}

sub line-before-call( *%sl-trim ) is export {
    prev-code-line( level-offset => 2, |%sl-trim );
}

sub line-after-call( *%sl-trim ) is export {
    next-code-line( level-offset => 2, |%sl-trim );
}

sub code-lines($lines-from, $lines-num, :$level-offset=0, *%sl-trim) is export {
    my @lines;
    for $lines-from..($lines-from+$lines-num-1) -> $line-num {
        push @lines,  code-line(
            $line-num,
            |%sl-trim
        );
    }
    return @lines;
}

sub rel-code-lines($line-offset, $lines-num, :$level-offset=0, *%sl-trim) is export {
    my $call-frame-line = call-frame-line(1 + $level-offset);
    $call-frame-line++ if $line-offset < 0;
    return code-lines(
        $call-frame-line + $line-offset,
        $lines-num,
        level-offset => $level-offset + 1,
        |%sl-trim
    );
}

sub prev-code-lines( $lines-num=2, *%sl-trim ) is export {
    rel-code-lines(
        -($lines-num + 1),
        $lines-num,
        level-offset => 1,
        |%sl-trim
    );
}

sub next-code-lines( $lines-num=2, *%sl-trim ) is export {
    rel-code-lines(
        1,
        $lines-num,
        level-offset => 1,
        |%sl-trim
    );
}

sub lines-before-call( $lines-num=2, *%sl-trim ) is export {
    rel-code-lines(
        -($lines-num + 1),
        $lines-num,
        level-offset => 2,
        |%sl-trim
    );
}

sub lines-after-call( $lines-num=2, *%sl-trim ) is export {
    rel-code-lines(
        1,
        $lines-num,
        level-offset => 2,
        |%sl-trim
    );
}

unit module StepByStep;

our @file-src-code-lines is export;
sub code-line($line-num, :$trim=True) is export {
    my $line = @file-src-code-lines[ $line-num - 1 ];
    return $line.trim if $trim;
    return $line;
}

sub call-frame-line($level-offset) {
    callframe(1 + $level-offset).line;
}

sub rel-code-line($line-offset=0, :$level-offset=0, :$trim=True ) is export {
    my $line-num = call-frame-line(1+$level-offset) + $line-offset;
    return code-line( $line-num, :$trim );
}

sub prev-code-line(:$level-offset=0, :$trim=True ) is export {
    rel-code-line(-1, level-offset => 1+$level-offset, :$trim )
}

sub next-code-line(:$level-offset=0, :$trim=True ) is export {
    rel-code-line(1, level-offset => 1+$level-offset, :$trim )
}

sub next-line-and-comment-prefix is export {
    next-code-line(level-offset => 1, :trim) ~ " # ";
}

sub line-before-call( :$trim=True ) is export {
    prev-code-line( level-offset => 2, :$trim );
}

sub line-after-call( :$trim=True ) is export {
    next-code-line( level-offset => 2, :$trim );
}

sub code-lines($lines-from, $lines-num, :$level-offset=0, :$trim=True) is export {
    my @lines;
    for $lines-from..($lines-from+$lines-num-1) -> $line-num {
        push @lines,  code-line(
            $line-num,
            :$trim
        );
    }
    return @lines;
}

sub rel-code-lines($line-offset, $lines-num, :$level-offset=0, :$trim=True) is export {
    my $call-frame-line = call-frame-line(1 + $level-offset);
    $call-frame-line++ if $line-offset < 0;
    return code-lines(
        $call-frame-line + $line-offset,
        $lines-num,
        level-offset => $level-offset + 1,
        :$trim
    );
}

sub prev-code-lines( $lines-num=2, :$trim=True ) is export {
    rel-code-lines(
        -($lines-num + 1),
        $lines-num,
        level-offset => 1,
        :$trim
    );
}

sub next-code-lines( $lines-num=2, :$trim=True ) is export {
    rel-code-lines(
        1,
        $lines-num,
        level-offset => 1,
        :$trim
    );
}

sub lines-before-call( $lines-num=2, :$trim=True ) is export {
    rel-code-lines(
        -($lines-num + 1),
        $lines-num,
        level-offset => 2,
        :$trim
    );
}

sub lines-after-call( $lines-num=2, :$trim=True ) is export {
    rel-code-lines(
        1,
        $lines-num,
        level-offset => 2,
        :$trim
    );
}

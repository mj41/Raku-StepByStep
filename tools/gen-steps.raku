#!/usr/bin/env perl6

sub get_out($cmd) {
    my $proc = run $cmd.split(" "), :out, :merge;
    my $captured-output = $proc.out.slurp: :close;
    my $exit-code       = $proc.exitcode;
    fail "cmd '$cmd'\nexit-code {$exit-code}: $captured-output"
        if $exit-code;
    return $captured-output;
}

for <<
    capture-base
    capture-array
    array-hash-pair
    pair-argument
    context-simple
>> -> $in-base {
    my $in-rel-path = "src/{$in-base}.raku";
    my $out-rel-path = "steps/{$in-base}.raku";
    say "Generation '{$in-rel-path}' -> '$out-rel-path'";
    my $cmd = "raku -Ilib {$in-rel-path}";
    my $out = get_out($cmd);
    $out-rel-path.IO.spurt($out);
    CATCH { say $_.perl }
}

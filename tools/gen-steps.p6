#!/usr/bin/env perl6

sub get_out($cmd) {
    my $proc = run $cmd.split(" "), :out, :merge;
    my $captured-output = $proc.out.slurp: :close;
    my $exit-code       = $proc.exitcode;
    fail "cmd '$cmd'\nexit-code {$exit-code}: $captured-output"
        if $exit-code;
    return $captured-output;
}


for 'array-hash-pair' -> $file-base {
    my $file-rel-path = "src/{$file-base}.p6";
    my $cmd = "perl6 -Ilib {$file-rel-path}";
    my $out = get_out($cmd);

    my $out-rel-path = "steps/{$file-base}.p6";
    $out-rel-path.IO.spurt($out);

    CATCH { say $_.perl }
}

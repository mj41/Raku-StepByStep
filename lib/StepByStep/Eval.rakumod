unit module StepByStep::Eval;

sub sbs-eval( $eval-sub-body, $code-str ) is export {
    my $err;
    try {
        CONTROL { default { $err = $_ } }
        CATCH   { default { $err = $_ } }
        $eval-sub-body.( $code-str );
    }
    return $err;
}

multi sub sbs-eval-and-exception-as-comment( Block:D $eval-sub-body, Str:D $code-str ) is export {
    my $err-exc = sbs-eval( $eval-sub-body, $code-str );
    return "$code-str #" unless $err-exc;
    return "$code-str #" if $err-exc ~~ CX::Return;
    return "$code-str # ({$err-exc.^name}) {$err-exc.Str.lines.first}";

}

sub my-eval( $code ) {
    use MONKEY-SEE-NO-EVAL;
    EVAL $code;
}

multi sub sbs-eval-and-exception-as-comment( Str:D $code-str ) is export {
    sbs-eval-and-exception-as-comment( &my-eval, $code-str );
}

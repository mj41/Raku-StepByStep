unit module StepByStep::Eval;

sub sbs-eval( &eval-sub-body, $code-str ) is export {
    return &eval-sub-body.( $code-str );
    CATCH { return $_ }
}

sub sbs-eval-and-exception-as-comment( &eval-sub-body, $code-str ) is export {
    my $err-exc = sbs-eval( &eval-sub-body, $code-str );
    say "$code-str # ({$err-exc.^name}) {$err-exc.Str.lines.first}";
}

sub foo( $a ) {
    say $a; # 1
}
foo 1;


sub foo( $a ) {
    say $a; # text-arg-1
}
foo 'text-arg-1';


# Literal pairs don't work.
foo :arg1(2);  # (X::AdHoc) Too few positionals passed; expected 1 argument but got 0
foo arg1 => 2; # (X::AdHoc) Too few positionals passed; expected 1 argument but got 0


sub foo( $a ) {
    say $a; # arg1 => 2
}
foo 'arg1' => 2;


sub foo( $a ) {
    say $a; # arg1 => 2
}
foo (arg1 => 2);


sub foo( $a ) {
    say $a; # arg1 => 2
}
foo (:arg1(2));


# Hash works as expected.
sub foo( $a ) {
    say $a; # {arg1 => 2}
}
foo ( { arg1 => 2 } );

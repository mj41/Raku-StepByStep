sub foo( $a ) {
    say $a; # 1
}
foo 1;


sub foo( $a ) {
    say $a; # text-arg-1
}
foo 'text-arg-1';


foo :arg1(2);  # (X::AdHoc) Too many positionals passed; expected 0 arguments but got 1
foo arg1 => 2; # (X::AdHoc) Too many positionals passed; expected 0 arguments but got 1


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



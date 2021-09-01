sub foo( $a ) {
    say $a; # 1
    say $a.^name; # Int
}
foo 1;


sub foo( $a ) {
    say $a; # text-arg-1
    say $a.^name; # Str
}
foo 'text-arg-1';


# Literal pairs don't work.
foo :arg1(2);  # (X::AdHoc) Too few positionals passed; expected 1 argument but got 0
foo arg1 => 2; # (X::AdHoc) Too few positionals passed; expected 1 argument but got 0


sub foo( $a ) {
    say $a; # arg1 => 2
    say $a.^name; # Pair
}
foo 'arg1' => 2;


sub foo( $a ) {
    say $a; # arg1 => 2
    say $a.^name; # Pair
}
foo (arg1 => 2);


sub foo( $a ) {
    say $a; # arg1 => 2
    say $a.^name; # Pair
}
foo (:arg1(2));


# Hash works as expected #1.
sub foo( $a ) {
    say $a; # {arg1 => 2}
    say $a.^name; # Hash
}
foo { arg1 => 2 };


# Hash works as expected #2.
sub foo( $a ) {
    say $a; # {arg1 => 2}
    say $a.^name; # Hash
}
foo ( { arg1 => 2 } );


# Hash works as expected #3.
sub foo( $a ) {
    say $a; # {arg1 => 2}
    say $a.^name; # Hash
}
foo( { arg1 => 2 } );


# Hash works as expected #4.
sub foo( $a ) {
    say $a; # {arg1 => 2}
    say $a.^name; # Hash
}
foo( ({ arg1 => 2 }) );


# Hash works as expected #5.
sub foo( $a ) {
    say $a; # {arg1 => 2}
    say $a.^name; # Hash
}
foo( $({ arg1 => 2 }) );



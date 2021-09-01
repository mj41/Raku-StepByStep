# Capture with two positional and one named arguments.
my $x = Array.new(  1, b => 2, 3  );
say $x.perl; # $[1, 3]
say $x.^name; # Array


my $x = Array.new(  1, :b(2), 3  ); # The same
say $x.perl; # $[1, 3]
say $x.^name; # Array


# The solution: See another pair or parentheses.
# Capture with one positional argument (with Array as the value).
my $x = Array.new(  (1, b => 2, 3)  );
say $x.perl; # $[1, :b(2), 3]
say $x.^name; # Array


# Capture with two positionals and one quoted named argument.
my $x = Array.new(  1, 'b' => 2, 3  );
say $x.perl; # $[1, :b(2), 3]
say $x.^name; # Array


my $c = \( 1, 'b' => 2, 3 ); # A stand-alone Capture
my $x = Array.new( |$c );
say $x.perl; # $[1, :b(2), 3]
say $x.^name; # Array



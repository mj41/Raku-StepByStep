multi sub circumfix:<[ ]>( Hash $hash ) { say "# !!! my cicrumfix:<[ ]>( Hash )"; Array.new( $hash ) }
multi sub circumfix:<[ ]>( Pair $pair ) { say "# !!! my cicrumfix:<[ ]>( Pair )"; Array.new( $( $pair.Hash ) ) }

my $x = [ { b => 4 }, ]; # Note the comma
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

# !!! my cicrumfix:<[ ]>( Hash )
my $x = [ { b => 4 } ]; # !WARN! without comma Hash -> Pair
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

# !!! my cicrumfix:<[ ]>( Hash )
my $x = [ Hash.new('b',4) ]; # !WARN! again, we are even more explicit
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

my $x = [ Hash.new('b',4), ]; # With a comma
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

# !!! my cicrumfix:<[ ]>( Hash )
my $x = [ ('b',4).Hash ]; # !WARN! again, we are even more explicit
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

my $x = [ ('b',4).Hash, ]; # With a comma
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

# !!! my cicrumfix:<[ ]>( Hash )
my $x = [ ${ b => 4 } ]; # No comma - Put Hash inside Scalar container
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

# !!! my cicrumfix:<[ ]>( Hash )
my $x = [ $({ b => 4 }) ]; # No comma - Scalar container with brackets around
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

my $x = [ ${ b => 4 }, ]; # A comma will not make it worse
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

# !!! my cicrumfix:<[ ]>( Hash )
my $x = [ $(%( b => 4 )) ]; # No comma - another Hash syntax
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

# !!! my cicrumfix:<[ ]>( Pair )
my $x = [ b => 4 ]; # A Pair
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

# !!! my cicrumfix:<[ ]>( Pair )
my $x = [ $( b => 4 ) ]; # Still a Pair
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash

my $x = circumfix:<[ ]>( ({b=>4}, ) ); # Use operator directly
say $x.gist; # [{b => 4}]
say $x.perl; # $[{:b(4)},]
say $x[0]<b>; # 4
say $x.^name; # Array
say $x[0].^name; # Hash


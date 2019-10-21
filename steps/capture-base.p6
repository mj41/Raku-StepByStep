my Capture $cap = \( 1 );
say $cap.^name; # Capture
say $cap.list.perl; # (1,)
say $cap.hash.perl; # Map.new(())
say $cap.perl; # \(1)


my Capture $cap = \( a => 1 );
say $cap.^name; # Capture
say $cap.list.perl; # ()
say $cap.hash.perl; # Map.new((:a(1)))
say $cap.perl; # \(:a(1))


my Capture $cap = \( 1, a => 2, 3 );
say $cap.^name; # Capture
say $cap.list.perl; # (1, 3)
say $cap.hash.perl; # Map.new((:a(2)))
say $cap.perl; # \(1, 3, :a(2))


# Now see how Capture with quoted named argument works.
my Capture $cap = \( 1, 'a' => 2, 3 );
say $cap.^name; # Capture
say $cap.list.perl; # (1, :a(2), 3)
say $cap.hash.perl; # Map.new(())
say $cap.perl; # \(1, :a(2), 3)


# See again quoted named argument.
my $cap1 = \( 1, 'a' => 2, 3 );
say $cap.perl; # \(1, :a(2), 3)
my $cap2 = \( 1, a => 2, 3 );
say $cap.perl; # \(1, 3, :a(2))


# Not so easy here to find out what will .list and .hash return.
my $cap1 = \( 1, 2, 'a' => 3 );
say $cap.perl; # \(1, 2, :a(3))
my $cap2 = \( 1, 2, a => 3 );
say $cap.perl; # \(1, 2, :a(3))


# You must see the code or .list and .hash outputs.
my $cap1 = \( 1, 2, 'a' => 3 );
say $cap.^name; # Capture
say $cap.list.perl; # (1, 2, :a(3))
say $cap.hash.perl; # Map.new(())
say $cap.perl; # \(1, 2, :a(3))

my $cap2 = \( 1, 2, a => 3 );
say $cap.^name; # Capture
say $cap.list.perl; # (1, 2)
say $cap.hash.perl; # Map.new((:a(3)))
say $cap.perl; # \(1, 2, :a(3))



my $x = ~10; # String context
say $x.^name; # Str
say $x.perl; # "10"


my $x = +" 10 "; # Number context
say $x.^name; # Int
say $x.perl; # 10


my $x = ?1; # Boolean context
say $x.^name; # Bool
say $x.perl; # Bool::True


my $x = +True; # Number context
say $x.^name; # Int
say $x.perl; # 1


my $x = ~True; # String context
say $x.^name; # Str
say $x.perl; # "True"


my $x = ?"True"; # Boolean context
say $x.^name; # Bool
say $x.perl; # Bool::True


my $x = 10; # Item (scalar) context
say $x.^name; # Int
say $x.perl; # 10


# Comma forces List context
# Scalar assignment forces Item context
my $x = ( 10, 20 );
say $x.^name; # List
say $x.perl; # $(10, 20)


# List without parenthesis.
my $x = 10, 20; # Item context but List provided
# WARNINGS: Useless use of constant integer 20 in sink context



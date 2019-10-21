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



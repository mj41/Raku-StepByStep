Array
~/devel/lords/d6p [master ↓·1↑·12|✚ 8…3]$ p6 -e'my @a = 10; say @a.^name'
Array
~/devel/lords/d6p [master ↓·1↑·12|✚ 8…3]$ p6 -e'my @a = 10; say @a.VAR.^name'
Array
~/devel/lords/d6p [master ↓·1↑·12|✚ 8…3]$ p6 -e'my $a = (10,20); say $a.VAR.^name'
Scalar
~/devel/lords/d6p [master ↓·1↑·12|✚ 8…3]$ p6 -e'my $a = [10,20]; say $a.VAR.^name'
Scalar
~/devel/lords/d6p [master ↓·1↑·12|✚ 8…3]$ p6 -e'my $a = [10,20]; say $a.^name'
Array
p6 -e'my $a := 10; my $b := $a; say $b.VAR.^name'

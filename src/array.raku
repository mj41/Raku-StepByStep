#use Raku::StepByStep::Code;
#@sbs-file-src-code-lines = $?FILE.IO.slurp.lines;

my Array $ar = [ 10, 20, 30 ];
$ar.perl.say;
$ar[0].perl.say;
$ar[0].^WHY.perl.say;

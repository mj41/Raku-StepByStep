unit module StepByStep;

our @file_src_code_lines is export;
sub src_code_line($level,$offset) is export {
    @file_src_code_lines[ callframe($level).line - 1 + $offset ];
}

sub line-before-call is export {
    src_code_line(3,-1).trim;
}

sub next-line-and-comment-prefix is export {
    src_code_line(2,+1).trim ~ " # ";
}

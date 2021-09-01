{
    multi foo(    $x) { say "Any argument" }
    multi foo(Int $x) { nextsame }

    foo(42) # Int argument
}

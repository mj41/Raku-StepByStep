

class A {
    method foo($i) {
        say "A.foo($i)";
    }

}

class B is A {
}

class C is B {
    method foo($i) {
        say "C:foo($i)";
    }
    method bar(|c) {
        say "C.bar({c.perl})";
        self.B::foo(|c);

        my &me := self.^find_method_qualified(C.^mro.[1],'foo');
        self.&me(|c);
    }
}

C.bar(10);
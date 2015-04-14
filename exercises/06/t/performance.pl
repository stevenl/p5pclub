use strict;
use warnings;
use Benchmark 'cmpthese';
use ExtUtils::testlib;
use ListUtil ':all';
use ListUtil::PP ':all';

cmpthese( 50_000, {
    pp_recursive => sub { sum_args_recursive( 1 .. 100 ) },
    pp_iterative => sub { sum_args_iterative( 1 .. 100 ) },
    xs           => sub { sum_args( 1 .. 100 ) },
} );

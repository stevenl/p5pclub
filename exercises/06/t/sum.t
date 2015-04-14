#!perl

use strict;
use warnings;
use ExtUtils::testlib;
use Test::More;

use_ok('ListUtil::PP', ':all');
use_ok('ListUtil', ':all');

my $subtest = 'A';
#for ( \&sum_args_pp, \&sum_args ) {
for ( \&sum_args_iterative, \&sum_args_recursive, \&sum_args ) {
    subtest $subtest => sub {
        is( $_->(), 0 );
        is( $_->( 1, 2, 'hello', 3 ), 6 );
        is( $_->( \(1), 2, 'hello', 3 ), 6 );
        is( $_->( 1, 2, '3x' ), 3 );
        is( $_->( 1, 2, [3, 4, [10, 11], 5] ), 36 );
        is( $_->( 1, { nl => [4, 5], uk => [8] } ), 18 );
    };
    $subtest++;
}

done_testing;

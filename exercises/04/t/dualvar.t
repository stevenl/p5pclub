#!perl

use strict;
use warnings;
use Test::More;
use Test::Fatal;

use_ok( 'ScalarUtil', ':all' );

my @tests = (
    [42, 'The meaning of life', 'int'],
    [-42, 'The meaning of life', 'signed int'],
    [42.1, 'The meaning of life', 'double'],
);

foreach (@tests) {
    my $x = dualvar( $_->[0], $_->[1] );
    # Dump $x;
    is( 0+$x, $_->[0], $_->[2] );
    is( $x, $_->[1], $_->[2] );
}

like(
    exception { dualvar( 'invalid', 'valid' ) },
    qr/^parameter #0 must be numeric/
);

done_testing;

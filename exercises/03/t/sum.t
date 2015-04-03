#!perl

use strict;
use warnings;
use Test::More;

use_ok( 'ListUtil', ':all' );

is( sum_arrayref([]), 0 );
is( sum_arrayref([ 1, 2, 3, 4, 5, 6, 7, 8 ]), 36 );
is( sum_arrayref([ 1, -2, 3, -4, 5, -6, 7, -8 ]), -4 );

is( sum_array(), 0 );
is( sum_array( 1, 2, 3, 4, 5, 6, 7, 8 ), 36 );
is( sum_array( 1, -2, 3, -4, 5, -6, 7, -8 ), -4 );

done_testing;

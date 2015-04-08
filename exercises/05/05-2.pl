use strict;
use warnings;
use Devel::Peek;

my $ar = [];
$ar->[0] = \( $ar->[1] );
$ar->[1] = \( $ar->[0] );
$ar->[2] = $ar->[0];

# set elt 0 to 'x'; elements 1 and 2 remain the same
# ${ ${ $ar->[0] } } = "x";

Dump $ar;

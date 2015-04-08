use strict;
use warnings;
use Devel::Peek;

my ($x, $y);
$x = \$y;
$y = \$x;
my $ar = [$x, $y, $x];

# change to 'x' the scalar referenced by $y
# ${ ${ $ar->[0] } } = "x";

Dump $ar;

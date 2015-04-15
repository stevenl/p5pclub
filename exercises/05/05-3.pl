use strict;
use warnings;
use Devel::Peek;

my ($x, $y);
$x = \$y;
$y = \$x;

# Subroutine arguments are passed by alias.
# see http://stackoverflow.com/questions/4091358/how-does-work-in-perl-subroutines
my $ar = sub { \@_ }->( $x, $y, $x );

# set elts 0 & 2 to 'x'
# ${ ${ $ar->[0] } } = "x";

Dump $ar;

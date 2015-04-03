use strict;
use warnings;
use Devel::Peek;

my $int = 1;
my $intref = \$int;
Dump [ \$intref, $intref ];

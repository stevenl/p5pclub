use strict;
use warnings;
use Devel::Peek;

format STDOUT =
.

# see Typeglobs (http://chimera.labs.oreilly.com/books/1234000001527/ch08.html)
Dump bless *STDOUT{FORMAT}, 'Foo';

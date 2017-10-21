#!perl

use strict;
use warnings;

use Capture::Tiny 'capture_stdout';
use ExtUtils::testlib;
use Test::More;

use_ok( 'Magic', qw( magify_pp magify_xs ) );

{
    my $x = 0;
    magify_xs($x);
    $x = 1;
}

my $subtest = 'A';
for ( \&magify_pp, \&magify_xs ) {
    subtest $subtest => sub {
        is(
            capture_stdout {
                my $x = 0;
                $_->($x);
                #magify_pp($x);
                is( capture_stdout { $x = 1 }, "set => 1\n", 'set' );
            },
            "destroy\n", 'free'
        );
    };
    $subtest++;
}


done_testing;

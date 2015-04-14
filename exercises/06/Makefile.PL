use 5.008005;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'ListUtil',
    ABSTRACT_FROM => 'lib/ListUtil.pm',
    VERSION_FROM  => 'lib/ListUtil.pm',
    AUTHOR        => 'Steven Lee',
    PREREQ_PM     => { 'Test::More' => 0, 'Exporter' => '5.57' },
    LIBS          => [''],
    DEFINE        => '',
    INC           => '-I',
    OBJECT        => '$(O_FILES)',
);

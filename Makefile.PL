use inc::Module::Install;

name     'Image-OpenCV';
all_from 'lib/Image/OpenCV.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

cc_inc_paths '.';
can_cc or die 'This module requires a C compiler';

requires_external_bin 'pkg-config';

build_requires 'Test::More';
auto_include;
WriteAll;

sub MY::post_constants {
    return qq(
CCFLAGS += @{[`pkg-config --cflags opencv`]}
LDDLFLAGS += @{[`pkg-config --libs opencv`]}
);
}

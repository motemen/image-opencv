use strict;
use Test::More tests => 4;
use Image::OpenCV;

my $cascade_file = [
    grep -f, qw(
        /usr/share/opencv/haarcascades/haarcascade_frontalface_alt2.xml
        /usr/local/share/opencv/haarcascades/haarcascade_frontalface_alt2.xml
    ), $ENV{OPENCV_CASCADE_FILE} || ''
]->[0] or BAIL_OUT 'No cascade file found';

ok my $image   = Image::OpenCV::LoadImage('t/files/Lenna.png');
ok my $cascade = Image::OpenCV::Load($cascade_file);
ok my $storage = Image::OpenCV::CreateMemStorage();
Image::OpenCV::ClearMemStorage($storage);

my $result = Image::OpenCV::HaarDetectObjects($image, $cascade, $storage);

isa_ok $result, 'ARRAY';
note explain $result;

Image::OpenCV::ReleaseImage($image);
Image::OpenCV::ReleaseMemStorage($storage);

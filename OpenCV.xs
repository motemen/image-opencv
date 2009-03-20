#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#ifdef __cplusplus
}
#endif
#include "cv.h"
#include "highgui.h"

typedef SV * Image_OpenCV;

MODULE = Image::OpenCV		PACKAGE = Image::OpenCV		PREFIX = cv

IplImage * cvLoadImage(const char * filename, int flags = CV_LOAD_IMAGE_COLOR);

void * cvLoad(const char * filename, CvMemStorage * memstorage = NULL, const char * name = NULL, const char ** real_name = NULL);

AV * cvHaarDetectObjects(const CvArr * image, CvHaarClassifierCascade * cascade, CvMemStorage * storage, double scale_factor = 1.1, int min_neighbors = 3, int flags = 0, CvSize min_size = cvSize(0, 0));
    CODE:
        CvSeq * result = cvHaarDetectObjects(image, cascade, storage, scale_factor, min_neighbors, flags, min_size);
        int i;
        RETVAL = newAV();
        for (i = 0; i < (result ? result->total : 0); i++) {
            CvRect * r = (CvRect *)cvGetSeqElem(result, i);
            HV * h = newHV();
            hv_store(h, "x",      1, newSViv(r->x), 0);
            hv_store(h, "y",      1, newSViv(r->y), 0);
            hv_store(h, "width",  5, newSViv(r->width), 0);
            hv_store(h, "height", 6, newSViv(r->height), 0);
            av_push(RETVAL, newRV_noinc((SV *)h));
        }
    OUTPUT:
        RETVAL

CvMemStorage * cvCreateMemStorage(int block_size = 0);

void cvClearMemStorage(CvMemStorage * storage);

void cvReleaseImage(IplImage * image);
    CODE:
        cvReleaseImage(&image);

void cvReleaseMemStorage(CvMemStorage * storage);
    CODE:
        cvReleaseMemStorage(&storage);

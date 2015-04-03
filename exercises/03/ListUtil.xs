#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

MODULE = ListUtil       PACKAGE = ListUtil

PROTOTYPES: DISABLE

double
sum_arrayref(numbers)
        AV* numbers
    INIT:
        int i;
        int last_idx = av_len(numbers);
    CODE:
        RETVAL = 0;
        for (i = 0; i <= last_idx; i++) {
            SV** num = av_fetch(numbers, i, 0);
            if (num != NULL) {
                if (SvIOK(*num))
                    RETVAL += SvIV(*num);
                else if (SvNOK(*num))
                    RETVAL += SvNV(*num);
                else
                    croak("List must contain numbers only");
            }
        }
    OUTPUT:
        RETVAL

double
sum_array(...)
    PREINIT:
        int i;
    CODE:
        RETVAL = 0;
        for (i = 0; i < items; i++) {
            SV *n = ST(i);
            RETVAL += SvIV(n);
        }
    OUTPUT:
        RETVAL


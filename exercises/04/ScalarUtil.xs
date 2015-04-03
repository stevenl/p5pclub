#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

MODULE = ScalarUtil     PACKAGE = ScalarUtil

PROTOTYPES: DISABLE

SV*
dualvar(num, str)
        SV   *num
        char *str
    CODE:
        RETVAL = newSV(0);
        sv_setpv(RETVAL, str);
        if (SvIOK(num)) {
            int n = SvIV(num);
            sv_setiv(RETVAL, n);
            SvIOK_on(RETVAL);
        }
        else if (SvNOK(num)) {
            double n = SvNV(num);
            sv_setnv(RETVAL, n);
            SvNOK_on(RETVAL);
        }
        else {
            croak("parameter #0 must be numeric");
        }
        SvPOK_on(RETVAL);
    OUTPUT:
        RETVAL


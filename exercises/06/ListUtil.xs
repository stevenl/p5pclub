#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

MODULE = ListUtil       PACKAGE = ListUtil

PROTOTYPES: DISABLE

int sum_args(...)
    CODE:
    {
        AV* stack = newAV();
        int i;
        for (i = 0; i < items; i++) {
            av_push(stack, ST(i));
        }

        RETVAL = 0;
        while (av_len(stack) >= 0) {
            SV* sv = av_pop(stack);

            if (SvROK(sv)) {
                /* array ref */
                if ( SvTYPE(SvRV(sv)) == SVt_PVAV ) {
                    AV* array = (AV*) SvRV(sv);
                    int i;
                    for (i = 0; i <= av_len(array); i++) {
                        av_push(stack, *av_fetch(array, i, 0));
                    }
                }
                /* hash ref */
                else if ( SvTYPE(SvRV(sv)) == SVt_PVHV ) {
                    HV* hash = (HV*) SvRV(sv);
                    hv_iterinit(hash);
                    HE* he;
                    for (he = hv_iternext(hash); he; he = hv_iternext(hash)) {
                        av_push(stack, HeVAL(he));
                    }
                }
                /* scalar ref */
                else if ( SvTYPE(SvRV(sv)) < SVt_PVAV ) {
                    av_push(stack, (SV*) SvRV(sv));
                }
            }
            else if ( SvIOK(sv) ) {
                RETVAL += (int) SvIV(sv);
            }
            else if ( SvNOK(sv) ) {
                RETVAL += (double) SvNV(sv);
            }
        }
    }
    OUTPUT:
        RETVAL


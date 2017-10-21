#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

I32
set_alert(pTHX_ IV index, SV *sv) {
    printf("set => x\n");
    return 0;
}

I32
free_alert(pTHX_ IV index, SV *sv) {
    printf("destroy\n");
    return 0;
}

MODULE = Magic          PACKAGE = Magic

PROTOTYPES: DISABLE

void
magify_xs(sv)
    SV* sv;
PREINIT:
    struct ufuncs uf;
CODE:
    uf.uf_set   = &set_alert;
    uf.uf_val   = &free_alert;
    uf.uf_index = 0;
    sv_magic(sv, 0, PERL_MAGIC_uvar, (char*)&uf, sizeof(uf));


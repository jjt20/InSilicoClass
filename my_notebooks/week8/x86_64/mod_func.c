#include <stdio.h>
#include "hocdec.h"
extern int nrnmpi_myid;
extern int nrn_nobanner_;

extern void _SimpleAMPA_NMDA_reg(void);
extern void _TsodyksMarkram_AMPA_NMDA_reg(void);
extern void _vecevent_reg(void);

void modl_reg(){
  if (!nrn_nobanner_) if (nrnmpi_myid < 1) {
    fprintf(stderr, "Additional mechanisms from files\n");

    fprintf(stderr," SimpleAMPA_NMDA.mod");
    fprintf(stderr," TsodyksMarkram_AMPA_NMDA.mod");
    fprintf(stderr," vecevent.mod");
    fprintf(stderr, "\n");
  }
  _SimpleAMPA_NMDA_reg();
  _TsodyksMarkram_AMPA_NMDA_reg();
  _vecevent_reg();
}

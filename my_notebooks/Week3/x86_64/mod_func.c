#include <stdio.h>
#include "hocdec.h"
extern int nrnmpi_myid;
extern int nrn_nobanner_;

extern void _K_Channel_reg(void);
extern void _K_Channel_change_Tau_reg(void);
extern void _K_Channel_change_mInf_reg(void);
extern void _Na_Channel_reg(void);

void modl_reg(){
  if (!nrn_nobanner_) if (nrnmpi_myid < 1) {
    fprintf(stderr, "Additional mechanisms from files\n");

    fprintf(stderr," K_Channel.mod");
    fprintf(stderr," K_Channel_change_Tau.mod");
    fprintf(stderr," K_Channel_change_mInf.mod");
    fprintf(stderr," Na_Channel.mod");
    fprintf(stderr, "\n");
  }
  _K_Channel_reg();
  _K_Channel_change_Tau_reg();
  _K_Channel_change_mInf_reg();
  _Na_Channel_reg();
}

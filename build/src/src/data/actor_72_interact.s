.module actor_72_interact

.include "vm.i"
.include "data/game_globals.i"

.area _CODE_255

.LOCAL_TMP0_PARAM0_VALUE = -1

___bank_actor_72_interact = 255
.globl ___bank_actor_72_interact

_actor_72_interact::
        VM_RESERVE              1

        ; If Parameter 0 Equals 2
        VM_GET_TLOCAL           .LOCAL_TMP0_PARAM0_VALUE, 0
        VM_IF_CONST             .EQ, .LOCAL_TMP0_PARAM0_VALUE, 2, 1$, 0
        VM_JUMP                 2$
1$:
        ; Variable L1 = VAR_S5A5_HEALTH_5-1
        VM_RPN
            .R_REF      VAR_S5A5_HEALTH_5
            .R_INT16    1
            .R_OPERATOR .SUB
            .R_REF_SET  VAR_S5A5_HEALTH_5
            .R_STOP

        ; Stop Script
        VM_STOP
2$:

        ; Stop Script
        VM_STOP

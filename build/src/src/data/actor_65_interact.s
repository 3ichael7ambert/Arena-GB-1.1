.module actor_65_interact

.include "vm.i"
.include "data/game_globals.i"

.area _CODE_255

.LOCAL_TMP0_PARAM0_VALUE = -1

___bank_actor_65_interact = 255
.globl ___bank_actor_65_interact

_actor_65_interact::
        VM_RESERVE              1

        ; If Parameter 0 Equals 2
        VM_GET_TLOCAL           .LOCAL_TMP0_PARAM0_VALUE, 0
        VM_IF_CONST             .EQ, .LOCAL_TMP0_PARAM0_VALUE, 2, 1$, 0
        VM_JUMP                 2$
1$:
        ; Variable L1 = VAR_S7A7_HEALTH_4-1
        VM_RPN
            .R_REF      VAR_S7A7_HEALTH_4
            .R_INT16    1
            .R_OPERATOR .SUB
            .R_REF_SET  VAR_S7A7_HEALTH_4
            .R_STOP

        ; Stop Script
        VM_STOP
2$:

        ; Stop Script
        VM_STOP

.module actor_104_interact

.include "vm.i"
.include "data/game_globals.i"

.area _CODE_255

.LOCAL_TMP0_PARAM0_VALUE = -1

___bank_actor_104_interact = 255
.globl ___bank_actor_104_interact

_actor_104_interact::
        VM_RESERVE              1

        ; If Parameter 0 Equals 2
        VM_GET_TLOCAL           .LOCAL_TMP0_PARAM0_VALUE, 0
        VM_IF_CONST             .EQ, .LOCAL_TMP0_PARAM0_VALUE, 2, 1$, 0
        VM_JUMP                 2$
1$:
        ; Variable L1 = VAR_S4A4_HEALTH_8-1
        VM_RPN
            .R_REF      VAR_S4A4_HEALTH_8
            .R_INT16    1
            .R_OPERATOR .SUB
            .R_STOP
        VM_SET                  VAR_S4A4_HEALTH_8, .ARG0
        VM_POP                  1

        ; Stop Script
        VM_STOP
2$:

        ; Stop Script
        VM_STOP

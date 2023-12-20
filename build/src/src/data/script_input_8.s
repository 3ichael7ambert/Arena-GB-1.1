.module script_input_8

.include "vm.i"
.include "data/game_globals.i"

.area _CODE_255

.LOCAL_ACTOR = -4

___bank_script_input_8 = 255
.globl ___bank_script_input_8

_script_input_8::
        VM_RESERVE              4

        ; If Variable True
        VM_IF_CONST             .GT, VAR_COOLDOWN, 0, 1$, 0
        VM_JUMP                 2$
1$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 0

        ; Launch Projectile In Actor Direction
        VM_ACTOR_GET_POS        .LOCAL_ACTOR
        VM_ACTOR_GET_POS        .LOCAL_ACTOR
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 1)/
            .R_REF      ^/(.LOCAL_ACTOR + 2)/
            .R_INT16    0
            .R_INT16    0
            .R_STOP
        VM_SET_CONST            .ARG1, 0
        VM_ACTOR_GET_ANGLE      .ARG1, .ARG1
        VM_PROJECTILE_LAUNCH    0, .ARG3
        VM_POP                  4

        ; Variable Set To False
        VM_SET_CONST            VAR_COOLDOWN, 0

2$:

        ; Stop Script
        VM_STOP

.module actor_68_update

.include "vm.i"
.include "data/game_globals.i"

.globl b_wait_frames, _wait_frames

.area _CODE_255

.LOCAL_ACTOR = -4
.LOCAL_TMP1_OTHER_ACTOR = -7
.LOCAL_TMP3_LOCAL = -7
.LOCAL_TMP5_LOCAL = -7
.LOCAL_TMP7_LOCAL = -7
.LOCAL_TMP9_LOCAL = -7
.LOCAL_TMP11_WAIT_ARGS = -7
.LOCAL_TMP12_IF_VALUE = -7
.LOCAL_TMP2_DISTANCE = -8
.LOCAL_TMP4_LOCAL = -8
.LOCAL_TMP6_LOCAL = -8
.LOCAL_TMP8_LOCAL = -8
.LOCAL_TMP10_LOCAL = -8

___bank_actor_68_update = 255
.globl ___bank_actor_68_update

_actor_68_update::
        VM_RESERVE              8

1$:
        ; If Actor Distance from Actor
        ; -- Calculate value
        VM_RPN
            .R_INT16    5
            .R_REF_SET  .LOCAL_TMP2_DISTANCE
            .R_STOP
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_GET_POS        .LOCAL_ACTOR
        VM_SET_CONST            .LOCAL_TMP1_OTHER_ACTOR, 0
        VM_ACTOR_GET_POS        .LOCAL_TMP1_OTHER_ACTOR
        VM_RPN
            .R_REF      ^/(.LOCAL_TMP1_OTHER_ACTOR + 1)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF      ^/(.LOCAL_ACTOR + 1)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_OPERATOR .SUB
            .R_REF      ^/(.LOCAL_TMP1_OTHER_ACTOR + 1)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF      ^/(.LOCAL_ACTOR + 1)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_OPERATOR .SUB
            .R_OPERATOR .MUL
            .R_REF      ^/(.LOCAL_TMP1_OTHER_ACTOR + 2)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF      ^/(.LOCAL_ACTOR + 2)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_OPERATOR .SUB
            .R_REF      ^/(.LOCAL_TMP1_OTHER_ACTOR + 2)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF      ^/(.LOCAL_ACTOR + 2)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_OPERATOR .SUB
            .R_OPERATOR .MUL
            .R_OPERATOR .ADD
            .R_REF      .LOCAL_TMP2_DISTANCE
            .R_REF      .LOCAL_TMP2_DISTANCE
            .R_OPERATOR .MUL
            .R_OPERATOR .LTE
            .R_STOP
        VM_IF_CONST             .EQ, .ARG0, 0, 2$, 1

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 6

        ; Launch Projectile In Source Actor Direction
        VM_ACTOR_GET_POS        .LOCAL_ACTOR
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 1)/
            .R_REF      ^/(.LOCAL_ACTOR + 2)/
            .R_INT16    0
            .R_INT16    0
            .R_STOP
        VM_ACTOR_GET_ANGLE      ^/(.LOCAL_ACTOR - 4)/, .ARG1
        VM_PROJECTILE_LAUNCH    1, .ARG3
        VM_POP                  4

        VM_JUMP                 3$
2$:
3$:

        ; Switch Variable
        VM_SWITCH               VAR_S10A5_DIRECTION, 4, 0
        .dw 1, 4$
        .dw 2, 5$
        .dw 3, 6$
        .dw 4, 7$

        VM_JUMP                 8$
        ; case 1:
4$:
        ; Actor Move Relative
        ; -- Fetch $self$ pxpos
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_GET_POS        .LOCAL_ACTOR
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 1)/
            .R_INT16    16
            .R_OPERATOR .DIV
            .R_REF_SET  .LOCAL_TMP3_LOCAL
            .R_STOP
        ; -- Fetch $self$ pypos
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 2)/
            .R_INT16    16
            .R_OPERATOR .DIV
            .R_REF_SET  .LOCAL_TMP4_LOCAL
            .R_STOP
        ; -- Calculate coordinate values
        VM_RPN
            .R_REF      .LOCAL_TMP3_LOCAL
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_INT16    16
            .R_OPERATOR .MUL
            .R_REF_SET  ^/(.LOCAL_ACTOR + 1)/
            .R_REF      .LOCAL_TMP4_LOCAL
            .R_INT16    0
            .R_OPERATOR .ADD
            .R_INT16    16
            .R_OPERATOR .MUL
            .R_REF_SET  ^/(.LOCAL_ACTOR + 2)/
            .R_STOP
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 3)/, ^/(.ACTOR_ATTR_CHECK_COLL | .ACTOR_ATTR_H_FIRST)/
        ; -- Move Actor
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_MOVE_TO        .LOCAL_ACTOR

        VM_JUMP                 8$
        ; case 2:
5$:
        ; Actor Move Relative
        ; -- Fetch $self$ xpos
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_GET_POS        .LOCAL_ACTOR
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 1)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF_SET  .LOCAL_TMP5_LOCAL
            .R_STOP
        ; -- Fetch $self$ ypos
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 2)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF_SET  .LOCAL_TMP6_LOCAL
            .R_STOP
        ; -- Calculate coordinate values
        VM_RPN
            .R_REF      .LOCAL_TMP5_LOCAL
            .R_INT16    0
            .R_OPERATOR .ADD
            .R_INT16    128
            .R_OPERATOR .MUL
            .R_REF_SET  ^/(.LOCAL_ACTOR + 1)/
            .R_REF      .LOCAL_TMP6_LOCAL
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_INT16    128
            .R_OPERATOR .MUL
            .R_REF_SET  ^/(.LOCAL_ACTOR + 2)/
            .R_STOP
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 3)/, ^/(.ACTOR_ATTR_CHECK_COLL | .ACTOR_ATTR_H_FIRST)/
        ; -- Move Actor
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_MOVE_TO        .LOCAL_ACTOR

        VM_JUMP                 8$
        ; case 3:
6$:
        ; Actor Move Relative
        ; -- Fetch $self$ xpos
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_GET_POS        .LOCAL_ACTOR
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 1)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF_SET  .LOCAL_TMP7_LOCAL
            .R_STOP
        ; -- Fetch $self$ ypos
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 2)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF_SET  .LOCAL_TMP8_LOCAL
            .R_STOP
        ; -- Calculate coordinate values
        VM_RPN
            .R_REF      .LOCAL_TMP7_LOCAL
            .R_INT16    -1
            .R_OPERATOR .ADD
            .R_INT16    128
            .R_OPERATOR .MUL
            .R_REF_SET  ^/(.LOCAL_ACTOR + 1)/
            .R_REF      .LOCAL_TMP8_LOCAL
            .R_INT16    0
            .R_OPERATOR .ADD
            .R_INT16    128
            .R_OPERATOR .MUL
            .R_REF_SET  ^/(.LOCAL_ACTOR + 2)/
            .R_STOP
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 3)/, ^/(.ACTOR_ATTR_CHECK_COLL | .ACTOR_ATTR_H_FIRST)/
        ; -- Move Actor
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_MOVE_TO        .LOCAL_ACTOR

        VM_JUMP                 8$
        ; case 4:
7$:
        ; Actor Move Relative
        ; -- Fetch $self$ xpos
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_GET_POS        .LOCAL_ACTOR
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 1)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF_SET  .LOCAL_TMP9_LOCAL
            .R_STOP
        ; -- Fetch $self$ ypos
        VM_RPN
            .R_REF      ^/(.LOCAL_ACTOR + 2)/
            .R_INT16    128
            .R_OPERATOR .DIV
            .R_REF_SET  .LOCAL_TMP10_LOCAL
            .R_STOP
        ; -- Calculate coordinate values
        VM_RPN
            .R_REF      .LOCAL_TMP9_LOCAL
            .R_INT16    0
            .R_OPERATOR .ADD
            .R_INT16    128
            .R_OPERATOR .MUL
            .R_REF_SET  ^/(.LOCAL_ACTOR + 1)/
            .R_REF      .LOCAL_TMP10_LOCAL
            .R_INT16    -1
            .R_OPERATOR .ADD
            .R_INT16    128
            .R_OPERATOR .MUL
            .R_REF_SET  ^/(.LOCAL_ACTOR + 2)/
            .R_STOP
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 3)/, ^/(.ACTOR_ATTR_CHECK_COLL | .ACTOR_ATTR_H_FIRST)/
        ; -- Move Actor
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_MOVE_TO        .LOCAL_ACTOR

        VM_JUMP                 8$
8$:

        ; Wait N Frames
        VM_SET_CONST            .LOCAL_TMP11_WAIT_ARGS, 30
        VM_INVOKE               b_wait_frames, _wait_frames, 0, .LOCAL_TMP11_WAIT_ARGS

        ; Variable Set To Random
        VM_RAND                 VAR_S10A5_DIRECTION, 1, 4

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_S10A10_HEALTH_4
            .R_INT16    0
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP12_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP12_IF_VALUE, 0, 9$, 0
        VM_JUMP                 10$
9$:
        ; Variables .SUB Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .SUB
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

10$:

        ; Idle
        VM_IDLE

        VM_JUMP                 1$
        ; Stop Script
        VM_STOP

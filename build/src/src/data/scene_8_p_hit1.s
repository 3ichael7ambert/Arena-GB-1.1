.module scene_8_p_hit1

.include "vm.i"
.include "data/game_globals.i"
.include "macro.i"

.globl _fade_frames_per_step, _camera_settings, ___bank_scene_14, _scene_14

.area _CODE_255

.LOCAL_TMP0_PARAM0_VALUE = -4
.LOCAL_TMP1_IF_VALUE = -4
.LOCAL_ACTOR = -4

___bank_scene_8_p_hit1 = 255
.globl ___bank_scene_8_p_hit1

_scene_8_p_hit1::
        VM_RESERVE              4

        ; If Parameter 0 Equals 8
        VM_GET_TLOCAL           .LOCAL_TMP0_PARAM0_VALUE, 0
        VM_IF_CONST             .EQ, .LOCAL_TMP0_PARAM0_VALUE, 8, 1$, 0
        VM_JUMP                 2$
1$:
        ; Variables .SUB Value
        VM_RPN
            .R_REF      VAR_PLAYERHEALTH
            .R_INT16    1
            .R_OPERATOR .SUB
            .R_REF_SET  VAR_PLAYERHEALTH
            .R_STOP

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_PLAYERHEALTH
            .R_REF_SET  .LOCAL_TMP1_IF_VALUE
            .R_STOP
        ; If Falsy
        VM_IF_CONST             .EQ, .LOCAL_TMP1_IF_VALUE, 0, 3$, 0
        VM_JUMP                 4$
3$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_LEVEL, 1

        ; Variable Set To Value
        VM_SET_CONST            VAR_PLAYERHEALTH, 4

        ; Load Scene
        VM_SET_CONST_INT8       _fade_frames_per_step, 3
        VM_FADE_OUT             1
        ; -- Calculate coordinate values
        VM_RPN
            .R_INT16    0
            .R_REF_SET  ^/(.LOCAL_ACTOR + 1)/
            .R_INT16    0
            .R_REF_SET  ^/(.LOCAL_ACTOR + 2)/
            .R_STOP
        VM_SET_CONST            .LOCAL_ACTOR, 0
        VM_ACTOR_SET_POS        .LOCAL_ACTOR
        VM_ACTOR_SET_DIR        .LOCAL_ACTOR, .DIR_DOWN
        VM_SET_CONST_INT8       _camera_settings, .CAMERA_LOCK
        VM_RAISE                EXCEPTION_CHANGE_SCENE, 3
            IMPORT_FAR_PTR_DATA _scene_14

4$:

        ; Actor Set Animation Frame To
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_PLAYERHEALTH
            .R_REF_SET  ^/(.LOCAL_ACTOR + 1)/
            .R_STOP
        VM_SET_CONST            .LOCAL_ACTOR, 0
        VM_ACTOR_SET_ANIM_FRAME .LOCAL_ACTOR

        ; Stop Script
        VM_STOP
2$:

        ; Stop Script
        VM_STOP

.module actor_12_update

.include "vm.i"
.include "data/game_globals.i"
.include "macro.i"

.globl b_wait_frames, _wait_frames, _fade_frames_per_step, _camera_settings, ___bank_scene_6, _scene_6

.area _CODE_255

.LOCAL_TMP0_WAIT_ARGS = -4
.LOCAL_TMP1_IF_VALUE = -4
.LOCAL_ACTOR = -4
.LOCAL_TMP3_IF_VALUE = -4
.LOCAL_TMP4_IF_VALUE = -4

___bank_actor_12_update = 255
.globl ___bank_actor_12_update

_actor_12_update::
        VM_RESERVE              4

1$:
        ; Wait N Frames
        VM_SET_CONST            .LOCAL_TMP0_WAIT_ARGS, 90
        VM_INVOKE               b_wait_frames, _wait_frames, 0, .LOCAL_TMP0_WAIT_ARGS

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_REF_SET  .LOCAL_TMP1_IF_VALUE
            .R_STOP
        ; If Falsy
        VM_IF_CONST             .EQ, .LOCAL_TMP1_IF_VALUE, 0, 2$, 0
        VM_JUMP                 3$
2$:
        ; Text Dialogue
        VM_LOAD_TEXT            1
        .dw VAR_LEVEL
        .asciz "Congratulations on\012beating level %d"
        VM_OVERLAY_CLEAR        0, 0, 20, 4, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_OVERLAY_MOVE_TO      0, 14, .OVERLAY_IN_SPEED
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_OVERLAY_MOVE_TO      0, 18, .OVERLAY_OUT_SPEED
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/

        ; Load Scene
        VM_SET_CONST_INT8       _fade_frames_per_step, 3
        VM_FADE_OUT             1
        ; -- Calculate coordinate values
        VM_RPN
            .R_INT16    1024
            .R_REF_SET  ^/(.LOCAL_ACTOR + 1)/
            .R_INT16    896
            .R_REF_SET  ^/(.LOCAL_ACTOR + 2)/
            .R_STOP
        VM_SET_CONST            .LOCAL_ACTOR, 0
        VM_ACTOR_SET_POS        .LOCAL_ACTOR
        VM_ACTOR_SET_DIR        .LOCAL_ACTOR, .DIR_DOWN
        VM_SET_CONST_INT8       _camera_settings, .CAMERA_LOCK
        VM_RAISE                EXCEPTION_CHANGE_SCENE, 3
            IMPORT_FAR_PTR_DATA _scene_6

3$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_COOLDOWN
            .R_REF_SET  .LOCAL_TMP3_IF_VALUE
            .R_STOP
        ; If Falsy
        VM_IF_CONST             .EQ, .LOCAL_TMP3_IF_VALUE, 0, 4$, 0
        VM_JUMP                 5$
4$:
        ; Variable Decrement By 1
        VM_RPN
            .R_REF      VAR_S6A6_COOLCOUNT
            .R_INT8     1
            .R_OPERATOR .SUB
            .R_REF_SET  VAR_S6A6_COOLCOUNT
            .R_STOP

5$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_S6A6_COOLCOUNT
            .R_INT16    0
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP4_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP4_IF_VALUE, 0, 6$, 0
        VM_JUMP                 7$
6$:
        ; Variable Set To
        VM_SET_CONST            VAR_COOLDOWN, 1

        ; Variable Set To
        VM_SET_CONST            VAR_S6A6_COOLCOUNT, 1

7$:

        ; Idle
        VM_IDLE

        VM_JUMP                 1$
        ; Stop Script
        VM_STOP

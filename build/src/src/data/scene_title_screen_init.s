.module scene_title_screen_init

.include "vm.i"
.include "data/game_globals.i"
.include "macro.i"

.globl b_wait_frames, _wait_frames, _fade_frames_per_step, _camera_settings, ___bank_scene_10, _scene_10

.area _CODE_255

.LOCAL_ACTOR = -4
.LOCAL_TMP1_WAIT_ARGS = -5
.LOCAL_TMP2_IF_VALUE = -5
.LOCAL_TMP3_SAVE_PEEK = -5

___bank_scene_title_screen_init = 255
.globl ___bank_scene_title_screen_init

_scene_title_screen_init::
        VM_LOCK

        VM_RESERVE              5

        ; Variable Set To
        VM_SET_CONST            VAR_LEVEL, 1

        ; Variable Set To Value
        VM_SET_CONST            VAR_ENEMYCOUNT, 1

        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 1

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 0
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        ; Wait N Frames
        VM_SET_CONST            .LOCAL_TMP1_WAIT_ARGS, 1
        VM_INVOKE               b_wait_frames, _wait_frames, 0, .LOCAL_TMP1_WAIT_ARGS

        ; Fade In
        VM_SET_CONST_INT8       _fade_frames_per_step, 1
        VM_FADE_IN              1

        ; Wait For Input
        VM_INPUT_WAIT           240

        ; Seed RNG
        VM_RANDOMIZE

2$:
        ; Text Multiple Choice
        VM_LOAD_TEXT            0
        .asciz "\001\001\003\003\002New Game\012\003\003\003Continue"
        VM_OVERLAY_CLEAR        0, 0, 20, 4, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_OVERLAY_MOVE_TO      0, 14, .OVERLAY_IN_SPEED
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/
        VM_CHOICE               VAR_NEWGAME, ^/(.UI_MENU_LAST_0 | .UI_MENU_CANCEL_B)/, 2
            .MENUITEM           1, 1, 0, 0, 0, 2
            .MENUITEM           1, 2, 0, 0, 1, 0
        VM_OVERLAY_MOVE_TO      0, 18, .OVERLAY_OUT_SPEED
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_NEWGAME
            .R_REF_SET  .LOCAL_TMP2_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP2_IF_VALUE, 0, 3$, 0
        ; If Variable True
        VM_SAVE_PEEK            .LOCAL_TMP3_SAVE_PEEK, 0, 0, 0, 0
        VM_IF_CONST             .EQ, .LOCAL_TMP3_SAVE_PEEK, 1, 5$, 0

        ; Text Dialogue
        VM_LOAD_TEXT            0
        .asciz "No Save Data\012Found..."
        VM_OVERLAY_CLEAR        0, 0, 20, 4, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_OVERLAY_MOVE_TO      0, 14, .OVERLAY_IN_SPEED
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_OVERLAY_MOVE_TO      0, 18, .OVERLAY_OUT_SPEED
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/

        VM_JUMP                 6$
5$:
        ; Load Data from Slot 0
        VM_RAISE                EXCEPTION_LOAD, 1
            .SAVE_SLOT 0

6$:

        VM_JUMP                 4$
3$:
        ; Load Scene
        VM_SET_CONST_INT8       _fade_frames_per_step, 15
        VM_FADE_OUT             1
        ; -- Calculate coordinate values
        VM_RPN
            .R_INT16    2688
            .R_REF_SET  ^/(.LOCAL_ACTOR + 1)/
            .R_INT16    2688
            .R_REF_SET  ^/(.LOCAL_ACTOR + 2)/
            .R_STOP
        VM_SET_CONST            .LOCAL_ACTOR, 0
        VM_ACTOR_SET_POS        .LOCAL_ACTOR
        VM_ACTOR_SET_DIR        .LOCAL_ACTOR, .DIR_DOWN
        VM_SET_CONST_INT8       _camera_settings, .CAMERA_LOCK
        VM_RAISE                EXCEPTION_CHANGE_SCENE, 3
            IMPORT_FAR_PTR_DATA _scene_10

4$:

        VM_JUMP                 2$
        ; Stop Script
        VM_STOP

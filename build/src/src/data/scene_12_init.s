.module scene_12_init

.include "vm.i"
.include "data/game_globals.i"

.globl b_wait_frames, _wait_frames, _fade_frames_per_step

.area _CODE_255

.LOCAL_TMP0_IF_VALUE = -4
.LOCAL_ACTOR = -4
.LOCAL_TMP10_IF_VALUE = -4
.LOCAL_TMP11_IF_VALUE = -4
.LOCAL_TMP12_IF_VALUE = -4
.LOCAL_TMP13_IF_VALUE = -4
.LOCAL_TMP14_IF_VALUE = -4
.LOCAL_TMP15_IF_VALUE = -4
.LOCAL_TMP16_IF_VALUE = -4
.LOCAL_TMP17_IF_VALUE = -4
.LOCAL_TMP18_IF_VALUE = -4
.LOCAL_TMP19_IF_VALUE = -4
.LOCAL_TMP20_IF_VALUE = -4
.LOCAL_TMP21_IF_VALUE = -4
.LOCAL_TMP22_IF_VALUE = -4
.LOCAL_TMP23_IF_VALUE = -4
.LOCAL_TMP24_IF_VALUE = -4
.LOCAL_TMP25_IF_VALUE = -4
.LOCAL_TMP26_IF_VALUE = -4
.LOCAL_TMP27_IF_VALUE = -4
.LOCAL_TMP28_IF_VALUE = -4
.LOCAL_TMP29_HAS_LOADED = -4
.LOCAL_TMP30_PEEK_VALUE = -4
.LOCAL_TMP31_PEEK_VALUE = -4
.LOCAL_TMP32_WAIT_ARGS = -4
.LOCAL_TMP2_IF_VALUE = -5
.LOCAL_TMP3_IF_VALUE = -5
.LOCAL_TMP4_IF_VALUE = -5
.LOCAL_TMP5_IF_VALUE = -5
.LOCAL_TMP6_IF_VALUE = -5
.LOCAL_TMP7_IF_VALUE = -5
.LOCAL_TMP8_IF_VALUE = -5
.LOCAL_TMP9_IF_VALUE = -5

___bank_scene_12_init = 255
.globl ___bank_scene_12_init

_scene_12_init::
        VM_LOCK

        VM_RESERVE              5

        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_LEVEL
            .R_STOP

        ; Variable Set To
        VM_SET_CONST            VAR_COOLDOWN, 1

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_COOLCOUNT, 1

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH, 3

        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH_1, 3

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_MASENEMYCOUNT
            .R_INT16    2
            .R_OPERATOR .LT
            .R_REF_SET  .LOCAL_TMP0_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP0_IF_VALUE, 0, 1$, 0
        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        VM_JUMP                 2$
1$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 3
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

2$:

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH_2, 3

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_MASENEMYCOUNT
            .R_INT16    3
            .R_OPERATOR .LT
            .R_REF_SET  .LOCAL_TMP2_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP2_IF_VALUE, 0, 3$, 0
        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        VM_JUMP                 4$
3$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 4
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

4$:

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH_3, 3

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_MASENEMYCOUNT
            .R_INT16    4
            .R_OPERATOR .LT
            .R_REF_SET  .LOCAL_TMP3_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP3_IF_VALUE, 0, 5$, 0
        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        VM_JUMP                 6$
5$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 5
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

6$:

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH_4, 3

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_MASENEMYCOUNT
            .R_INT16    5
            .R_OPERATOR .LT
            .R_REF_SET  .LOCAL_TMP4_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP4_IF_VALUE, 0, 7$, 0
        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        VM_JUMP                 8$
7$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

8$:

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH_5, 3

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_MASENEMYCOUNT
            .R_INT16    6
            .R_OPERATOR .LT
            .R_REF_SET  .LOCAL_TMP5_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP5_IF_VALUE, 0, 9$, 0
        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        VM_JUMP                 10$
9$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 7
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

10$:

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH_6, 3

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_MASENEMYCOUNT
            .R_INT16    7
            .R_OPERATOR .LT
            .R_REF_SET  .LOCAL_TMP6_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP6_IF_VALUE, 0, 11$, 0
        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        VM_JUMP                 12$
11$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 8
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

12$:

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH_7, 3

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_MASENEMYCOUNT
            .R_INT16    8
            .R_OPERATOR .LT
            .R_REF_SET  .LOCAL_TMP7_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP7_IF_VALUE, 0, 13$, 0
        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        VM_JUMP                 14$
13$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 9
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

14$:

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH_8, 3

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_MASENEMYCOUNT
            .R_INT16    9
            .R_OPERATOR .LT
            .R_REF_SET  .LOCAL_TMP8_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP8_IF_VALUE, 0, 15$, 0
        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        VM_JUMP                 16$
15$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 10
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

16$:

        ; Variable Set To
        VM_SET_CONST            VAR_S11A11_HEALTH_9, 3

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_MASENEMYCOUNT
            .R_INT16    10
            .R_OPERATOR .LT
            .R_REF_SET  .LOCAL_TMP9_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP9_IF_VALUE, 0, 17$, 0
        ; Variables .ADD Value
        VM_RPN
            .R_REF      VAR_ENEMYCOUNT
            .R_INT16    1
            .R_OPERATOR .ADD
            .R_REF_SET  VAR_ENEMYCOUNT
            .R_STOP

        VM_JUMP                 18$
17$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 11
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

18$:

        ; Actor Set Animation Frame To
        ; -- Calculate value
        VM_RPN
            .R_INT16    4
            .R_REF_SET  ^/(.LOCAL_ACTOR + 1)/
            .R_STOP
        VM_SET_CONST            .LOCAL_ACTOR, 12
        VM_ACTOR_SET_ANIM_FRAME .LOCAL_ACTOR

        ; Input Script Attach
        VM_CONTEXT_PREPARE      4, ___bank_script_input_9, _script_input_9
        VM_INPUT_ATTACH         16, ^/(4 | .OVERRIDE_DEFAULT)/

        ; Variable Set To Value
        VM_SET_CONST            VAR_PLAYERHEALTH, 4

        ; Variable Copy
        VM_SET                  VAR_ENEMYCOUNT, VAR_MASENEMYCOUNT

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    10
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP10_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP10_IF_VALUE, 0, 19$, 0
        VM_JUMP                 20$
19$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 1

20$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    11
            .R_OPERATOR .GT
            .R_REF_SET  .LOCAL_TMP11_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP11_IF_VALUE, 0, 21$, 0
        VM_JUMP                 22$
21$:
        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    20
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP12_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP12_IF_VALUE, 0, 23$, 0
        VM_JUMP                 24$
23$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 2

24$:

22$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    21
            .R_OPERATOR .GT
            .R_REF_SET  .LOCAL_TMP13_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP13_IF_VALUE, 0, 25$, 0
        VM_JUMP                 26$
25$:
        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    30
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP14_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP14_IF_VALUE, 0, 27$, 0
        VM_JUMP                 28$
27$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 3

28$:

26$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    31
            .R_OPERATOR .GT
            .R_REF_SET  .LOCAL_TMP15_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP15_IF_VALUE, 0, 29$, 0
        VM_JUMP                 30$
29$:
        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    40
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP16_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP16_IF_VALUE, 0, 31$, 0
        VM_JUMP                 32$
31$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 4

32$:

30$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    41
            .R_OPERATOR .GT
            .R_REF_SET  .LOCAL_TMP17_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP17_IF_VALUE, 0, 33$, 0
        VM_JUMP                 34$
33$:
        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    50
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP18_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP18_IF_VALUE, 0, 35$, 0
        VM_JUMP                 36$
35$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 5

36$:

34$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    51
            .R_OPERATOR .GT
            .R_REF_SET  .LOCAL_TMP19_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP19_IF_VALUE, 0, 37$, 0
        VM_JUMP                 38$
37$:
        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    60
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP20_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP20_IF_VALUE, 0, 39$, 0
        VM_JUMP                 40$
39$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 6

40$:

38$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    61
            .R_OPERATOR .GT
            .R_REF_SET  .LOCAL_TMP21_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP21_IF_VALUE, 0, 41$, 0
        VM_JUMP                 42$
41$:
        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    70
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP22_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP22_IF_VALUE, 0, 43$, 0
        VM_JUMP                 44$
43$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 7

44$:

42$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    71
            .R_OPERATOR .GT
            .R_REF_SET  .LOCAL_TMP23_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP23_IF_VALUE, 0, 45$, 0
        VM_JUMP                 46$
45$:
        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    80
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP24_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP24_IF_VALUE, 0, 47$, 0
        VM_JUMP                 48$
47$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 8

48$:

46$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    81
            .R_OPERATOR .GT
            .R_REF_SET  .LOCAL_TMP25_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP25_IF_VALUE, 0, 49$, 0
        VM_JUMP                 50$
49$:
        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    90
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP26_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP26_IF_VALUE, 0, 51$, 0
        VM_JUMP                 52$
51$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 9

52$:

50$:

        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    91
            .R_OPERATOR .GT
            .R_REF_SET  .LOCAL_TMP27_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP27_IF_VALUE, 0, 53$, 0
        VM_JUMP                 54$
53$:
        ; If
        ; -- Calculate value
        VM_RPN
            .R_REF      VAR_LEVEL
            .R_INT16    100
            .R_OPERATOR .LTE
            .R_REF_SET  .LOCAL_TMP28_IF_VALUE
            .R_STOP
        ; If Truthy
        VM_IF_CONST             .NE, .LOCAL_TMP28_IF_VALUE, 0, 55$, 0
        VM_JUMP                 56$
55$:
        ; Variable Set To Value
        VM_SET_CONST            VAR_MASENEMYCOUNT, 10

56$:

54$:

        ; Save Data to Slot 0
        VM_RAISE                EXCEPTION_SAVE, 1
            .SAVE_SLOT 0
        VM_POLL_LOADED          .LOCAL_TMP29_HAS_LOADED
        VM_IF_CONST             .EQ, .LOCAL_TMP29_HAS_LOADED, 1, 57$, 0

        ; Store VAR_LEVEL from save slot 0 into VAR_LEVEL
        VM_SAVE_PEEK            .LOCAL_TMP30_PEEK_VALUE, VAR_LEVEL, VAR_LEVEL, 1, 0
        VM_IF_CONST             .EQ, .LOCAL_TMP30_PEEK_VALUE, 1, 58$, 0
        VM_SET_CONST            VAR_LEVEL, 0
58$:

        ; Store VAR_MASENEMYCOUNT from save slot 0 into VAR_MASENEMYCOUNT
        VM_SAVE_PEEK            .LOCAL_TMP31_PEEK_VALUE, VAR_MASENEMYCOUNT, VAR_MASENEMYCOUNT, 1, 0
        VM_IF_CONST             .EQ, .LOCAL_TMP31_PEEK_VALUE, 1, 59$, 0
        VM_SET_CONST            VAR_MASENEMYCOUNT, 0
59$:

57$:

        ; Wait N Frames
        VM_SET_CONST            .LOCAL_TMP32_WAIT_ARGS, 1
        VM_INVOKE               b_wait_frames, _wait_frames, 0, .LOCAL_TMP32_WAIT_ARGS

        ; Fade In
        VM_SET_CONST_INT8       _fade_frames_per_step, 1
        VM_FADE_IN              1

        ; Stop Script
        VM_STOP

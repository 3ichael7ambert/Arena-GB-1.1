#pragma bank 255

// Scene: Arena2

#include "gbs_types.h"
#include "data/bg_arena1_copy.h"
#include "data/scene_5_collisions.h"
#include "data/palette_0.h"
#include "data/palette_1.h"
#include "data/sprite_player.h"
#include "data/scene_5_actors.h"
#include "data/scene_5_sprites.h"
#include "data/scene_5_projectiles.h"
#include "data/scene_5_init.h"
#include "data/scene_5_p_hit1.h"

BANKREF(scene_5)

const struct scene_t scene_5 = {
    .width = 32,
    .height = 32,
    .type = SCENE_TYPE_ADVENTURE,
    .background = TO_FAR_PTR_T(bg_arena1_copy),
    .collisions = TO_FAR_PTR_T(scene_5_collisions),
    .parallax_rows = {
        PARALLAX_STEP(0,0,0)
    },
    .palette = TO_FAR_PTR_T(palette_0),
    .sprite_palette = TO_FAR_PTR_T(palette_1),
    .reserve_tiles = 0,
    .player_sprite = TO_FAR_PTR_T(sprite_player),
    .n_actors = 12,
    .n_triggers = 0,
    .n_sprites = 3,
    .n_projectiles = 2,
    .actors = TO_FAR_PTR_T(scene_5_actors),
    .sprites = TO_FAR_PTR_T(scene_5_sprites),
    .projectiles = TO_FAR_PTR_T(scene_5_projectiles),
    .script_init = TO_FAR_PTR_T(scene_5_init),
    .script_p_hit1 = TO_FAR_PTR_T(scene_5_p_hit1)
};

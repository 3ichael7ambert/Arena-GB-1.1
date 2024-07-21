#pragma bank 255
// SpriteSheet: bullet

#include "gbs_types.h"
#include "data/sprite_bullet_tileset.h"


BANKREF(sprite_bullet)

#define SPRITE_0_STATE_DEFAULT 0

const metasprite_t sprite_bullet_metasprite_0[]  = {
    { -14, 2, 0, 0 }, { 0, -2, 0, 0 }, { -2, 0, 0, 0 }, { 0, 2, 0, 0 },
    {metasprite_end}
};

const metasprite_t * const sprite_bullet_metasprites[] = {
    sprite_bullet_metasprite_0
};

const struct animation_t sprite_bullet_animations[] = {
    {
        .start = 0,
        .end = 0
    },
    {
        .start = 0,
        .end = 0
    },
    {
        .start = 0,
        .end = 0
    },
    {
        .start = 0,
        .end = 0
    },
    {
        .start = 0,
        .end = 0
    },
    {
        .start = 0,
        .end = 0
    },
    {
        .start = 0,
        .end = 0
    },
    {
        .start = 0,
        .end = 0
    }
};

const UWORD sprite_bullet_animations_lookup[] = {
    SPRITE_0_STATE_DEFAULT
};

const struct spritesheet_t sprite_bullet = {
    .n_metasprites = 1,
    .emote_origin = {
        .x = 0,
        .y = -32
    },
    .metasprites = sprite_bullet_metasprites,
    .animations = sprite_bullet_animations,
    .animations_lookup = sprite_bullet_animations_lookup,
    .bounds = {
        .left = 6,
        .bottom = -7,
        .right = 9,
        .top = -10
    },
    .tileset = TO_FAR_PTR_T(sprite_bullet_tileset),
    .cgb_tileset = { NULL, NULL }
};

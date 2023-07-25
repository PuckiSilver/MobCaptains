#> This function only exists to create the loot tables using bolt
namespace = __name__.split(':')[0]

def item(item, weight, funcs):
    funcs.append({"function":"minecraft:set_lore",
        "lore": [{ "text": "MobCaptains",
                    "color": "blue",
                    "italic": False}]})
    return {
        "type": "minecraft:item",
        "name": f'minecraft:{item}',
        "functions": funcs,
        "weight": weight,
    }

def enchantments(*enchantments):
    enchs = {}
    for id, lvl in zip(enchantments[::2], enchantments[1::2]):
        if type(lvl) == tuple:
            enchs[f'minecraft:{id}'] = { "min": lvl[0], "max": lvl[1] }
        else:
            enchs[f'minecraft:{id}'] = lvl
    return {"function": "minecraft:set_enchantments", "enchantments": enchs}

def nbt(nbt):
    return { "function": "minecraft:set_nbt", "tag": nbt }

def name(name, color):
    return { "function": "minecraft:set_name", "name": {
        "text": name,
        "color": color,
        "italic": False}}

# //////////////////////////////////////////////// #

loot_table ./overworld/common {
    "pools": [{ "rolls": 1, "entries": [
        item('potion', 90, [
            name('Medkit', '#ff45f6'),
            nbt('{CustomPotionEffects:[{Id:10,Amplifier:4b,Duration:240}]}'),
            {"function": "minecraft:set_potion", "id": "minecraft:strong_healing"},
        ]),
        item('shield', 100, [
            name('Riot Shield', '#2c348f'),
            nbt('{BlockEntityTag:{Patterns:[{Pattern:"gru",Color:9},{Pattern:"hhb",Color:8},{Pattern:"ms",Color:7},{Pattern:"bo",Color:7}],Base:0}}'),
            enchantments('unbreaking', (3,5), 'protection', (2,4)),
        ]),
        item('stick', 100, [
            name('Knockback Stick', '#ff9d00'),
            enchantments('knockback', (2,4)),
        ]),
        item('golden_axe', 80, [
            name('Greed', '#d99307'),
            enchantments('looting', (1,4)),
        ]),
        item('leather_helmet', 100, [
            name('Propeller Hat', '#00ff00'),
            enchantments('feather_falling', (1,4)),
            nbt('{display:{color:16711680}}'),
        ]),
        item('golden_chestplate', 100, [
            name('Cactus', '#30de00'),
            enchantments('thorns', (2,5)),
        ]),
        item('wooden_sword', 100, [
            name('Match', '#c23511'),
            enchantments('fire_aspect', (1,4)),
        ]),
        item('crossbow', 90, [
            name('Multiplier', '#96ffcb'),
            enchantments('piercing', (1,4), 'multishot', 1),
        ]),
        item('iron_axe', 90, [
            name('Mjölnir', '#fff291'),
            enchantments('smite', (2,5)),
        ]),
        item('stone_axe', 90, [
            name('Primitive Chainsaw', '#383130'),
            enchantments('efficiency', (3,6)),
        ]),
        item('golden_pickaxe', 90, [
            name('Primitive Mining Drill', '#756e6c'),
            enchantments('efficiency', (3,6)),
        ]),
    ]}]}

loot_table ./overworld/uncommon {
    "pools": [{ "rolls": 1, "entries": [
        item('golden_chestplate', 80, [
            name('S.W.A.T. Vest', '#997932'),
            enchantments('binding_curse', 1, 'protection', (4,7)),
        ]),
        item('iron_pickaxe', 70, [
            name('Gem Magnet', '#ff0001'),
            enchantments('fortune', (2,4)),
        ]),
        item('iron_horse_armor', 100, [
            name('Tough Horse Armor', '#995f32'),
            enchantments('protection', (1,4)),
        ]),
        item('iron_boots', 80, [
            name('Long Fall Boots', '#44d3e3'),
            enchantments('feather_falling', (5,6)),
        ]),
        item('golden_leggings', 80, [
            name('S.W.A.T. Pants', '#997932'),
            enchantments('binding_curse', 1, 'protection', (4,7)),
        ]),
        item('chainmail_boots', 100, [
            name('Soul Stepper', '#45b3cc'),
            enchantments('soul_speed', (4,5), 'unbreaking', 2),
        ]),
        item('diamond_boots', 90, [
            name('Winter Flippers', '#abedeb'),
            enchantments('frost_walker', (1,2), 'depth_strider', (1,3)),
        ]),
        item('turtle_helmet', 100, [
            name('Diving Helmet', '#21ff55'),
            enchantments('respiration', (2,4), 'depth_strider', (1,3)),
        ]),
        item('chainmail_chestplate', 100, [
            name('Bulletproof Vest', '#edc266'),
            enchantments('projectile_protection', (4,6)),
        ]),
        item('iron_sword', 90, [
            name('Apocalypse', '#d90000'),
            enchantments('sharpness', (1,5), 'smite', (1,5)),
        ]),
    ]}]}

loot_table ./overworld/rare {
    "pools": [{ "rolls": 1, "entries": [
        item('trident', 20, [
            name('Ripper', '#470854'),
            enchantments('riptide', (3,5)),
        ]),
        item('totem_of_undying', 40, [
            name('Lucky Charm', '#81d600'),
            enchantments('protection', 1),
            {"function": "minecraft:set_attributes", "modifiers": [{"attribute": "minecraft:generic.luck", "name": "ps-mob.lucky_charm", "amount": 1, "operation": "addition", "id": "42600878-6e02-419a-97b4-695e8e4e3e14", "slot": "mainhand"}]},
        ]),
        item('netherite_hoe', 70, [
            name('Reaper\'s Scythe', '#21000d'),
            enchantments('sharpness', (3,6), 'vanishing_curse', 1),
        ]),
        item('trident', 30, [
            name('Poseidon\'s Trident', '#006653'),
            enchantments('sharpness', (2,5)),
        ]),
        item('bow', 90, [
            name('Cornucopia', '#d4a715'),
            enchantments('looting', (1,4)),
        ]),
        item('totem_of_undying', 45, [
            name('Y.O.L.O.', '#960019'),
            enchantments('vanishing_curse', 1),
        ]),
    ]}]}

loot_table ./overworld/legendary {
    "pools": [{ "rolls": 1, "entries": [
        item('elytra', 20, [
            name('Plated Elytra', '#ccbdf0'),
            enchantments('protection', (2,4)),
        ]),
        item('diamond_chestplate', 20, [
            name('Immortal', '#ff9ee5'),
            enchantments('protection', (2,4), 'blast_protection', (2,4), 'projectile_protection', (2,4), 'fire_protection', (2,4)),
        ]),
        item('bow', 20, [
            name('Robin\'s Bow', '#49db00'),
            enchantments('mending', 1, 'infinity', 1),
        ]),
    ]}]}

# HPBar Addon

This mod displays a HP bar and info about the target being aimed at.

It should work with all mods (sans those that come with their own HP bars, e.g. WoC and DnD) and provides special name pretty-printing for popular Complex Doom mods (LCA, RM, HAF, Ark, ILCA) and RGA2.

## Dependencies

* NewTextColors (This should be loaded automatically if you play on clusters like TSPG.)

## CVars

* `hpbar_style` (user): Choose how the HP bar is displayed. (default: 1)
  * 0: Disable HP bars.
  * 1: Show a full HP bar with monster infomation at top.
  * 2: Show target HP percentage under the crosshair.
* `hpbar_min_maxhp` (user): Only display HP bars for monsters whose spawn HP is higher than this value. This can be useful to reduce visual clutter while fighting lots of monsters. (default: 0)
* `hpbar_server_min_maxhp` (server): This is a server-wide variable that controls whether to send HP info to clients and essentially overrides a client's `hpbar_min_maxhp` if this value is higher. It can be used to reduce bandwidth usage (as health info for lesser monsters won't be sent over the network). (default: 0)
* `hpbar_server_tracker_threshold` (server): Set the minimal spawn health monsters must have to appear in the global tracker. (default: 2000)
* `hpbar_show_friendly` (user): Set whether to show HP bars for friendly targets. (default: false)

## Notes for Modders

To support customized names for monsters in your mod, simply add the name to be displayed in the `TAG` property of the monster actor.

## Changelogs

### v7
* Moved the HP tracker rightwards so it doesn't clip on 4:3 resolutions.
* Moved the HP tracker upwards to avoid overlapping with RGA's player health bar.
* Display monster names defined in the TAG property before resorting to class names.
* Pretty-printed RGA2 monster names are removed, since they are now from the actor's TAG since RGA2 1.38b.

### v6
* `hpbar_server_tracker_threshold` increased to 2000 by default.
* HP for selected boss monsters are always tracked regardless of the threshold setting.
* Trackers are now shown in tabular format.
* Fixed the case where clients receive invalid tids.

### v5
* Add minimal style HP display and the `hpbar_style` cvar.
* Add pretty names for true legendary cardinals, enraged legendary revenant, friendly players and explosive barrels!
* Show orange HP bars for monsters with 25~50% HP left.
* Add a globally visible HP tracker for the top 10 monsters (sorted by max hp) that has been spotted by players.

### v4
* Add `hpbar_min_maxhp` and `hpbar_server_min_maxhp` cvars.
* RGA2 Support.

### v3
* Show HP bars from other players.
* Show friendly tag if the actor being targeted is friendly.
* The HP bar now holds for 0.25 seconds.

### v2
* Make target names shown correctly in multiplayer.

## Source

https://github.com/pkmx/hpbar

## Credits

* Graphics for HP bar: Wrath of Cronos (Thetis)

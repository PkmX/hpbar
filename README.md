# HPBar & HP Tracker Mod

This mod displays a HP bar and info about the target being aimed at. It also provides a HP tracker for boss monsters that is visible for all players including spectators.

This mod is designed to work with all mods (sans those that come with their own HP bars, e.g. WoC and DnD) and provides special name pretty-printing for popular Complex Doom mods (LCA, RM, HAF, Ark, ILCA) and RGA2. Server hosts can further customize the behavior via cvars to support other mods.

## Dependencies

* NewTextColors (This should be loaded automatically if you play on clusters like TSPG.)

## CVars

* `hpbar_style` (user): Choose how the HP bar is displayed. (default: 1)
  * 0: Disable HP bars.
  * 1: Show a full HP bar with monster infomation at top.
  * 2: Show target HP percentage under the crosshair.
* `hpbar_threshold` (server): Only display HP bars for monsters with more spawn HP than this value. It can be used to reduce bandwidth usage (as health info for lesser monsters won't be sent over the network) or to reduce visual clutter when fighting monsters of different levels. (default: 0)
* `hpbar_tracker` (server): Set whether to enable the HP tracker. (default: true)
* `hpbar_tracker_x` (server): The x position of the HP tracker, from 0.0 (left) to 1.0 (right). (default: 0.02)
* `hpbar_tracker_y` (server): The y position of the HP tracker, from 0.0 (top) to 1.0 (bottom). (default: 0.58)
* `hpbar_tracker_threshold` (server): Set the minimal spawn health monsters must have to appear in the global tracker. (default: 2000)
* `hpbar_show_friendly` (user): Set whether to show HP bars for friendly targets. (default: false)
* `hpbar_rekt` (server): Set whether to count and show the number of players killed by a monster. You need to restart the map after altering this variable to apply the changes. (default: true)
* `hpbar_announcer` (user): Whether to play announcer messages and voices when monsters achieve certain kills. (default: true)
* `hpbar_zan3` (server): Set this variable to true if you are hosting with Zandronum 3.0. This includes: HP display for farther targets, more accurate invul flag, reflect flag, etc. (default: false)

### `hpbar_name_*`

Server hosts can customize the display name of monsters by setting the `hpbar_name_$actor` cvar. This can be useful if you are loading mods that aren't supported by hpbar yet or want to change the default formatting set by hpbar. For example, you can make Cacodemons (actor name: `Cacodemon`) to be displayed as `Hissy` by setting:

```
set hpbar_name_Cacodemon Hissy
```

### `hpbar_track_*`

You can control whether a monster is tracked by the HP tracker by setting `hpbar_track_$actor` to `1` (always track) or `-1` (never track). This takes precedence over `hpbar_tracker_threshold` which allows you to set it on a per monster basis. For instance, to always track Cacodemons:

```
set hpbar_track_Cacodemon true
```

### `hpbar_map_*`

This provides a normalization mapping from actor names to actor names to be used in `hpbar_name_*` and `hpbar_track_*`. For example, HAF replaces `LegendaryImp` with the slightly modified `LegendaryImp2`, so we provide a mapping `hpbar_map_LegendaryImp2` to `LegendaryImp` and `LegendaryImp2` will now reuse the display name and tracking rules of `LegendaryImp`.

## Notes for Modders

To support customized names for monsters in your mod, simply add the name to be displayed in the `TAG` property of the monster actor. Monsters with the `BOSS` flag set is also tracked by default regardless of its HP.

## Changelogs

### v15b
* Support for randommons v1.1.8.

### v15a
* Mark weak versions of hellfire cyberdemon and cerebral commander as weak.
* Support for replacers v0h.

### v15
* Both Zandronum 2.1.2 and 3.0 are supported simultaneously now. If you are playing on 3.0, set cvar `hpbar_zan3` to true.
* Fixed the issue where multiple announcements in the same tic cause the wrong message to be displayed. Now only the highest priority one is shown.
* First dumb now shown only for suicides and environmental (damage sector, etc) kills.
* HP tracker now shows reflect flag. (ZAN 3.0 only)

### v14a
* Support for randommons v1.1.7.

### v14
* **HPBar now requires Zandronum 3.0!** If you are playing on Zandronum 2.1.2, please stay on v13.
* Switch to PickActor-based target acquisition. Players should now be able to see target's HP and have it tracked from greater distances.
* Use higher quality UT announcer sounds, and added sexy holy shit announcer for more than 10 consecutive kills.
* Added description text for kill streaks, for people who aren't familiar with UT's announcer system.
* Unshootable targets are now identified as invulerable.
* Monsters are now automatically added to the tracker list upon scoring a kill.
* Fixed the issue where kills are misattributed to a player.
* Fixed announcer and escaped color code in monster's name in Zandronum 3.0.
* Customized monster names now appear correctly in announcer.
* Gaining another tier of total kills (e.g. rampage) surpress the announcement of the previous (e.g. killing spree).
* Invul states in the tracker is also broadcasted when a new client connects.
* Monsters are now tracked by default if it has the BOSS flag set.
* Removed support for rm-ark as it is obsolete.

### v13
* Added UT-style announcers for monster's kills. This replaces the old rekt announcement in v12.

### v12
* `hpbar_track_*` can now disable tracking for monsters by setting it to `-1`.
* Rekt counter is now colored!
* Add rekt announcement if a monster gives too many rekts.
* `hpbar_show_monster_kill_count` cvar is renamed to `hpbar_rekt`.
* Fixed name mapping for fake legendary cyber nobles spawned by TLC.
* Legendary redeemer clones are no longer tracked.
* Support for HEM-HAF v1.6.2.8 and HEM-LCA v2.3.
* Support for LCA v1.5.8.

### v11
* Support rm-ark v4.
* Fixed the bug where a new player joining would temporarily set monsters' kill counts to 0.
* The HP tracker now gets invulnerability info from server, which should fix the problem where clientside thinks an actor is stuck in invulnerability state (when it is not).

### v10
* Added a counter that shows how many players got rekt by a monster.
* The HP tracker now supports wide-screen instead of being limited to the central 4:3 area. Both `hpbar_tracker_{x, y}`'s interval are now `[0.0, 1.0]`.
* Servers can now disable the HP tracker altogether.
* Names of fake legendary monsters are now properly mapped to their true form.
* Fixed monster name mappings for RM and added some more colors to monster names.

### v9
* Support rm-ark v2 and HEM v0.9467.
* Customized names for newly added monster should now display correctly over networked games.
* Servers can now customize the placement of the tracker via `hpbar_tracker_x` and `hpbar_tracker_y` to prevent overlapping with other HUD elements.

### v8
* Support for ILCA v1.5.
* Move actor display name and boss from hardcoded mapping to CVar based mapping. See CVar section for details.
* The tracker now shows the invulnerability state of the monster.
* Removed `hpbar_min_maxhp`.
* `hpbar_server_min_maxhp` is renamed to `hpbar_threshold`.
* `hpbar_server_tracker_threshold` is renamed to `hpbar_tracker_threshold`.

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
* Announcer sounds: Unreal Tournament (Epic Games)

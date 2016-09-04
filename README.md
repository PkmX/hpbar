# HPBar Addon

This mod shows HP bars and info about the target being aimed at.

It should work with all mods (sans those that come with their own HP bars) and provides special name handling for popular complex doom mods (LCA, RM, HAF, Ark, ILCA).

## Dependencies

* NewTextColors (This should be loaded automatically if you play on clusters like TSPG.)

## CVars

* `hpbar_min_maxhp` (user): Only show HP bars for monsters with more HP than this value. This can be useful to reduce visual clutter when fighting lots of monsters. The default is 0 so HP bars are shown for all targets.
* `hpbar_server_min_maxhp` (server): This is a server-wide variable that controls whether to send HP info to clients and essentially overrides a client's `hpbar_min_maxhp` if this value is higher. It can be used to reduce bandwidth usage. (default: 0)

## Source

https://github.com/pkmx/hpbar

## Credits

* Graphics for HP bar: Wrath of Cronos (Thetis)

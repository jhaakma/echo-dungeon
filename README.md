# Echo Dungeon

Echo Dungeon is a roguelike dungeon crawler where both the player and enemies use echolocation to navigate.

This page is currently a loose collection of ideas approximating a design document

## Features

### Procedurally Generated Dungeons
- Player starts at level ~20 and works his way up (See if this actually feels good when playing)
- Dungeons proc-genned using a walker to carve out tilesets
- Dungeons start out with very few enemies, but lots of hallways, in order to generate suspense
- Later dungeons have more enemies which become strong and better echolocators the further you get
- Aim for a few different "types" of level, distinguished by new tilesets, layouts, enemies etc
  - For example, "sewers" have long hallways, noisy rats, noisy water features
  - "Prison" has noisy hanging chains, prison cells with beds to hide under
  
### Enemies

#### Enemy Attributes
- Fidgitiness: how much an enemy moves about. Some enemies run around, some stay stationary when not disturbed
- Speed: Enemies have varying idle speed and chase speed
- Noise: Enemies have varying amplitudes of noise. This includes walking noise and vocalisations
- Hearing: Some enemies can hear very well, others won't hear you until you are very close

#### Enemy Types

##### Slime
- Fidgitiness: low
- Speed: very low
- Noise: medium
- Hearing: very low

Slimes are slow and hard of hearing. They aren't very noisy though so they can sneak up on you.



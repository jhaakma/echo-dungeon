# Echo Dungeon

Echo Dungeon is a roguelike dungeon crawler where both the player and enemies use echolocation to navigate.

This page is currently a loose collection of ideas approximating a design document

## Procedurally Generated Dungeons
- Player starts at level ~20 and works his way up (See if this actually feels good when playing)
- Dungeons proc-genned using a walker to carve out tilesets
- Dungeons start out with very few enemies, but lots of hallways, in order to generate suspense
- Later dungeons have more enemies which become strong and better echolocators the further you get
- Aim for a few different "types" of level, distinguished by new tilesets, layouts, enemies etc
  - For example, "sewers" have long hallways, noisy rats, noisy water features
  - "Prison" has noisy hanging chains, prison cells with beds to hide under
  
## Enemies

### Enemy Attributes
- Fidgitiness: how much an enemy moves about. Some enemies run around, some stay stationary when not disturbed
- Idle Speed: How fast an emey walks
- Run Speed: How fast an enemy runs when pursuing the player, or how fast passive enemies run from predators
- Walk Noise: How loud an enemy is when walking
- Vocalisation Noise: How loudly an enemy vocalises (screams, clicks, chatter etc)
- Hearing: Some enemies can hear very well, others won't hear you until you are very close

### Enemy Types

#### Slime
- Fidgitiness: low
- Walk Speed: very low
- Run Speed: very low
- Walk Noise: medium
- Vocalisation Noise: low
- Hearing: very low

Slimes are slow and hard of hearing. They aren't very noisy though so they can sneak up on you.

Ability: Duplicate - Splits into two slimes when struck with a weapon or stone

#### Troll
- Fidgitiness: low
- Walk Speed: low
- Run Speed: low
- Walk Noise: medium
- Vocalisation Noise: medium
- Hearing: low

Trolls are big, dumb, slow and hard of hearing. They also make a fair bit of noise so are easy to avoid. However, beware their ability to stun their targets by smashing the ground (this also generates a lot of noise which can attract even more unwanted attention). 

Ability: Ground Smash - Stuns nearby creatures/player and generates a large sound wave

#### Goblin
- Fidgitiness: medium
- Walk Speed: low
- Run Speed: medium
- Walk Noise: medium
- Vocalisation Noise: high
- Hearing: medium

Goblins travel in packs and can be very dangerous if they spot you. Luckily, they are not the best listeners, prefering instead to talk - loudly. Because of how much noise they make, they tend to be easy to avoid.

Ability: Battle Cry - Screams to alert nearby goblins to join the chase

#### Spider
- Fidgitiness: high
- Walk Speed: high
- Run Speed: high
- Walk Noise: high
- Vocalisation Noise: high
- Hearing: very low

Spiders are fast and unpredictable. They move around a lot and make a lot of noise. Fortunately they are almost completely deaf, they can only detect the player at very close distances from the vibrations felt by their feet. Your best hope is to just run for it when these things approach.

Ability: Web - occasionally spins a web which takes up one tile and slows down anything that passes through, in addition to dampening any sound passing through it

#### Werebat
- Fidgitiness: medium
- Walk Speed: low
- Run Speed: medium
- Walk Noise: low
- Vocalisation Noise: very high
- Hearing: very high

Werebats have incredibly good hearing, and make loud clicks and screeches to seek out their prey. While this might make them easy to detect from a distance, if you can hear them there's a good chance that they can already "see" you.

Ability: Swoop - Allows the bat to travel a great distance without making any sound



### Passive Creatures
Passive creatures make noise which could potentially alert dangerous enemies.

#### Bat
- Fidgitiness: medium
- Walk Speed: medium
- Run Speed: medium
- Walk Noise: low
- Vocalisation Noise: high
- Hearing: very high

#### Rat
- Fidgitiness: high
- Walk Speed: high
- Run Speed: high
- Walk Noise: medium
- Vocalisation Noise: medium
- Hearing: medium

### Sound Generators
Environmental objects which generate sounds, either on their own or when mobs move across them
- Water drips - periodic sounds
- Swinging chains - periodic sounds that continues after walking across
- Puddles - splashing sound when walked across


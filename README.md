# SimpleGame
Text based dungeon crawler started as practice for Ruby.

## TO PLAY
Download the .zip file.
Extract to desktop
open Terminal or Command prompt
(without the < >)
type <cd Desktop>
type <cd SimpleGame>
type <ruby BaseGame.rb>

## Template for adding things
# check this before adding stuff
-Templates.rb

### Things to be worked on.
- Roll.room_content
- Flow combat with status effects
- Make armor
- Create basegame 'cleanup' function
- Make inventory limit
- Fix bug where total inventory counts different items and not total items, should I give each item a weight value?
- Expand Item list
- Module-ize items more? 'drinkable' 'throwable' 'wearable'? or stick more with inheritance?
- Expand monster list
- Expand room content randomizer
- ~Better find item prompt~
- Reduce 'world initialized' messages
- Character creation, name and the like.
- Death message
  - "Oh dear, it seems you are dead. Enjoy the afterlife!" (M)
- ASCII art?
  - Use this link (or similar) to cp ASCII art into the game http://www.chris.com/ascii/
- More detailed room descriptors
- Fork dungeon? left, right, etc.
  - Alternatively, N, S, E, W, which is what Zork uses (M)
- Gets harder as you go on
- Add traps.
- Add currency
- Add shop
- Add NPCs
- Add Classes
  - would we want to limit what items can be used by which classes? (M)
- Add Magic
- Add Saves
- Add tetanus/poison attributes for weapon, monster, combat
- Re-do object/monster randomization by creating an Hash tree of inheritance for each class Item{Potion: [HealthPotion, FirePotion], Weapon: [ShortSword, Bludgeon]} etc. Better referencing of "Get me a Potion" kind of calls. Access to each class from one central hash.

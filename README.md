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

### Things to be worked on.
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
- ASCII art?
- More detailed room descriptors
- Fork dungeon? left, right, etc.
- Gets harder as you go on
- Add traps.
- Add currency
- Add shop
- Add NPCs
- Add Classes
- Add Magic
- Add Saves
- Add tetanus/poison attributes for weapon, monster, combat
- Re-do object/monster randomization by creating an Hash tree of inheritance for each class Item{Potion: [HealthPotion, FirePotion], Weapon: [ShortSword, Bludgeon]} etc. Better referenceing of "Get me a Potion" kind of calls. Access to each class from one central hash.

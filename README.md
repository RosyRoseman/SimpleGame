# SimpleGame
Text based dungeon crawler started as practice for Ruby.

## TO PLAY
if os == osX || Linux
Download the .zip file.
Extract to desktop
open Terminal or Command prompt
(without the < >)
type <cd Desktop>
type <cd SimpleGame>
type <ruby Game.rb>
elseif os == Windows
just download the zip and double click the .exe and you should be good
end

## Template for adding things
# check this before adding stuff
-Templates.rb

### Things to be worked on.
- Flow combat with status effects
- Make armor
- Make inventory limit
- Fix bug where total inventory counts different items and not total items, should I give each item a weight value?
- Expand Item list
- Expand monster list
- Expand room content randomizer
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

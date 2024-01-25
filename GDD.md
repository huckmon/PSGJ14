# Escape the Swarm - Design Document

## Introduction

### Game Summary
Escape the Swarm is a Top-Down Action game about delving into a labyrinth in order to escape a rapid spreading swarm of carnivorous insects. 
### Inspiration
#### Dino run
Dino run's "wall of doom" heavily inspires the game's ever expanding swarm attempting to kill the player, including proximity based visual an audio effects. The wall of doom also forces players to complete levels fast and removes the opportunity to take their time and experiment in the level.
#### Splunky
Splunky's lack of combat removes a mechanic that is generally expected from most games with damaging enemies and changes the approach taken to the game.
### Player Experience
In each level (or floor) players are required to out run a ever increasing swarm that forces them into the directions of traps and enemies in order to reach a staircase to proceed to the next level.
### Platform
This game is developed to be released on Windows PC and Linux X11 based systems
### Development Software
- Godot 4.1 game engine
- GIMP 2.1 for graphics
- Audacity for minor SFX editing
- Famistudio for custom SFX creation
### Genre
Single player, Action
### Target Audience
The target audience of the game is intended to be a more casual set of gamer who are up for navigating difficult level layouts.
## Concept
### Gameplay overview	
The player controls a simple humanoid character from a top down perspective that can move in all four cardinal directions. The player character must navigate through a dungeon in order to escape a rapidly growing swarm of carnivorous insects. Obstacles and more conventional enemies are placed in the path of players forcing them to navigate around them while managing their distance from the swarm.
### Theme Interpretation (It's Spreading)
"**It's Spreading**" - *This theme centers around making a mechanic or narrative that consumes or expands in some way. Things like a pandemic, zombie apocalypse, idea, or bagel toppings come to mind. Be creative with it and work it into something unique and unexpected. Themes are there to get you to think outside the box!*

The theme of spreading was used to create a game mechanic that forces the player to move forwards towards the end of the level or a floor and places a timer of sorts on how long they have to complete the level. **The player must outrun a spreading swarm of insects to survive and complete levels**.
### Primary Mechanics

#### The Swarm
A growing and moving enemy that kills the player on contact.
#### Staircase
Act as the method of reaching the next floor/level.
#### Spike traps
Spike traps activate and kill the player on contact.
#### Dash enemy
Enemies will have an effect to show that they've detected the player before dashing at them to damage the player on contact.
### Secondary Mechanics
## Art
### Theme Interpretation

### Design
Most of the art design of the game was kept to a simple format in the form of 16bit pixel art relying on simple imagery to convey graphics. The only differing design is the swarm uses a noise map in order to give a buzzing effect which would be difficult to design with 16bit textures and animations.
## Audio
### Sound Effects
To add feedback and weight to actions, a mix of sound effects are used. Most of the used sound effects are chiptune style tracks. 
## Game Experience
### Controls
#### Keyboard and mouse
WASD
#### Controller
D-pad
## Development Timeline
| Assignment | Status | Due date |
| ---- | ---- | ---- |
| Design Document | Complete | 15/01 |
| Functional Player character | Complete | 24/01 |
| Functional Swarm component | Complete | 24/01 |
| Functional Spikes | Complete | 24/01 |
| Functional Enemy | Complete | 24/01 |
| All art assets | Complete | 24/01 |
| Sound effects | Complete | 24/01 |
| Animations | Complete | 24/01 |
| Level designs | Complete | 24/01 |
| Menu, death, end and intermission screens | Complete | 24/01 |
| Audio and fullscreen options | Complete | 24/01 |
| Submit | Complete | 25/01 |
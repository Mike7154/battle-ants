# Ant Colony Battle — Game Guide

A browser-based battle simulation game built entirely in **SVG + vanilla JavaScript**, with no external dependencies. Download the standalone HTML file, double-click it, and it runs in any browser — no server needed.

---

## What the Game Is

Ant Colony Battle is a tower-defense–style autobattler. Two sides fight across a grid: your **ants** spawn on the right and march left, while the enemy **bugs** (termites and friends) spawn on the left and march right. When opposing units meet, they lock into automatic combat and trade damage until one side falls.

You don't control units directly in the fight. Your job is **economy and deployment**: earn cents, decide which units to buy, and evolve them into stronger forms to overwhelm the enemy line.

- **Rendering:** Every unit is hand-drawn SVG body art generated inline in JavaScript.
- **Battlefield:** A 27×7 grid. Ants move left, bugs move right.
- **Feel:** Warm, light "cream and card" page styling with a title and quick instructions up top.

---

## How to Play

1. **Watch your cents.** You start with **100¢**. You earn **+25¢ passively every 2 seconds**, plus a **bounty every time you kill an enemy bug**. There is no manual "collect" button — you can't hand yourself free money.
2. **Spawn units.** Click a unit's slot to deploy it onto the grid (if you can afford it). If you don't have enough cents, the counter flashes red.
3. **Evolve your units.** Each ant line has **Up** and **Down** buttons to move it forward or backward through its evolution stages. The stage you pick **persists across spawns** and updates the unit's name tag and stats — but the **purchase price stays the same** regardless of stage.
4. **Let combat resolve.** Units automatically seek the nearest enemy, converge, and attack on a timer (~every 0.6s once in range). Health bars drain and change color (green → orange → red) as units take damage.
5. **Collect bounties and reinvest.** Killing bugs pays cents. Use the income to field stronger ants and push toward the top-tier evolutions.

### Layout
The playable UI has the **battle grid on top**, then an **Ants section** and a **Bugs section**, each laid out as **two rows of five unit cards**.

---

## Economy Summary

| Source | Amount |
|---|---|
| Starting cents | 100¢ |
| Passive income | +25¢ every 2 seconds |
| Kill bounties | 50¢ up to 10,000¢ depending on the bug |
| Self-funding | Not allowed (no manual collect) |

---

## The Ant Roster (Your Side)

Ten unit lines, most with a three-stage evolution chain. Price is paid once and never changes with stage. Confirmed stats are shown where specified during the build; some later lines follow the same escalating pattern.

### 1. Ant — 50¢
`Ant → Buff ant → Big buff ant`
- Ant: 200 HP, 50 dmg
- Big buff ant: 400 HP, 200 dmg

### 2. Worker ant — 100¢
`Worker ant → Manager ant → CEO ant`
- Worker: 5,000 HP, 10 dmg (a tank with a builder helmet)
- CEO ant: 10,000 HP, 20 dmg

### 3. Soldier ant — 200¢
`Soldier ant → General ant → Mecha ant`
- Soldier: 800 HP, 200 dmg (curved mandibles)
- Mecha ant: 1,600 HP, 400 dmg

### 4. Tall ant — 400¢
`Tall ant → Daddy long legs ant → Centipede ant`
- Tall: 1,600 HP, 400 dmg (long legs)
- Daddy long legs: 2,400 HP, 600 dmg
- Centipede ant: 3,200 HP, 800 dmg

### 5. Butterfly ant — 650¢
`Butterfly ant → Pterodactyl ant → Planet consumer ant`
- Butterfly: 2,600 HP, 650 dmg
- Pterodactyl: 3,900 HP, 975 dmg
- Planet consumer: 5,200 HP, 1,300 dmg

### 6. Fast ant
A speed-focused line (moves quickly across the grid).

### 7. Fish ant — 800¢
`Fish ant → Whale ant → Kraken ant`
- Fish: 3,200 HP, 800 dmg
- Whale: 4,800 HP, 1,200 dmg
- Kraken ant: 6,400 HP, 1,600 dmg

### 8. Fire ant
A fire-themed line.

### 9. Titan ant
A heavy, high-end line.

### 10. Zombie ant — the nine-stage endgame line
The deepest evolution chain in the game, escalating into cosmic power:

`Zombie ant → Skeleton ant → Death ant → Colossal death ant → Demonic death ant → 5th dimension ant → 10th dimension ant → 100th dimensional ant → Creator of all ants`

- Zombie ant: 20,000 HP, 5,000 dmg (rotting green)
- Skeleton ant: bone-white, ribs showing
- Death ant: black with a glowing red eye and a scythe hint
- Colossal death ant: bigger, horned, purple-black
- Demonic death ant: fiery red-black with wings
- 5th dimension ant: translucent purple with a glowing halo ring
- 10th dimension ant: cosmic blue with triple rings
- 100th dimensional ant: prismatic white with rainbow rings
- **Creator of all ants: 320,000 HP, 80,000 dmg** — radiant gold with a crown, the single most powerful unit in the game

---

## The Bug Roster (Enemy Side)

Ten enemy units. All are **free to spawn**, have **no evolution stages**, and each pays a **kill bounty** when destroyed. Bounties scale up dramatically with the tougher bugs.

| Bug | Kill Bounty | Notes |
|---|---|---|
| Termite | +50¢ | The basic enemy |
| Caterpillar | +100¢ | 3,750 HP, 7 dmg — slow and tanky |
| Worm | +200¢ | |
| Baby spider | +400¢ | |
| Cockroach | +500¢ | |
| Grasshopper | +650¢ | |
| Frog | +800¢ | |
| Lizard | +1,000¢ | |
| Bird | +1,300¢ | |
| Ant eater | +10,000¢ | 240,000 HP, 60,000 dmg — the enemy boss and richest bounty by far |

---

## Combat Mechanics (Under the Hood)

- **Targeting:** Each unit continuously scans for the nearest enemy and moves toward it. With no enemy in range, it keeps advancing in its team's direction (ants left, bugs right).
- **Attack range:** Units engage once they're within ~20px of a target.
- **Attack timer:** A unit deals its damage roughly every 600ms once in range.
- **Health bars:** Drain as HP drops and shift color from green to orange to red. The body briefly flashes on each hit.
- **Death:** At 0 HP a unit fades out and is removed; if it's an enemy bug, its bounty is paid to you.
- **Game loop:** A `requestAnimationFrame` tick updates movement, targeting, and combat every frame, scaled by delta time.

---

## Design Philosophy

The game was built through rapid, iterative passes — one or two changes per instruction — growing organically from a small 5-unit prototype into a 20-slot roster with deep evolution chains and a full economy. Power levels intentionally escalate across a huge range, from a humble 50-damage ant all the way up to the 80,000-damage Creator of all ants and the 60,000-damage Ant eater boss.

---

*This guide reflects the current state of the game as built. Exact stats for the Fast ant, Fire ant, and Titan ant lines follow the same escalating pattern as the other units.*

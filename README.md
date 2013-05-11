Conway's Game of Life
=====================

[Rules](http://coderetreat.org/gol)

Live cell represents as `Cell.new(x,y)`

Dead cell represents as empty

```Ruby
next_generation_world = World.new(Cell.new(0,0), Cell.new(1,1)).next_gen
```

To render the world for each generation, just loop through `world.cells` and plot each live `cell` at `(cell.x, cell.y)`

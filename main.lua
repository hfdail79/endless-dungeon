local Map = require 'core/map'
love.graphics.setDefaultFilter('nearest', 'nearest')
local Util = require 'core/util'
function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-2/dc-mon/glowing_shapeshifter.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  secretpath = love.graphics.newImage('assets-2/dc-dngn/gateways/stone_stairs_down.png')
  statue = love.graphics.newImage('assets-1/dungeon/statues/statue_angel.png')
  grass = love.graphics.newImage('assets-2/dc-dngn/floor/grass/grass_flowers_yellow1.png')
  limestone = love.graphics.newImage('assets-1/dungeon/floor/limestone_1.png')

  mapTemplate = {
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    
  }

  map = Map:new(mapTemplate)
end




function love.update(dt)
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    y = y + 1
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 1
  end
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    x = x + 1
end
if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
  x = x - 1
end
 -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
 if cc(x, y, w, h,   0, 0, 64, 64) then  
  -- if true, decrease HP:
  hp = hp - 1
end
end


function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(grass, 513, 258, 0, 2)
  love.graphics.draw(grass, 513, 333, 0, 2)
  love.graphics.draw(grass, 449, 193, 0, 2)
  love.graphics.draw(grass, 385, 193, 0, 2)
  love.graphics.draw(grass, 322, 193, 0, 2)
  love.graphics.draw(grass, 258, 193, 0, 2)
  love.graphics.draw(grass, 258, 258, 0, 2)
  love.graphics.draw(grass, 258, 322, 0, 2)
  love.graphics.draw(grass, 513, 322, 0, 2)

  love.graphics.draw(secretpath, 400, 270)
  love.graphics.draw(statue, 385, 250, 0, 2)
  love.graphics.draw(playerImg, x, y)
 
   -- Draw the rectangle in the upper left corner
   love.graphics.rectangle('line', 0, 0, 64, 64)

   -- Print the player's HP in the top left corner
   love.graphics.print(hp, 0, 0)
end

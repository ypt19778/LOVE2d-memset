thing = require "lib"

function love.load()
    thing:init(love.graphics.getHeight(), love.graphics.getWidth())
    px, py, pw, ph = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 100, 100
    ps = 100
end

function love.update(dt)
    if love.keyboard.isDown("w") then
        py = py - ps * dt
    elseif love.keyboard.isDown("a") then
        px = px - ps * dt
    elseif love.keyboard.isDown("s") then
        py = py + ps * dt
    elseif love.keyboard.isDown("d") then
        px = px + ps * dt
    end
end

function love.draw()
    thing:start()
    love.graphics.rectangle("line", px, py, pw, ph)
    thing:finish()
end
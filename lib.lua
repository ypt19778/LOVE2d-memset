local Lib = {
    gameWidth = 0,
    gameHeight = 0,
    canvas = nil
}

-- put in a reqire at the top of conf otherwise it WONT WORK
function Lib:conf(t)
    t.window.vsync = 0
    t.window.msaa = 0
    t.window.highdpi = false
end

function Lib:init(w, h)
    self.gameWidth = w
    self.gameHeight = h
    
    self.canvas = love.graphics.newCanvas(w, h)
    
    love.graphics.setDefaultFilter("nearest", "nearest")
    self.canvas:setFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")
end

function Lib:start()
    love.graphics.setCanvas(self.canvas)
    love.graphics.clear(0, 0, 0, 1)
end

function Lib:finish()
    love.graphics.setCanvas()
    
    local windowW, windowH = love.graphics.getDimensions()

    local scale = math.max(1, math.floor(math.min(windowW / self.gameWidth, windowH / self.gameHeight)))
    
    local offsetX = math.floor((windowW - (self.gameWidth * scale)) / 2)
    local offsetY = math.floor((windowH - (self.gameHeight * scale)) / 2)
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.canvas, offsetX, offsetY, 0, scale, scale)
end

function Lib:renderSafe(drawFunc)
    love.graphics.push()
    love.graphics.translate(0, 0) 
    drawFunc()
    love.graphics.pop()
end

return Lib
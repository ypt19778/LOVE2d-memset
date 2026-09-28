local LIB = {screenWidth = nil, screenHeight = nil}

function LIB:setScreenDimensions(w, h)
    LIB.screenWidth, LIB.screenHeight = w, h
end

function LIB:init()
    self.canvas = love.graphics.newCanvas(canv_w, canv_h)
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")
    self.imageData = love.image.newImageData(self.screenWidth, self.screenHeight)
    self.texture = love.graphics.newImage(self.imageData)
end

function LIB:drawPixel(x, y, r, g, b)
    x, y = math.floor(x), math.floor(y)
    if x >= 0 and x < self.screenWidth and y >= 0 and y < self.screenHeight then
        imageData:setPixel(x, y, r, g, b, 1)
    end
end

function LIB:update()
    self.imageData:mapPixel(function() return 0, 0, 0, 1 end)

    for i = 0, self.screenWidth, 4 do
        for y = 0, screenHeight do
            drawPixel(i, y, 1, 1, 1)
        end
    end
end

function LIB:draw()
    self.texture:replacePixels(self.imageData)
    
    local scaleX = love.graphics.getWidth() / self.screenWidth
    local scaleY = love.graphics.getHeight() / self.screenHeight
    
    love.graphics.draw(self.texture, 0, 0, 0, scaleX, scaleY)
end

return LIB
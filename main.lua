local game = require("src")

function love.load()
    game.load()
end

function love.update(dt)
    game.update(dt)
end

function love.draw()
    game.draw()
end

function love.keypressed(key)
    game.keypressed(key)
end

function love.mousepressed(x, y, button, istouch, presses)
    game.mousepressed(x, y, button, istouch, presses)
end

function love.mousereleased(x, y, button, istouch, presses)
    game.mousereleased(x, y, button, istouch, presses)
end
function love.wheelmoved(x, y)
    game.wheelmoved(x, y)
end

function love.mousemoved(x, y, dx, dy, istouch)
    game.mousemoved(x, y, dx, dy, istouch)
end

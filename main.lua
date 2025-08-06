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

function love.focus(f)
    game.focus(f)
end

function love.quit()
    game.quit()
end

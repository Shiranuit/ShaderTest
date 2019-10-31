local shader = {}

function love.load()
    local shaderCode = love.filesystem.read("shader.glsl")
    shader = love.graphics.newShader( shaderCode )
    shader:send("size", {love.graphics.getWidth(), love.graphics.getHeight()})
    love.graphics.setShader(shader)
end

function love.update(dt)
    shader:send("time", os.clock())
end

function love.draw()
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

function love.keypressed(key)
    if key == " " then
        if shader then
            shader:destroy()
            local shaderCode = love.filesystem.read("shader.glsl")
            shader = love.graphics.newShader( shaderCode )
        end
    end
end
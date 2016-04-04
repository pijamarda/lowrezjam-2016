--Configuration
function love.conf(t)
	t.tittle = "Low Rez Jam 2016 - Fer's Challenge"
	t.version = "0.10.1"
	t.window.width = 480
	t.window.height = 480

	--esto lo agrego yo porque si
	t.modules.joysticj = false
	t.modules.physics = false

	--para debugear en Windows
	t.console = true
end
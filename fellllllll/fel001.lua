--  
--   ////\\\\
--   ////\\\\  evancook.audio
--   ////\\\\  presents
--   \\\\////
--   \\\\////  fellllllll
--   \\\\////
--

local viewport = { width = 128, height = 64 }
local focus = { x = 0, y = 0 }

-- Main

function init()
  -- Render Style
  screen.level(15)
  screen.aa(0)
  screen.line_width(1)
  mode = 0 
  -- Center focus
  reset()
  -- Render
  redraw()

end

function reset()
  print('reset')
  focus.x = viewport.width/2
  focus.y = viewport.height/2
end

-- Interactions

function key(id,state)
  print('key',id,state)
  if (id == 3) and (state==1) then
   mode = 1
   print('mode',mode, state)
   redraw()
  elseif (id==2) and (state==1) then
  mode = 2
   print('mode',mode, state)
   redraw()
  else
    mode = 0
    print('mode',mode, state)
  redraw()
  end
end

-- Render

function draw_frame()
  screen.rect(1, 1, viewport.width-1, viewport.height-1)
  screen.stroke()
end

function drawCirc()
  screen.circle(viewport.width/2, viewport.height/2,4)
  screen.stroke()
end

function redraw()
  screen.clear()
  if mode == 1 then
    screen.display_png("/home/we/dust/code/fellllllll/catRight.png", 0, 0)
  elseif mode == 0 then
    screen.clear()
    screen.display_png("/home/we/dust/code/fellllllll/catUp.png", 0, 0)
  elseif mode == 2 then
    screen.display_png("/home/we/dust/code/fellllllll/catLeft.png", 0, 0)
    
  end
  --draw_crosshair()
  screen.update()
 
end

-- Utils

function clamp(val,min,max)
  return val < min and min or val > max and max or val
end

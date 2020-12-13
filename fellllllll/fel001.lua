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

  two = false
  three = false

  -- Render
  redraw()

end

-- Interactions

function key(id,state)
  print('key',id,state)
  
  --if key3 is pressed, set the boolean flag for 3 to true
  if (id == 3) and (state==1) then
   three = true
   redraw()
   
  --elseif key2 is pressed, set the boolean flag for 2 to true
  elseif (id==2) and (state==1) then
  --mode = 2
   two = true
   redraw()
  
  --elseif key2 and key 3 are pressed
  --set the boolean flag for 2 to true and...
  --set the boolean flag for 3 to true 
  elseif ((id==2) and (state==1)) and ((id == 3) and (state==1)) then 
    two = true
    three = true
    redraw()
  --else set boolean flags for keys to false.
  else
    two = false
    three = false
    redraw()
  end
end

-- Render


function redraw()
  screen.clear()
  
  --if both key 2 and key 3 are pressed, display the image with both paws down
  --also print that both keys are pressed
  if two and three then
    screen.display_png("/home/we/dust/code/fellllllll/catBoth.png", 0, 0)
    print('both on')
    
  --elseif key 3 is pressed, display the image with the right paw down
  elseif three and not two then
  --if mode == 1 then
    screen.display_png("/home/we/dust/code/fellllllll/catRight.png", 0, 0)
    
  --else if no key is pressed, display the image with the both paws up
  
  elseif not two and not three then
    screen.clear()
    screen.display_png("/home/we/dust/code/fellllllll/catUp.png", 0, 0)
    
  elseif two then
  --else if key 2 is pressed, display the image with the left paw down
    screen.display_png("/home/we/dust/code/fellllllll/catLeft.png", 0, 0)
  
  end
  screen.update()
end

-- Utils

function clamp(val,min,max)
  return val < min and min or val > max and max or val
end

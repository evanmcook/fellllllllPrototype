--   ^__^
--  ( o.o ) fellllllll v1.1
--    =^=  
--          by evancook.audio
--          k2 for left paw, 
--          k3 for right paw
--  original art by
--  ko-fi.com/arogue

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
  
  --change softcut's rate from 0 to 1 to ensure playback
  softcut.rate(1, 1)

  -- Render
  redraw()

end

-- Interactions

function key(id,state)
  print('key',id,state)
  
  --if key3 is pressed, set the boolean flag for 3 to true (and call a drum to play)
  if (id == 3) and (state==1) then
   three = true
   redraw()
   rightDrum()
   
  --elseif key2 is pressed, set the boolean flag for 2 to true
  elseif (id==2) and (state==1) then
  --mode = 2
   two = true
   redraw()
   leftDrum()
  
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

-- Audio
function rightDrum()
  
--read the file-to-be-played into softcut's buffer
softcut.buffer_read_mono("/home/we/dust/audio/common/808/808-CP.wav", 0, 0, -1, 1, 1)
--set voice enable of voice 1 to 'on'
softcut.enable(1,1)
--set voice 1's buffer to buffer 1
softcut.buffer(1,1)
--set the output level of voice 1 to 1.0
softcut.level(1,1.0)
--set loop mode of voice 1 to on. unclear why the setting the second 1 to 0 means silence.
softcut.loop(1,1)
--set the loop start point of voice 1 to 1 sec
softcut.loop_start(1,1)
--set the loop end point of voice 1 to 2 sec
softcut.loop_end(1,2)
--set the location of the playhead for voice 1 to 0sec
softcut.position(1,0)
--turn the play status of voice 1 on
softcut.play(1,1)

end

function leftDrum()
    
--read the file-to-be-played into softcut's buffer. 
-- filename,start time of file, start of buffer to write in to 
softcut.buffer_read_mono("/home/we/dust/audio/common/808/808-CH.wav", 0, 3, -1, 1, 1)
--set voice enable of voice 1 to 'on'
softcut.enable(1,1)
--set voice 1's buffer to buffer 1
softcut.buffer(1,1)
--set the output level of voice 1 to 1.0
softcut.level(1,1.0)
--set loop mode of voice 1 to on. unclear why the setting the second 1 to 0 means silence.
softcut.loop(1,1)
--set the loop start point of voice 1 to 1 sec
softcut.loop_start(1,1)
--set the loop end point of voice 1 to 2 sec
softcut.loop_end(1,2)
--set the location of the playhead for voice 1 to 3sec
softcut.position(1,3)
--turn the play status of voice 1 on
softcut.play(1,1)
end

-- Utils

function clamp(val,min,max)
  return val < min and min or val > max and max or val
end

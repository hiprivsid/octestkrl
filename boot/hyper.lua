_G._OSVERSION = "Octestkrnl codename Hyper"

local component  = component
local computer = computer
local unicode = unicode

-- Init GPU

computer.beep(1000)
local w, h
local screen = component.list("screen", true)()
local gpu = screen and component.list("gpu", true)()
if gpu then
  gpu = component.proxy(gpu)
  if not gpu.getScreen() then
    gpu.bind(screen)
  end
  _G._boot_screen = gpu.getScreen()
  w, h = gpu.maxResolution()
  gpu.setBackground(0x000000)
  gpu.setForeground(0xE6E6E6)
  gpu.fill(1, 1, w, h, "")
end

-- Start display

local y = 1
local function status(msg)
  if gpu then
    gpu.set(1, y, msg)
    if y == h then 
      gpu.copy(1, 2, w, h -1, 0, -1)
      gpu.fill(1, h, w, 1, "")
    else
      y = y + 1
    end
  end
end



-- Booting Kernel

status(_G._OSVERSION)
status("Total ram:")
computer.totalMemory()
gpu.setForeground(0xF24B00)
status("Nothing to do")
gpu.setForeground(0xE6E6E6)






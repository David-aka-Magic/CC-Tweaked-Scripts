local inputSide = "left"
local outputSide = "right"
local delay = 5 -- in seconds, can be adjusted as needed
local pulseDuration = 1 -- in seconds can do sub-second precision if needed
local ready = true
 
print("Redstone Pulse Delay")
print("Input: "..inputSide)
print("Output: "..outputSide)
print("Delay: "..delay.."s")
print("Pulse: "..pulseDuration.."s")
 
while true do
    os.pullEvent("redstone")
    
    if ready and redstone.getInput(inputSide) then
        ready = false
        
        print("Pulse detected! Waiting "..delay.." seconds...")
        sleep(delay)
        
        redstone.setOutput(outputSide, true)
        print("Output ON")
        sleep(pulseDuration)
        redstone.setOutput(outputSide, false)
        print("Output OFF")
        
        ready = true
    end
end

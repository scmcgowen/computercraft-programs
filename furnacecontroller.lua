local f1 = peripheral.find("minecraft:furnace")
local sb = peripheral.find("minecraft:ironshulkerbox_diamond")

while true do
    os.pullEvent("redstone")
    if rs.getInput("left") then
       local itemList = sb.list()
       for i,item in ipairs(itemList) do
           if item.name == "minecraft:gold_ore" or item.name == "minecraft:iron_ore" then
               f = sb.pushItems(peripheral.getName(f1),i,64,1) 
               sleep(f * 10)
               sb.pullItems(peripheral.getName(f1),3)
           end
       end
    elseif rs.getInput("top") then
        itemList = sb.list()
        for i,item in ipairs(itemList) do
            if item.name == "minecraft:coal" then
                sb.pushItems(peripheral.getName(f1),i,64,2)
                break
            end
        end
    end
end
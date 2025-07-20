local sides = {
    "top",
    "bottom",
    "front",
    "back",
    "left",
    "right"
}

local function getPeripheralsByType(type)
    local peripherals = {};

    for _, side in ipairs(sides) do
        if peripheral.getType(side) == type then
            peripherals[side] = peripheral.wrap(side)
        end
    end

    return peripherals
end

local modems = getPeripheralsByType("modem")
print("Found modems: " .. #modems)
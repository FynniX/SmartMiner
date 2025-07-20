local Rednet = {}
Rednet.__index = Rednet

function Rednet:new(protocol)
    local obj = setmetatable({}, Rednet)
    obj.protocol = protocol
    return obj
end

function Rednet:Open()
    peripheral.find("modem", rednet.open)
end

function Rednet:Close()
    rednet.close()
end

function Rednet:Send(target, message, protocol)
    rednet.send(target, message, protocol or self.protocol)
end

function Rednet:Broadcast(message, protocol)
    rednet.broadcast(message, protocol or self.protocol)
end

function Rednet:Receive(protocol, timeout)
    local id, message, protocol = rednet.receive(protocol or self.protocol, timeout)

    if not id then
        error("No message received within the timeout period.")
    end

    return id, message, protocol
end

return Rednet

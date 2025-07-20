local protocol = "smart_miner"

function RednetOpen()
    print("Opening rednet...")
    peripheral.find("modem", rednet.open)

    if rednet.isOpen() then
        print("Success.")
    else
        error("Failed.")
    end
end

function RednetClose()
    print("Closing rednet...")
    rednet.close()

    if not rednet.isOpen() then
        print("Success.")
    else
        error("Failed.")
    end
end

function RednetSend(recipient, message)
    if not rednet.isOpen() then
        error("Rednet is not open. Please open it first.")
    end
    
    rednet.send(recipient, message, protocol)
end

function RednetBroadcast(message)
    if not rednet.isOpen() then
        error("Rednet is not open. Please open it first.")
    end
    
    rednet.broadcast(message, protocol)
end

function RednetReceive()
    if not rednet.isOpen() then
        error("Rednet is not open. Please open it first.")
    end
    
    local id, message, protocol = rednet.receive(protocol)
    
    if id then
        return id, message, protocol
    else
        error("No message received.")
    end
end
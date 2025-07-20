Vec3 = { x = 0, y = 0, z = 0 }

function Vec3:new(o, x, y, z)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.x = x or 0
    self.y = y or 0
    self.z = z or 0
    return o
end

function Vec3:x()
    return self.x
end

function Vec3:y()
    return self.y
end

function Vec3:z()
    return self.z
end

function Vec3:Add(v)
    self.x = self.x + v.x
    self.y = self.y + v.y
    self.z = self.z + v.z
end

function Vec3:Sub(v)
    self.x = self.x - v.x
    self.y = self.y - v.y
    self.z = self.z - v.z
end

function Vec3:Mul(v)
    self.x = self.x * v.x
    self.y = self.y * v.y
    self.z = self.z * v.z
end

function Vec3:Div(v)
    self.x = self.x / v.x
    self.y = self.y / v.y
    self.z = self.z / v.z
end
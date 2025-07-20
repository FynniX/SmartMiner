local Vec3 = {}
Vec3.__index = Vec3

function Vec3:new(x, y, z)
    local obj = setmetatable({}, Vec3)
    obj.X = x or 0
    obj.Y = y or 0
    obj.Z = z or 0
    obj.Magnitude = math.sqrt(obj.X^2 + obj.Y^2 + obj.Z^2)

    if obj.Magnitude == 0 then
        obj.Unit = nil;
    elseif obj.Magnitude == 1 then
        obj.Unit = obj
    else
        obj.Unit = Vec3:new(obj.X / obj.Magnitude, obj.Y / obj.Magnitude, obj.Z / obj.Magnitude)
    end

    return obj
end

function Vec3:Abs()
    return Vec3:new(math.abs(self.X), math.abs(self.Y), math.abs(self.Z))
end

function Vec3:Ceil()
    return Vec3:new(math.ceil(self.X), math.ceil(self.Y), math.ceil(self.Z))
end

function Vec3:Floor()
    return Vec3:new(math.floor(self.X), math.floor(self.Y), math.floor(self.Z))
end

function Vec3:Cross(other)
    return Vec3:new(
        self.Y * other.Z - self.Z * other.Y,
        self.Z * other.X - self.X * other.Z,
        self.X * other.Y - self.Y * other.X
    )
end

function Vec3:Max(vector)
    return Vec3:new(
        math.max(self.X, vector.X),
        math.max(self.Y, vector.Y),
        math.max(self.Z, vector.Z)
    )
end

function Vec3:Min(vector)
    return Vec3:new(
        math.min(self.X, vector.X),
        math.min(self.Y, vector.Y),
        math.min(self.Z, vector.Z)
    )
end

function Vec3:__add(other)
    return Vec3:new(self.X + other.X, self.Y + other.Y, self.Z + other.Z)
end

function Vec3:__sub(other)
    return Vec3:new(self.X - other.X, self.Y - other.Y, self.Z - other.Z)
end

function Vec3:__mul(other)
    if type(other) == "number" then
        return Vec3:new(self.X * other, self.Y * other, self.Z * other)
    elseif type(other) == "table" then
        return Vec3:new(self.X * other.X, self.Y * other.Y, self.Z * other.Z)
    else
        error("Invalid type for multiplication: " .. type(other))
    end
end

function Vec3:__div(other)
    if type(other) == "number" then
        return Vec3:new(self.X / other, self.Y / other, self.Z / other)
    elseif type(other) == "table" then
        return Vec3:new(self.X / other.X, self.Y / other.Y, self.Z / other.Z)
    else
        error("Invalid type for division: " .. type(other))
    end
end

function Vec3:__tostring()
    return string.format("Vec3(%f, %f, %f)", self.X, self.Y, self.Z)
end

Vec3.zero = Vec3:new(0, 0, 0)
Vec3.one = Vec3:new(1, 1, 1)
Vec3.xAxis = Vec3:new(1, 0, 0)
Vec3.yAxis = Vec3:new(0, 1, 0)
Vec3.zAxis = Vec3:new(0, 0, 1)

return Vec3
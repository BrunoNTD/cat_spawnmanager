-- Variable's
local settings = getSettings ( );
local Class = { };

-- Class's
class 'Spawn Manager' {
    constructor = function (self)
        self.hospitals = { };
    end,

    onDeath = function (self)
        -- Set table's
        self.hospitals = settings.Positions;

        -- getHospital's
        local wakeUp = SpawnManager:getHospital(source);
        if not wakeUp then
            return false;
        end

        -- Spawn in next hospital's
        setTimer (function (element, wakeUp)
            -- Spawn's
            spawnPlayer (element, unpack (wakeUp.position));
            outputDebugString ('['..getResourceName (getThisResource ())..']: '..settings['Messages'].wakeupMessage:format(wakeUp.title), 4, 165, 58, 181);            

            -- Transport message's
            if settings['Proprieties'].takeMoney then
                takePlayerMoney (element, settings['Proprieties'].amountMoney);
                outputDebugString ('['..getResourceName (getThisResource ())..']: '..settings['Messages'].transportMessage:format(settings['Proprieties'].amountMoney), 4, 165, 58, 181);
            end

            -- Reset's
            self.hospitals = nil;
        end, settings['Proprieties'].timeWakeup * 1000, 1, source, wakeUp);
    end,

    getHospital = function (self, element)
        local x, y, z = getElementPosition (element);
        if (#self.hospitals == 0) then
            return false;
        end

        -- getNextHospital's
        table.sort (self.hospitals, function (a, b)
            return (Class['getDistanceBetweenPoints3D'] (x, y, z, unpack (a.position)) < Class['getDistanceBetweenPoints3D'] (x, y, z, unpack (b.position))); 
        end)

        return self.hospitals[1];
    end,
}
SpawnManager = new 'Spawn Manager' ( );

-- SpawnManager.event's
Class['SpawnManager.events'] = function (...)
    local Arguments = { ... };
    if eventName == 'onPlayerWasted' then
        SpawnManager:onDeath ( );
        return;
    end
end

-- getDistanceBetweenPoints3D's
Class['getDistanceBetweenPoints3D'] = function (x1, y1, z1, x2, y2, z2)
    local half2 = 1 / 2
    local vectorX, vectorY, vectorZ = x2 - x1, y2 - y1, z2 - z1
    return ((vectorX * vectorX) + (vectorY * vectorY) + (vectorZ * vectorZ)) ^ half2
end

-- Event's
addEventHandler ('onPlayerWasted', root, Class['SpawnManager.events']);
local types = {}

    --Tipos dos pokemons e suas propriedades
    types.Normal = {
        weakTo = {"Fighting"},
        resistantTo = {},
        immuneTo = {"Ghost"},
        superEffective = {},
        notVeryEffective = {"Rock", "Steel"},
        noEffect = {"Ghost"}
    }
    types.Fire = {
        weakTo = {"Water", "Ground", "Rock"},
        resistantTo = {"Fire", "Grass", "Ice", "Bug", "Steel", "Fairy"},
        immuneTo = {},
        superEffective = {"Grass", "Ice", "Bug", "Steel"},
        notVeryEffective = {"Fire", "Water", "Rock", "Dragon"},
        noEffect = {}
    }
    types.Water = {
        weakTo = {"Electric", "Grass"},
        resistantTo = {"Fire", "Water", "Ice", "Steel"},
        immuneTo = {},
        superEffective = {"Fire", "Ground", "Rock"},
        notVeryEffective = {"Water", "Grass", "Dragon"},
        noEffect = {}
    }
    types.Electric = {
        weakTo = {"Ground"},
        resistantTo = {"Electric", "Flying", "Steel"},
        immuneTo = {},
        superEffective = {"Water", "Flying"},
        notVeryEffective = {"Electric", "Grass", "Dragon"},
        noEffect = {"Ground"}
    }
    types.Grass = {
        weakTo = {"Fire", "Ice", "Poison", "Flying", "Bug"},
        resistantTo = {"Water", "Grass", "Electric", "Ground"},
        immuneTo = {},
        superEffective = {"Water", "Ground", "Rock"},
        notVeryEffective = {"Fire", "Grass", "Poison", "Flying", "Bug", "Dragon", "Steel"},
        noEffect = {}
    }
    types.Ice = {
        weakTo = {"Fire", "Fighting", "Rock", "Steel"},
        resistantTo = {"Ice"},
        immuneTo = {},
        superEffective = {"Grass", "Ground", "Flying", "Dragon"},
        notVeryEffective = {"Fire", "Water", "Ice", "Steel"},
        noEffect = {}
    }
    types.Fighting = {
        weakTo = {"Flying", "Psychic", "Fairy"},
        resistantTo = {"Bug", "Rock", "Dark"},
        immuneTo = {},
        superEffective = {"Normal", "Ice", "Rock", "Dark", "Steel"},
        notVeryEffective = {"Poison", "Flying", "Psychic", "Bug", "Fairy"},
        noEffect = {"Ghost"}
    }
    types.Poison = {
        weakTo = {"Ground", "Psychic"},
        resistantTo = {"Grass", "Fighting", "Poison", "Bug", "Fairy"},
        immuneTo = {},
        superEffective = {"Grass", "Fairy"},
        notVeryEffective = {"Poison", "Ground", "Rock", "Ghost"},
        noEffect = {"Steel"}
    }
    types.Ground = {
        weakTo = {"Water", "Grass", "Ice"},
        resistantTo = {"Poison", "Rock"},
        immuneTo = {"Electric"},
        superEffective = {"Fire", "Electric", "Poison", "Rock", "Steel"},
        notVeryEffective = {"Grass", "Bug"},
        noEffect = {"Flying"}
    }
    types.Flying = {
        weakTo = {"Electric", "Ice", "Rock"},
        resistantTo = {"Grass", "Fighting", "Bug"},
        immuneTo = {"Ground"},
        superEffective = {"Grass", "Fighting", "Bug"},
        notVeryEffective = {"Electric", "Rock", "Steel"},
        noEffect = {}
    }
    types.Psychic = {
        weakTo = {"Bug", "Ghost", "Dark"},
        resistantTo = {"Fighting", "Psychic"},
        immuneTo = {},
        superEffective = {"Fighting", "Poison"},
        notVeryEffective = {"Psychic", "Steel"},
        noEffect = {"Dark"}
    }
    types.Bug = {
        weakTo = {"Fire", "Flying", "Rock"},
        resistantTo = {"Grass", "Fighting", "Ground"},
        immuneTo = {},
        superEffective = {"Grass", "Psychic", "Dark"},
        notVeryEffective = {"Fire", "Fighting", "Poison", "Flying", "Ghost", "Steel", "Fairy"},
        noEffect = {}
    }
    types.Rock = {
        weakTo = {"Water", "Grass", "Fighting", "Ground", "Steel"},
        resistantTo = {"Normal", "Fire", "Poison", "Flying"},
        immuneTo = {},
        superEffective = {"Fire", "Ice", "Flying", "Bug"},
        notVeryEffective = {"Fighting", "Ground", "Steel"},
        noEffect = {}
    }
    types.Ghost = {
        weakTo = {"Ghost", "Dark"},
        resistantTo = {"Poison", "Bug"},
        immuneTo = {"Normal", "Fighting"},
        superEffective = {"Psychic", "Ghost"},
        notVeryEffective = {"Dark"},
        noEffect = {"Normal"}
    }
    types.Dragon = {
        weakTo = {"Ice", "Dragon", "Fairy"},
        resistantTo = {"Fire", "Water", "Grass", "Electric"},
        immuneTo = {},
        superEffective = {"Dragon"},
        notVeryEffective = {"Steel"},
        noEffect = {"Fairy"}
    }
    types.Dark = {
        weakTo = {"Fighting", "Bug", "Fairy"},
        resistantTo = {"Ghost", "Dark"},
        immuneTo = {"Psychic"},
        superEffective = {"Psychic", "Ghost"},
        notVeryEffective = {"Fighting", "Dark", "Fairy"},
        noEffect = {}
    }
    types.Steel = {
        weakTo = {"Fire", "Fighting", "Ground"},
        resistantTo = {"Normal", "Grass", "Ice", "Flying", "Psychic", "Bug", "Rock", "Dragon", "Steel", "Fairy"},
        immuneTo = {"Poison"},
        superEffective = {"Ice", "Rock", "Fairy"},
        notVeryEffective = {"Fire", "Water", "Electric", "Steel"},
        noEffect = {}
    }
    types.Fairy = {
        weakTo = {"Poison", "Steel"},
        resistantTo = {"Fighting", "Bug", "Dark"},
        immuneTo = {"Dragon"},
        superEffective = {"Fighting", "Dragon", "Dark"},
        notVeryEffective = {"Fire", "Poison", "Steel"},
        noEffect = {}
    }


--[[ Function to calculate type effectiveness
function calculateEffectiveness(attackType, defenseType)
    local attack = pokemonTypes[attackType]
    local defense = pokemonTypes[defenseType]
    
    if not attack or not defense then return 1 end
    
    -- Check for immunity
    for _, immuneType in ipairs(defense.immuneTo) do
        if immuneType == attackType then return 0 end
    end
    
    -- Calculate effectiveness multiplier
    local multiplier = 1
    
    for _, superType in ipairs(attack.superEffective) do
        if superType == defenseType then multiplier = multiplier * 2 end
    end
    
    for _, notVeryType in ipairs(attack.notVeryEffective) do
        if notVeryType == defenseType then multiplier = multiplier * 0.5 end
    end
    
    return multiplier
end

-- Example usage:
print("Water vs Fire:", calculateEffectiveness("Water", "Fire"))  -- 2 (super effective)
print("Electric vs Ground:", calculateEffectiveness("Electric", "Ground"))  -- 0 (no effect)
print("Grass vs Water:", calculateEffectiveness("Grass", "Water"))  -- 2 (super effective)
print("Fairy vs Dragon:", calculateEffectiveness("Fairy", "Dragon"))  -- 2 (super effective)
]]
return types
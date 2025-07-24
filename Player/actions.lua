local utils = require("utils")
local actions = {}

actions.list = {}

---Função para criar as ações do jogador
function actions.build()
    actions.list = {}

    --Atacar com espada
    local swordAttack = {
        description = "Você atacou com a espada",
        requirement = nil,
        execute = function (playerData, creatureData)
            --Todo:
            --1. Definir chance de Sucesso
            local successChance = creatureData.speed == 0 and 1 or  playerData.speed / creatureData.speed
            local success = math.random() <= successChance

            --2. Calcular Dano
            local rowDamage = playerData.attack - math.random() * creatureData.defense
            local damage = math.max(1, math.ceil(rowDamage))

            --3.Apresentar Resultado
                if success then
                    --Aplicar Dano
                    print(string.format("Você atacou a criatura e deu %d pontos de dano", damage))
                    --4. Aplicar dano em caso de Dano
                    creatureData.health = creatureData.health - damage

                    --Mostrar vida da Criatura
                    print(string.format("%s atacou a criatura e deu %d pontos de dano", playerData.name, damage))
                    local healthRate = math.floor((creatureData.health / creatureData.maxHealth) * 10)
                    print(string.format("%s: %s", creatureData.name, utils.getProgressBar(healthRate)))
                else
                    print("Seu ataque falhou!")
                    end
        end
    }
    local regenPotion = {
       description = "Tomar uma Poção",
       
       requirement = function (playerData, creatureData)
        return playerData.potions >= 1
       end,

       execute = function (playerData, creatureData)
        playerData.potions = playerData.potions-1

        local regenPoints = 5
        playerData.health = math.min(playerData.maxHealth, playerData.health + regenPoints)
        print("Você usou uma poção e recuperou alguns pontos de vida")
       end

    }
    --Populate List
    actions.list[#actions.list + 1] = swordAttack
    actions.list[#actions.list+1] = regenPotion
    
end

---Retorna uma lista de ações válidas
function actions.getValidActions(playerData, creatureData)
    local validActions = {}
    for _, actions in pairs(actions.list) do
        local requirement = actions.requirement
        local isValid = requirement == nil or requirement(playerData, creatureData)
        if isValid then
            validActions[#validActions+1] = actions
        end
    end

    return validActions
end



return actions
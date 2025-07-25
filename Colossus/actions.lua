<<<<<<< HEAD
local utils = require("utils")
local actions = {}

actions.list = {}

---Função para criar as ações do jogador
function actions.build()
    --Reseya a lista
    actions.list = {}

    --Atacar com espada
    local bodyAttack = {
        description = "Uma pancada poderosa",
        requirement = nil,
        execute = function (playerData, creatureData)
            --Todo:
            --1. Definir chance de Sucesso
            local successChance = playerData.speed == 0 and 1 or  creatureData.speed / playerData.speed
            local success = math.random() <= successChance

            --2. Calcular Dano
            local rowDamage = creatureData.attack - math.random() * playerData.defense
            local damage = math.max(1, math.ceil(rowDamage))

            --3.Apresentar Resultado
                if success then
                    --Aplicar Dano
                    print(string.format("Você atacou a %s e deu %d pontos de dano", playerData.name, damage))
                    --4. Aplicar dano em caso de Dano
                    playerData.health = playerData.health - damage

                    --Mostrar vida da Criatura
                    print(string.format("%s atacou você e deu %d pontos de dano", creatureData.name, damage))
                    local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
                    print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))

                else
                    print("Seu ataque falhou!")
                    end
        end
    }

    local sonarAttack = {
        description = "Uma poderosa onda sonora",
        requirement = nil,
        execute = function (playerData, creatureData)
        

        --2. Calcular Dano
        local rowDamage = creatureData.attack - math.random() * playerData.defense
        local damage = math.max(1, math.ceil(rowDamage))

        --3.Apresentar Resultado

        --Aplicar Dano
        print(string.format("Você atacou a %s e deu %d pontos de dano", playerData.name, damage))
        playerData.health = playerData.health - damage

        --Mostrar vida da Player
        print(string.format("%s atacou você e deu %d pontos de dano", creatureData.name, damage))

        local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
        print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))
        end
    }

    local waitAction = {
        description = "Aguardando",
        requirement = nil,

        execute = function (playerData, creatureData)
            --Apresentar resultado
            print(string.format("%s decidiu agurdar e não fez nada no turno", creatureData.name))
            local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
                print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))
        end
    }

    --Populate List
    actions.list[#actions.list + 1] = bodyAttack
    actions.list[#actions.list+1] = sonarAttack
    actions.list[#actions.list+1] = waitAction
    
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



=======
local utils = require("utils")
local actions = {}

actions.list = {}

---Função para criar as ações do jogador
function actions.build()
    --Reseya a lista
    actions.list = {}

    --Atacar com espada
    local bodyAttack = {
        description = "Uma pancada poderosa",
        requirement = nil,
        execute = function (playerData, creatureData)
            --Todo:
            --1. Definir chance de Sucesso
            local successChance = playerData.speed == 0 and 1 or  creatureData.speed / playerData.speed
            local success = math.random() <= successChance

            --2. Calcular Dano
            local rowDamage = creatureData.attack - math.random() * playerData.defense
            local damage = math.max(1, math.ceil(rowDamage))

            --3.Apresentar Resultado
                if success then
                    --Aplicar Dano
                    print(string.format("Você atacou a %s e deu %d pontos de dano", playerData.name, damage))
                    --4. Aplicar dano em caso de Dano
                    playerData.health = playerData.health - damage

                    --Mostrar vida da Criatura
                    print(string.format("%s atacou você e deu %d pontos de dano", creatureData.name, damage))
                    local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
                    print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))

                else
                    print("Seu ataque falhou!")
                    end
        end
    }

    local sonarAttack = {
        description = "Uma poderosa onda sonora",
        requirement = nil,
        execute = function (playerData, creatureData)
        

        --2. Calcular Dano
        local rowDamage = creatureData.attack - math.random() * playerData.defense
        local damage = math.max(1, math.ceil(rowDamage))

        --3.Apresentar Resultado

        --Aplicar Dano
        print(string.format("Você atacou a %s e deu %d pontos de dano", playerData.name, damage))
        playerData.health = playerData.health - damage

        --Mostrar vida da Player
        print(string.format("%s atacou você e deu %d pontos de dano", creatureData.name, damage))

        local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
        print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))
        end
    }

    local waitAction = {
        description = "Aguardando",
        requirement = nil,

        execute = function (playerData, creatureData)
            --Apresentar resultado
            print(string.format("%s decidiu agurdar e não fez nada no turno", creatureData.name))
            local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
                print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))
        end
    }

    --Populate List
    actions.list[#actions.list + 1] = bodyAttack
    actions.list[#actions.list+1] = sonarAttack
    actions.list[#actions.list+1] = waitAction
    
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



>>>>>>> 97dae7516bea5914d10b06baded4228838e00c6a
return actions
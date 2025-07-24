--Pastas Usadas
local player = require("Player.player")
local colossus = require("Colossus.colossus")
local utils = require("utils")
local playerActions = require ("Player.actions")
local bossAction = require("Colossus.actions")


---Obter Jogador
local function obterJogador()
    print(string.format("A vida do jogador é %d/%d", player.health, player.maxHealth))
    return player
end

---Obter Monstro
local function chooseBoss()
    local boss = colossus
    local bossAction = colossus

    --[[local choose = math.random(1, 8)
    if choose == 1 then
        
    end
    if choose == 2 then
        
    end
    if choose == 3 then
        
    end
    if choose == 4 then
        
    end
    if choose == 5 then
        
    end
    if choose == 6 then
        
    end
    if choose == 7 then
        
    end
    if choose == 8 then
        
    end
    ]]

    return boss, bossAction
end
--Apresentar Monstro



---Execução do Programa
local function Main()
    utils.enableUTF8()
    utils.header()
    playerActions.build()

    local boss = chooseBoss()
    utils.printCreature(boss)
    
    obterJogador()

    --Começar o loop de batalha
    while true do

        --Mostrar ações do Jogador
        print()
        print("O que você deseja fazer?")
        local validPlayerActions = playerActions.getValidActions(player, boss)
        for i, actions in pairs(validPlayerActions) do
            print(string.format("%d. &s", i, actions.description))
        end

        --Simular turno do jogador
        local choosenIndex = utils.ask()
        local choosenAction = validPlayerActions[choosenIndex]
        local isActionValid = choosenAction ~= nil

        if isActionValid then
            choosenAction.execute(player, boss)
        else
            print(print(string.format("Sua escolha é inválida, %s perdeu a vez", player.name)))
            end
        --Simular turno do oponente
        print()
        local validBossActions = bossAction.getValidActions(player, boss)
        local chosenBossAction = validBossActions[math.random(#validBossActions)]
        chosenBossAction.execute(player, boss)
        
        --Condição de vitória
        if player.health <= 0 then
            print("O Seu pokemon desmaiou. Você perdeu a batalha")
            break
        end
        -- Condição de derrota
        if boss.health <= 0 then
            print("O Pokemon do seu oponente desmaiou. Você venceu a batalha")
            break
        end

    end

    --Loop para reiniciar a simulação
   local choose = nil
    while true do
        print("A Simulação terminou. Deseja jogar novamente? (1. Sim || 2.Não)")
        choose = io.read("n")
        
        if choose == 1 then
            print("Vamos começar de novo!")
            utils.clearTerminal()
            Main()
            break 
        elseif choose == 2 then
            print("Até a próxima, treinador.")
            utils.clearTerminal()
            break 
        else
            print("Opção inválida! Tente novamente")
        end
    end


end

Main()



local utils = {}

    ---Função para habilitar caracteres especiais
    function utils.enableUTF8()
        os.execute("chcp 65001")
    end

    --- Aqui está o cabeçalho do nosso simulador
    function utils.header()
    print([[
===================================================================
                                  ,'\
    _.----.        ____         ,'  _\   ___    ___     ____
_,-'       `.     |    |  /`.   \,-'    |   \  /   |   |    \  |`.
\      __    \    '-.  | /   `.  ___    |    \/    |   '-.   \ |  |
 \.    \ \   |  __  |  |/    ,','_  `.  |          | __  |    \|  |
   \    \/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |
    \     ,-'/  /   \    ,'   | \/ / ,`.|         /  /   \  |     |
     \    \ |   \_/  |   `-.  \    `'  /|  |    ||   \_/  | |\    |
      \    \ \      /       `-.`.___,-' |  |\  /| \      /  | |   |
       \    \ `.__,'|  |`-._    `|      |__| \/ |  `.__,'|  | |   |
        \_.-'       |__|    `-._ |              '-.|     '-.| |   |
                                `'                            '-._|
===================================================================
==========================Luta de Ginásio==========================
===================================================================
]])
    end 

    function utils.getProgressBar(attribute)
    local fullChar = "◼"
    local emptyChar = "◻"

    local result = ""
    for i = 1, 10, 1 do
        if i <= attribute then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end


    function utils.printCreature(creature)
        -- Calcula health
        local healthRate = math.floor((creature.health / creature.maxHealth)*10)

        --Cartão
        print("| " .. creature.name )
        print("| "  .. creature.description)
        print("|  ")
        print("| Atributos:" )
        print("| Vida:" .. utils.getProgressBar(healthRate) )
        print("| Ataque: "  .. utils.getProgressBar(creature.attack))
        print("| Defesa: " .. utils.getProgressBar(creature.defense) )
        print("| Velocidade:" .. utils.getProgressBar(creature.agility))
    end

    ---Pergunta ao usuário o que fazer
    function utils.ask()
        io.write("> ")
        local awnswer = io.read("*n")
        return awnswer
    end

    --Limpar o terminal
    function utils.clearTerminal()
    -- Versão multiplataforma para limpar terminal
    if package.config:sub(1,1) == '\\' then  -- Windows
        os.execute("cls")
    else  -- Linux/MacOS
        os.execute("clear")
    end
end

return utils
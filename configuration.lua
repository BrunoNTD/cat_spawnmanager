-- getSetting's
function getSettings ( )
    return {
        Messages = {
            wakeupMessage = 'Você desmaiou e foi levado ao %s.', --> Mensagem após o jogador respawnar.
            transportMessage = 'O seu transporte para o hospital lhe custou %s.' --> Mensagem após o jogador respawnar.
        },
        Proprieties = {
            takeMoney = true, --> Pegar a quantia de dinheiro definida em `amountMoney` do jogador.
            amountMoney = 500, --> Preço do transporte.
            timeWakeup = 3 --> Tempo para o Jogador respawnar em segundos.
        },
        Positions = { --> Posições dos hospitais.
            {
                position = { 1667.7047119141, -1409.2398681641, 13.546875 }, --> Posição X, Y, Z. / Para obter utilize a função / setClipboard (table.concat ({getElementPosition (localPlayer)}, ', '));
                rotation = { -0, 0, 91.902816772461 }, --> Rotação X, Y, Z. / Para obter utilize a função / setClipboard (table.concat ({getElementRotation (localPlayer)}, ', '));
                title = 'Pronto Atendimento, Los Santos' --> Nome do Spawn.
            },
            {
                position = { 1182.80859375, -1323.5539550781, 13.57844543457 }, --> Posição X, Y, Z. / Para obter utilize a função / setClipboard (table.concat ({getElementPosition (localPlayer)}, ', '));
                rotation = { -0, 0, 268.54241943359 }, --> Rotação X, Y, Z. / Para obter utilize a função / setClipboard (table.concat ({getElementRotation (localPlayer)}, ', '));
                title = 'Hospital Geral, Los Santos' --> Nome do Spawn.
            },
            {
                position = { -2659.4699707031, 630.31640625, 14.453125 },
                rotation = { -0, 0, 176.84075927734 },
                title = 'Hospital Geral, San Fierro'
            },
        },
    };
end
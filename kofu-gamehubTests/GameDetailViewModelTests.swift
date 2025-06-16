//
//  GameDetailViewModelTests.swift
//  kofu-gamehubTests
//
//  Created by Hendratara Pratama on 16/06/25.
//

import Testing
import CoreData

@testable import kofu_gamehub

struct GameDetailViewModelTests {
    
    @Test
    func likeGameStoresToCoreData() throws {
        let viewModel = DetailGameViewViewModel()
        let context = PersistenceController.shared.container.viewContext
        
        viewModel.fetchDetailGame(3498)
        
        let dummy = DetailGameModel(
            id: 3498,
            slug: "grand-theft-auto-v",
            name: "Grand Theft Auto V",
            nameOriginal: "Grand Theft Auto V",
            description: "<p>Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. <br />\nSimultaneous storytelling from three unique perspectives: <br />\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. <br />\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.</p>\n<p>Español<br />\nRockstar Games se hizo más grande desde su entrega anterior de la serie. Obtienes la construcción del mundo complicada y realista de Liberty City de GTA4 en el escenario de Los Santos, un viejo favorito de los fans, GTA San Andreas. 561 vehículos diferentes (incluidos todos los transportes que puede operar) y la cantidad aumenta con cada actualización.<br />\nNarración simultánea desde tres perspectivas únicas:<br />\nSigue a Michael, ex-criminal que vive su vida de ocio lejos del pasado, Franklin, un niño que busca un futuro mejor, y Trevor, el pasado exacto del que Michael está tratando de huir.<br />\nGTA Online proporcionará muchos desafíos adicionales incluso para los jugadores experimentados, recién llegados del modo historia. Ahora tendrás otros jugadores cerca que pueden ayudarte con la misma probabilidad que arruinar tu misión. Los jugadores pueden experimentar todas las mecánicas de GTA actualizadas a través del personaje personalizable único, y el contenido de la comunidad combinado con el sistema de nivelación tiende a mantener a todos ocupados y comprometidos.</p>",
            released: "2013-09-17",
            backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg",
            backgroundImageAdditional: "https://media.rawg.io/media/screenshots/5f5/5f5a38a222252d996b18962806eed707.jpg",
            website: "http://www.rockstargames.com/V/",
            rating: 4.47,
            tags: []
        )
        
        viewModel.likeGameHandler(dummy)
        
        let request = NSFetchRequest<CoreGameModel>(entityName: "CoreGameModel")
        request.predicate = NSPredicate(format: "id == %d", dummy.id)
        
        let result = try context.fetch(request)
        
        #expect(result.count == 1)
        #expect(result.first?.name == "Grand Theft Auto V")
    }
    
}

//
//  SpeciesCategory.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/29/24.
//

import Foundation

/// Categorizes Species into groups, or specific edge-case qualitites.
struct SpeciesCategory {
    /// Checks if the Species is classified as a Mythical Distribution (disallowed for competitive rulesets)
    func isMythical(species: Species) -> Bool {
        return [
            .Mew, .Celebi, .Jirachi, .Deoxys,
            .Phione, .Manaphy, .Darkrai, .Shaymin, .Arceus,
            .Victini, .Keldeo, .Meloetta, .Genesect,
            .Diancie, .Hoopa, .Volcanion,
            .Magearna, .Marshadow, .Zeraora, .Meltan, .Melmetal,
            .Zarude,
            .Pecharunt,
        ].contains(species)
    }

    /// Checks if a Species is classified as a Legend.
    /// - remark: previous games may have included Mythicals in this list, but those should be considered separately
    func isLegendary(species: Species) -> Bool {
        return [
            .Mewtwo, .Lugia, .HoOh, .Kyogre, .Groudon, .Rayquaza,
            .Dialga, .Palkia, .Giratina, .Reshiram, .Zekrom, .Kyurem,
            .Xerneas, .Yveltal, .Zygarde, .Cosmog, .Cosmoem, .Solgaleo, .Lunala, .Necrozma,
            .Zacian, .Zamazenta, .Eternatus, .Calyrex, .Koraidon, .Miraidon, .Terapagos,
        ].contains(species)
    }

    /// Checks if a Species is classified as a SubLegend
    func isSubLegendary(species: Species) -> Bool {
        return [
            .Articuno, .Zapdos, .Moltres, .Raikou, .Entei, .Suicune,
            .Regirock, .Regice, .Registeel, .Latias, .Latios,
            .Uxie, .Mesprit, .Azelf, .Heatran, .Regigigas, .Cresselia,
            .Cobalion, .Terrakion, .Virizion, .Tornadus, .Thundurus, .Landorus,
            .TypeNull, .Silvally, .TapuKoko, .TapuLele, .TapuBulu, .TapuFini,
            .Kubfu, .Urshifu, .Regieleki, .Regidrago, .Glastrier, .Spectrier, .Enamorus,
            .WoChien, .ChienPao, .TingLu, .ChiYu, .Okidogi, .Munkidori, .Fezandipiti, .Ogerpon,
        ].contains(species)
    }

    /// Checks if the Species is an Ultra Beast Pokemon
    func isUltraBeast(species: Species) -> Bool {
        return (Species.Nihilego...Species.Guzzlord).contains(species) || (Species.Poipole...Species.Blacephalon).contains(species)
    }

    /// Checks if the Species is a Paradox Pokemon
    func isParadox(species: Species) -> Bool {
        return (Species.GreatTusk...Species.IronThorns).contains(species) || [
            .RoaringMoon, .IronValiant, .WalkingWake, .IronLeaves, .GougingFire, .RagingBolt, .IronBoulder, .IronCrown,
        ].contains(species)
    }

    func isFixedGenderFromDual(species: Species) -> Bool {
        return [
            .Shedinja, // Genderless
            .Wormadam, // F
            .Mothim, // M
            .Vespiquen, // F
            .Gallade, // M
            .Froslass, // F
            // species introduced after Gender disassociated from PID
            .Meowstic, .Salazzle, .Oinkologne,
        ].contains(species)
    }
}

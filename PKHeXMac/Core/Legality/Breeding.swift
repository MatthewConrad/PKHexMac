//
//  Breeding.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/29/24.
//

import Foundation

struct Breeding {
    /// Checks if the game has a daycare / allows for breeding eggs
    /// - parameters:
    ///     - game: the GameVersion ID to check for
    func canGameGenerateEggs(game: GameVersion) -> Bool {
        return [
            .GS,
            .R, .S, .E, .FR, .LG,
            .D, .P, .Pt, .HG, .SS,
            .B, .W, .B2, .W2,
            .X, .Y, .OR, .AS,
            .SN, .MN, .US, .UM,
            .GD, .SI, .C,
            .SW, .SH, .BD, .SP,
            .SL, .SV
        ].contains(game)
    }

    /// species that have special handling for breeding
    private func isMixedGenderBreed(species: Species) -> Bool {
        return [.NidoranF, .NidoranM, .Volbeat, .Illumise, .Indeedee].contains(species)
    }

    /// Checks if a species can be born with inherited moves from the parents
    /// - parameters:
    ///     - species: the entity species ID
    func canInheritMoves(species: Species) -> Bool {
        // TODO: PKX stuff

        if isMixedGenderBreed(species: species) {
            return true
        }

        return false
    }

    /// Checks if the species can yield a different baby species when bred via incense in Gen 3.
    func isSplitBreedNotBabySpecies3(species: Species) -> Bool {
        return [.Marill, .Wobbuffet].contains(species)
    }

    /// Checks if the species can yield a different baby species when bred via incense in Gen 4
    func isSplitBreedNotBabySpecies4(species: Species) -> Bool {
        return [
            .Marill, .Wobbuffet, .Chansey, .MrMime, .Snorlax, .Sudowoodo, .Mantine, .Roselia, .Chimecho
        ].contains(species)
    }

    /// Checks for species that cannot hatch from an egg.
    func isAbleToHatchFromEgg(species: Species) -> Bool {
        // for sake of maintenance, splitting cases by generation
        switch species {
        case .Ditto, .Articuno, .Zapdos, .Moltres, .Mewtwo, .Mew:
            return false
        case .Unown, .Raikou, .Entei, .Suicune, .Lugia, .HoOh, .Celebi:
            return false
        case
            .Regirock, .Regice, .Registeel, .Latias, .Latios, .Kyogre, .Groudon,
            .Rayquaza, .Jirachi, .Deoxys:
            return false
        case
            .Uxie, .Mesprit, .Azelf, .Dialga, .Palkia, .Heatran, .Regigigas, .Giratina,
            .Cresselia, .Manaphy, .Darkrai, .Shaymin, .Arceus:
            return false
        case
            .Victini, .Cobalion, .Terrakion, .Virizion, .Tornadus, .Thundurus,
            .Reshiram, .Zekrom, .Landorus, .Kyurem, .Keldeo, .Meloetta, .Genesect:
            return false
        case .Xerneas, .Yveltal, .Zygarde, .Diancie, .Hoopa, .Volcanion:
            return false
        case
            .TypeNull, .Silvally, .TapuKoko, .TapuLele, .TapuBulu, .TapuFini,
            .Cosmog, .Cosmoem, .Solgaleo, .Lunala,
            .Nihilego, .Buzzwole, .Pheromosa, .Xurkitree, .Celesteela, .Kartana, .Guzzlord, .Necrozma,
            .Magearna, .Marshadow, .Poipole, .Naganadel, .Stakataka, .Blacephalon, .Zeraora,
            .Meltan, .Melmetal:
            return false
        case
            .Dracozolt, .Arctozolt, .Dracovish, .Arctovish, .Zacian, .Zamazenta, .Eternatus,
            .Kubfu, .Urshifu, .Zarude, .Regieleki, .Regidrago, .Glastrier, .Spectrier, .Calyrex, .Enamorus:
            return false
        case
            .GreatTusk, .ScreamTail, .BruteBonnet, .FlutterMane, .SlitherWing, .SandyShocks,
            .IronTreads, .IronBundle, .IronHands, .IronJugulis, .IronMoth, .IronThorns,
            .Gimmighoul, .Gholdengo, .WoChien, .ChienPao, .TingLu, .ChiYu,
            .RoaringMoon, .IronValiant, .Koraidon, .Miraidon, .WalkingWake, .IronLeaves,
            .Okidogi, .Munkidori, .Fezandipiti, .Ogerpon,
            .GougingFire, .RagingBolt, .IronBoulder, .IronCrown, .Terapagos, .Pecharunt:
            return false
        default:
            return true
        }
    }

    /// Checks for species that have forms that cannot exist as an egg
    func isBreedableForm(species: Species, form: Int) -> Bool {
        return if [
            .Pikachu, .Eevee, .Pichu, .Sinistea, .Polteageist, .Poltchageist, .Sinistcha
        ].contains(species) {
            false
        } else if species == .Floette && form == 5 {
            false
        } else if species == .Greninja && form == 1 {
            false
        } else {
            true
        }
    }
    
    /// Checks if the Species can be obtained from a daycare egg
    func canHatchAsEgg(species: Species) -> Bool {
        return isAbleToHatchFromEgg(species: species)
    }
    
    /// Checks if the Species-Form can exist as a hatched egg in the given EntityContext
    func canHatchAsEgg(species: Species, form: Int, context: EntityContext) -> Bool {
        return if form == 0 {
            true
        } else if form == 1 {
            false // TODO: FormInfo.isTotemForm
        } else if form == 2 {
            false // TODO: FormInfo.isLordForm
        } else {
            isBreedableForm(species: species, form: form)
        }
    }
}

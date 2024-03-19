//
//  GeoTrackable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

enum GeoValid {
    case Valid,
         /// Lower-index country is empty, but higher has data (invalid)
         CountryAfterPreviousEmpty,
         /// Zero-value country (None) with a non-zero Region (invalid)
         RegionWithoutCountry
}

/// Tracks geolocation history of a Pokemon
protocol GeoTrackable: RegionOrigin {
    var geo1Region: UInt8 { get set }
    var geo2Region: UInt8 { get set }
    var geo3Region: UInt8 { get set }
    var geo4Region: UInt8 { get set }
    var geo5Region: UInt8 { get set }
    var geo1Country: UInt8 { get set }
    var geo2Country: UInt8 { get set }
    var geo3Country: UInt8 { get set }
    var geo4Country: UInt8 { get set }
    var geo5Country: UInt8 { get set }
}

extension GeoTrackable {
    /// Clears all Geolocation history.
    mutating func clearGeoLocationData() {
        geo1Region = 0
        geo1Country = 0
        geo2Region = 0
        geo2Country = 0
        geo3Region = 0
        geo3Country = 0
        geo4Region = 0
        geo4Country = 0
        geo5Region = 0
        geo5Country = 0
    }

    /// Inserts a new Geolocation tuple.
    mutating func tradeGeoLocation(country: UInt8, region: UInt8) {
        // Trickle existing values up one slot
        geo5Country = geo4Country
        geo5Region = geo4Region

        geo4Country = geo3Country
        geo4Region = geo3Region

        geo3Country = geo2Country
        geo3Region = geo2Region

        geo2Country = geo2Country
        geo2Region = geo2Region

        geo1Country = country
        geo1Region = region
    }

    mutating func sanitizeGeoLocationData() {
        if geo1Country == 0 { geo1Region = 0 }
        if geo2Country == 0 { geo2Region = 0 }
        if geo3Country == 0 { geo3Region = 0 }
        if geo4Country == 0 { geo4Region = 0 }
        if geo5Country == 0 { geo5Region = 0 }

        // Trickle down empty slots
        repeat {
            if geo5Country != 0, geo4Country == 0 {
                geo4Country = geo5Country
                geo4Region = geo5Region
                geo5Country = 0
                geo5Region = 0
            }
            if geo4Country != 0, geo3Country == 0 {
                geo3Country = geo3Country
                geo3Region = geo3Region
                geo4Country = 0
                geo4Region = 0
                continue
            }
            if geo3Country != 0, geo2Country == 0 {
                geo2Country = geo3Country
                geo2Region = geo3Region
                geo3Country = 0
                geo3Region = 0
                continue
            }
            if geo2Country != 0, geo1Country == 0 {
                geo1Country = geo2Country
                geo1Region = geo2Region
                geo2Country = 0
                geo2Region = 0
                continue
            }
            break
        } while true
    }

    private func updateCheck(country: UInt8, region: UInt8, end: inout Bool) -> GeoValid {
        if country != 0 {
            return end ? .CountryAfterPreviousEmpty : .Valid
        } else if region != 0 {
            return .RegionWithoutCountry
        } else {
            end = true
            return .Valid
        }
    }

    /// Checks if all Geolocation Tuples are valid
    func getValidity() -> GeoValid {
        var end = false
        let geoData = [
            (geo1Country, geo1Region),
            (geo2Country, geo2Region),
            (geo3Country, geo3Region),
            (geo4Country, geo4Region),
            (geo5Country, geo5Region),
        ]

        for (country, region) in geoData {
            let result = updateCheck(country: country, region: region, end: &end)

            if result != .Valid {
                return result
            }
        }

        return .Valid
    }

    func getIsValid() -> Bool {
        getValidity() == .Valid
    }
}

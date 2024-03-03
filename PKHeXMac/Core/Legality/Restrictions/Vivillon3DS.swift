//
//  Vivillon3DS.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

/// Console region flags for the 3DS
/// - remark: not to be confused with Region3DSIndex
struct Region3DSFlags: OptionSet {
    let rawValue: Int

    static let None = Region3DSFlags([])
    static let Japan = Region3DSFlags(rawValue: 1 << 0)
    static let Americas = Region3DSFlags(rawValue: 1 << 1)
    static let Europe = Region3DSFlags(rawValue: 1 << 2)
    static let China = Region3DSFlags(rawValue: 1 << 4)
    static let Korea = Region3DSFlags(rawValue: 1 << 5)
    static let Taiwan = Region3DSFlags(rawValue: 1 << 6)

    func hasFlag(_ flag: Region3DSFlags) -> Bool {
        return contains(flag)
    }
}

/// Provides information for Vivillon origins with respect to the 3DS game data
enum Vivillon3DS {
    static let maxWildFormID = 17
    static let fancyFormID = 18

    // List of valid regions
    private static let regionTable: [Region3DSFlags] = [
        [.Americas, .Europe], // 0 Icy Snow
        [.Americas, .Europe, .China], // 1 Polar
        [.Japan, .Europe], // 2 Tundra
        [.Japan, .Americas, .Europe, .China, .Korea, .Taiwan], // 3 Continental
        [.Europe], // 4 Garden
        [.Japan], // 5 Elegant
        [.Europe], // 6 Meadow
        [.Americas], // 7 Modern
        [.Americas, .Europe], // 8 Marine
        [.Americas, .Europe], // 9 Archipelago
        [.Americas, .Europe, .China], // 10 High Plains
        [.Americas, .Europe], // 11 Sandstorm
        [.Europe], // 12 River
        [.Japan, .Europe, .China, .Taiwan], // 13 Monsoon
        [.Americas], // 14 Savanna
        [.Americas, .Europe], // 15 Sun
        [.Americas, .Europe], // 16 Ocean
        [.Americas, .Europe], // 17 Jungle
    ]

    /**
      The game stores an equirectangular projection byte map of forms, laid out over a map of Earth.
      The game then determines form based on the player's selected Country and Region via its latitude and longitude stored in the 3DS's system files.
      Since we have dumped these country,region->latitude,longitude mappings, we can determine the form that would be obtained in-game.
      Using the data from @abcboy101 located here: https://github.com/abcboy101/vivillon/blob/main/data_points.json
      Provide efficient and quick lookups for checking if a form can originate from a given country/region.
      Reminder: Vivillon form is set when you start the Save File. Changing Country/Region after will update Country/Region for OT, not the form available.

      93 countries have the same form. This is about half the total amount of countries [0,186].
      Instead of doing an index = lookup(country) -> form[index], can do array[country] with a sentinel to indicate the country is different by region.
      This results in O(1) performance, better than O(log(n)) for the binary search approach.
      None of the these countries with same form have form 0, so we can use that as a sentinel value.
     */
    private static let XX = 0
    private static let sameCountry: [Int] =
        [
            XX, XX, XX, XX, XX, XX, XX, XX, 09, 09, XX, 09, 09, 09, 15, 14,
            XX, 09, XX, 15, XX, XX, XX, 09, 09, 17, 15, 17, 09, 09, 15, 17,
            09, 15, 09, 09, XX, 09, 09, 15, 17, 14, XX, 09, 09, 09, 17, 09,
            09, XX, 14, 09, XX, XX, XX, XX, XX, XX, XX, XX, XX, XX, XX, XX,
            08, XX, XX, 03, 08, 12, 08, 08, 11, XX, XX, 03, XX, XX, XX, 08,
            08, 02, 04, XX, 03, XX, 06, 03, 06, 08, 08, 08, 15, 12, 03, 04,
            XX, 03, 08, 08, XX, 08, 08, 08, XX, XX, 15, XX, 06, XX, 04, 15,
            15, 10, 12, 12, 12, 12, 11, 11, 11, 11, 06, 08, 08, 04, 08, 06,
            XX, XX, XX, XX, XX, XX, XX, XX, 03, XX, XX, XX, XX, XX, XX, XX,
            03, XX, XX, XX, XX, XX, XX, XX, XX, 17, XX, XX, 17, XX, XX, XX,
            XX, XX, XX, XX, XX, XX, XX, XX, 11, XX, XX, XX, XX, XX, 11, XX,
            XX, XX, XX, XX, XX, XX, XX, XX, 08, 08, 07,
        ]

    /**
     (country:X2_region:X2)
     do it this way instead of region_country so that the byte[] form is better ordered for better file compression :)
     777 entries, so we can use a binary search to find the form. Worst case is log2(777) = 10 comparisons.
     */
    private static let diffCountryRegion: [Int] =
        [
            0x0100, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107, 0x0108, 0x0109, 0x010A, 0x010B, 0x010C, 0x010D, 0x010E, 0x010F, 0x0110,
            0x0111, 0x0112, 0x0113, 0x0114, 0x0115, 0x0116, 0x0117, 0x0118, 0x0119, 0x011A, 0x011B, 0x011C, 0x011D, 0x011E, 0x011F, 0x0120,
            0x0121, 0x0122, 0x0123, 0x0124, 0x0125, 0x0126, 0x0127, 0x0128, 0x0129, 0x012A, 0x012B, 0x012C, 0x012D, 0x012E, 0x012F, 0x0130,
            0x0A00, 0x0A02, 0x0A03, 0x0A04, 0x0A05, 0x0A06, 0x0A07, 0x0A08, 0x0A09, 0x0A0A, 0x0A0B, 0x0A0C, 0x0A0D, 0x0A0E, 0x0A0F, 0x0A10,
            0x0A11, 0x0A12, 0x0A13, 0x0A14, 0x0A15, 0x0A16, 0x0A17, 0x0A18, 0x0A19, 0x1000, 0x1002, 0x1003, 0x1004, 0x1005, 0x1006, 0x1007,
            0x1008, 0x1009, 0x100A, 0x100B, 0x100C, 0x100D, 0x100E, 0x100F, 0x1010, 0x1011, 0x1012, 0x1013, 0x1014, 0x1015, 0x1016, 0x1017,
            0x1018, 0x1019, 0x101A, 0x101B, 0x101C, 0x1200, 0x1202, 0x1203, 0x1204, 0x1205, 0x1206, 0x1207, 0x1208, 0x1209, 0x120A, 0x120B,
            0x120C, 0x120D, 0x120E, 0x1400, 0x1402, 0x1403, 0x1404, 0x1405, 0x1406, 0x1407, 0x1408, 0x1409, 0x140A, 0x140B, 0x140C, 0x140D,
            0x140E, 0x1500, 0x1502, 0x1503, 0x1504, 0x1505, 0x1506, 0x1507, 0x1508, 0x1509, 0x150A, 0x150B, 0x150C, 0x150D, 0x150E, 0x150F,
            0x1510, 0x1511, 0x1512, 0x1513, 0x1514, 0x1515, 0x1516, 0x1517, 0x1518, 0x1519, 0x151A, 0x151B, 0x151C, 0x151D, 0x151E, 0x151F,
            0x1520, 0x1521, 0x1522, 0x1600, 0x1602, 0x1603, 0x1604, 0x1605, 0x1606, 0x1607, 0x1608, 0x2400, 0x2402, 0x2403, 0x2404, 0x2405,
            0x2406, 0x2407, 0x2408, 0x2409, 0x240A, 0x240B, 0x240C, 0x240D, 0x240E, 0x240F, 0x2410, 0x2411, 0x2412, 0x2413, 0x2414, 0x2415,
            0x2416, 0x2417, 0x2418, 0x2419, 0x241A, 0x241B, 0x241C, 0x241D, 0x241E, 0x241F, 0x2420, 0x2421, 0x2A00, 0x2A02, 0x2A03, 0x2A04,
            0x2A05, 0x2A06, 0x2A07, 0x2A08, 0x2A09, 0x2A0A, 0x2A0B, 0x2A0C, 0x2A0D, 0x2A0E, 0x2A0F, 0x2A10, 0x2A11, 0x2A12, 0x2A13, 0x2A14,
            0x2A15, 0x2A16, 0x2A17, 0x2A18, 0x2A19, 0x2A1A, 0x3100, 0x3102, 0x3103, 0x3104, 0x3105, 0x3106, 0x3107, 0x3108, 0x3109, 0x310A,
            0x310B, 0x310C, 0x310D, 0x310E, 0x310F, 0x3110, 0x3111, 0x3112, 0x3113, 0x3114, 0x3115, 0x3116, 0x3117, 0x3118, 0x3119, 0x311A,
            0x311B, 0x311C, 0x311D, 0x311E, 0x311F, 0x3120, 0x3121, 0x3122, 0x3123, 0x3124, 0x3125, 0x3126, 0x3127, 0x3128, 0x3129, 0x312A,
            0x312B, 0x312C, 0x312D, 0x312E, 0x312F, 0x3130, 0x3131, 0x3132, 0x3133, 0x3134, 0x3135, 0x3400, 0x3402, 0x3403, 0x3404, 0x3405,
            0x3406, 0x3407, 0x3408, 0x3409, 0x340A, 0x340B, 0x340C, 0x340D, 0x340E, 0x340F, 0x3410, 0x3411, 0x3412, 0x3413, 0x3414, 0x3415,
            0x3416, 0x3417, 0x3418, 0x3419, 0x341A, 0x4100, 0x4102, 0x4103, 0x4104, 0x4105, 0x4106, 0x4107, 0x4108, 0x4109, 0x4200, 0x4202,
            0x4203, 0x4204, 0x4205, 0x4206, 0x4207, 0x4208, 0x4209, 0x420A, 0x4900, 0x4902, 0x4903, 0x4904, 0x4905, 0x4906, 0x4907, 0x4908,
            0x4909, 0x490A, 0x490B, 0x490C, 0x490D, 0x490E, 0x490F, 0x4A00, 0x4A12, 0x4A13, 0x4A14, 0x4A15, 0x4A16, 0x4A17, 0x4A18, 0x4C00,
            0x4C08, 0x4C09, 0x4C0A, 0x4C0B, 0x4C0C, 0x4C0D, 0x4C0E, 0x4C0F, 0x4C10, 0x4C11, 0x4C12, 0x4C13, 0x4C14, 0x4C15, 0x4C16, 0x4C17,
            0x4C18, 0x4C19, 0x4C1A, 0x4C1B, 0x4D00, 0x4D02, 0x4D03, 0x4D04, 0x4D05, 0x4D06, 0x4D07, 0x4D08, 0x4D09, 0x4D0A, 0x4D0B, 0x4D0C,
            0x4D0D, 0x4D0E, 0x4D0F, 0x4D10, 0x4D11, 0x4D12, 0x4D13, 0x4D14, 0x4D15, 0x4D16, 0x4D17, 0x4D18, 0x4D19, 0x4D1A, 0x4D1B, 0x4E00,
            0x4E02, 0x4E03, 0x4E04, 0x4E05, 0x4E06, 0x4E07, 0x4E08, 0x4E09, 0x4E0A, 0x4E0B, 0x4E0C, 0x4E0D, 0x4E0E, 0x4E0F, 0x4E10, 0x4E11,
            0x5300, 0x5302, 0x5303, 0x5304, 0x5305, 0x5306, 0x5307, 0x5308, 0x5309, 0x530A, 0x530B, 0x530C, 0x530D, 0x530E, 0x530F, 0x5310,
            0x5311, 0x5312, 0x5313, 0x5314, 0x5315, 0x5500, 0x5502, 0x5503, 0x5504, 0x5505, 0x5506, 0x5507, 0x5508, 0x5509, 0x550A, 0x550B,
            0x6000, 0x6007, 0x6008, 0x6009, 0x600A, 0x600B, 0x600C, 0x600D, 0x600E, 0x600F, 0x6010, 0x6011, 0x6012, 0x6013, 0x6014, 0x6015,
            0x6016, 0x6017, 0x6018, 0x6019, 0x601A, 0x6400, 0x6409, 0x640A, 0x640B, 0x640C, 0x640D, 0x640E, 0x640F, 0x6410, 0x6411, 0x6412,
            0x6413, 0x6414, 0x6415, 0x6416, 0x6417, 0x6418, 0x6419, 0x641A, 0x641B, 0x641C, 0x641D, 0x641E, 0x641F, 0x6420, 0x6421, 0x6422,
            0x6423, 0x6424, 0x6425, 0x6426, 0x6427, 0x6428, 0x6429, 0x642A, 0x642B, 0x642C, 0x642D, 0x642E, 0x642F, 0x6430, 0x6431, 0x6432,
            0x6433, 0x6434, 0x6435, 0x6436, 0x6437, 0x6438, 0x6439, 0x643A, 0x643B, 0x643C, 0x643D, 0x643E, 0x643F, 0x6440, 0x6441, 0x6442,
            0x6443, 0x6444, 0x6445, 0x6446, 0x6447, 0x6448, 0x6449, 0x644A, 0x644B, 0x644C, 0x644D, 0x644E, 0x644F, 0x6450, 0x6451, 0x6452,
            0x6453, 0x6454, 0x6455, 0x6456, 0x6457, 0x6458, 0x6459, 0x645A, 0x645B, 0x6800, 0x6802, 0x6803, 0x6804, 0x6805, 0x6806, 0x6807,
            0x6808, 0x6809, 0x680A, 0x6900, 0x6902, 0x6903, 0x6904, 0x6905, 0x6906, 0x6907, 0x6908, 0x6909, 0x690A, 0x690B, 0x690C, 0x690D,
            0x690E, 0x690F, 0x6910, 0x6911, 0x6912, 0x6913, 0x6914, 0x6B00, 0x6B02, 0x6B03, 0x6B04, 0x6B05, 0x6B06, 0x6B07, 0x6B08, 0x6B09,
            0x6B0A, 0x6B0B, 0x6B0C, 0x6B0D, 0x6B0E, 0x6B0F, 0x6B10, 0x6B11, 0x6B12, 0x6B13, 0x6B14, 0x6B15, 0x6B16, 0x6D00, 0x6D02, 0x6D03,
            0x6D04, 0x6D05, 0x6D06, 0x6D07, 0x6D08, 0x6D09, 0x6D0A, 0x6D0B, 0x6D0C, 0x6D0E, 0x6D0F, 0x6D10, 0x6D11, 0x6D12, 0x6D13, 0x6D14,
            0x6D15, 0x6D16, 0x6D17, 0x6D18, 0x6D19, 0x6D1A, 0x6D1B, 0x6D1C, 0x6D1D, 0x6D1E, 0x6D1F, 0x6D20, 0x6D21, 0x6D22, 0x6D23, 0x6D24,
            0x6D25, 0x6D26, 0x6D27, 0x6D28, 0x6D29, 0x6D2A, 0x6D2B, 0x6D2C, 0x6D2D, 0x6D2E, 0x6D2F, 0x6D30, 0x6D31, 0x6D32, 0x6D33, 0x6D34,
            0x6D35, 0x6D36, 0x6D37, 0x6D38, 0x6D39, 0x6D3A, 0x6D3B, 0x6D3C, 0x6D3D, 0x6D3E, 0x6D3F, 0x6D40, 0x6D41, 0x6D42, 0x6D43, 0x6D44,
            0x6D45, 0x6D46, 0x6D47, 0x6D48, 0x6D49, 0x6D4A, 0x6D4B, 0x6D4C, 0x6D4D, 0x6D4E, 0x6D4F, 0x6D50, 0x6D51, 0x6D52, 0x6D53, 0x8000,
            0x8002, 0x8003, 0x8004, 0x8005, 0x8006, 0x8007, 0x8008, 0x8009, 0x800A, 0x800B, 0x800C, 0x800E, 0x800F, 0x8010, 0x8011, 0x8014,
            0x8015, 0x8016, 0x8017, 0x8018, 0x8019, 0x801A, 0xA000, 0xA002, 0xA003, 0xA004, 0xA005, 0xA006, 0xA007, 0xA008, 0xA009, 0xA00A,
            0xA00B, 0xA00C, 0xA00D, 0xA00E, 0xA00F, 0xA010, 0xA011, 0xA012, 0xA013, 0xA014, 0xA015, 0xA016, 0xA017, 0xA018, 0xA019, 0xA01A,
            0xA01B, 0xA01D, 0xA01E, 0xA01F, 0xA020, 0xA021, 0xA900, 0xA902, 0xA903, 0xA904, 0xA905, 0xA906, 0xA907, 0xA908, 0xA909, 0xA90A,
            0xA90C, 0xA90D, 0xA90E, 0xA90F, 0xA910, 0xA911, 0xA912, 0xA913, 0xA914, 0xA915, 0xA916, 0xA917, 0xA918, 0xA919, 0xA91A, 0xA91C,
            0xA91D, 0xA91E, 0xA91F, 0xA920, 0xA921, 0xA922, 0xA923, 0xA924, 0xA925,
        ]

    private static let diffForm: [Int] = [
        05, 05, 02, 02, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05,
        05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05,
        05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 03, 05, 05, 05, 05, 13,
        14, 14, 14, 14, 14, 03, 03, 14, 03, 14, 14, 03, 14, 03, 14, 03,
        03, 14, 03, 03, 01, 03, 14, 01, 14, 14, 14, 17, 14, 17, 17, 14,
        14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 17, 17, 14,
        14, 14, 14, 14, 14, 01, 01, 01, 10, 07, 01, 01, 01, 01, 01, 01,
        00, 00, 00, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 01, 08,
        08, 17, 17, 17, 17, 17, 17, 09, 09, 17, 17, 17, 17, 09, 17, 17,
        17, 17, 17, 09, 09, 17, 17, 17, 17, 17, 17, 15, 17, 17, 17, 17,
        17, 17, 17, 17, 17, 15, 17, 15, 17, 17, 17, 15, 15, 10, 10, 10,
        15, 15, 10, 10, 15, 10, 10, 15, 10, 10, 15, 15, 15, 10, 10, 15,
        15, 10, 15, 10, 10, 10, 15, 10, 15, 15, 09, 10, 14, 14, 17, 17,
        14, 14, 14, 17, 14, 14, 14, 17, 14, 14, 17, 17, 17, 14, 14, 14,
        17, 14, 17, 14, 17, 17, 07, 07, 01, 07, 07, 10, 10, 10, 01, 07,
        07, 07, 16, 07, 10, 07, 07, 07, 07, 07, 01, 07, 01, 01, 07, 07,
        07, 10, 07, 07, 07, 01, 01, 10, 10, 01, 07, 07, 10, 01, 01, 07,
        07, 07, 07, 10, 07, 01, 10, 01, 07, 07, 09, 09, 09, 17, 09, 17,
        09, 17, 17, 09, 17, 17, 09, 17, 09, 17, 09, 17, 09, 17, 09, 17,
        17, 09, 09, 09, 09, 12, 12, 12, 15, 12, 12, 04, 12, 12, 08, 08,
        08, 08, 08, 08, 08, 08, 08, 06, 03, 03, 03, 08, 08, 03, 03, 03,
        03, 03, 08, 08, 08, 08, 08, 03, 00, 03, 03, 03, 03, 03, 02, 00,
        00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00,
        00, 00, 00, 01, 06, 06, 06, 08, 06, 08, 06, 08, 06, 06, 06, 06,
        06, 06, 06, 06, 06, 03, 08, 06, 06, 06, 06, 09, 09, 17, 16, 03,
        03, 03, 06, 08, 03, 03, 03, 03, 03, 03, 06, 06, 03, 03, 03, 03,
        08, 08, 06, 06, 06, 06, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08,
        08, 08, 08, 08, 08, 12, 12, 12, 12, 12, 12, 09, 12, 09, 09, 12,
        03, 03, 03, 03, 03, 00, 01, 02, 02, 01, 01, 01, 03, 02, 01, 03,
        01, 03, 03, 03, 00, 03, 03, 10, 01, 01, 01, 00, 10, 01, 03, 03,
        01, 10, 01, 00, 01, 10, 10, 01, 01, 10, 03, 10, 03, 01, 10, 00,
        01, 01, 01, 00, 01, 00, 01, 08, 01, 01, 03, 03, 03, 01, 01, 01,
        03, 00, 00, 01, 03, 01, 01, 01, 03, 01, 01, 01, 03, 08, 03, 00,
        01, 01, 03, 01, 10, 03, 10, 01, 01, 01, 01, 03, 03, 01, 01, 01,
        01, 01, 10, 03, 03, 00, 03, 01, 01, 12, 12, 09, 12, 09, 15, 12,
        12, 15, 12, 08, 08, 08, 08, 08, 08, 12, 08, 08, 08, 06, 08, 08,
        08, 08, 08, 08, 08, 08, 08, 03, 03, 03, 03, 03, 03, 03, 03, 01,
        00, 00, 03, 01, 01, 03, 03, 01, 03, 03, 03, 03, 03, 11, 11, 08,
        08, 08, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 08, 11, 11, 08,
        11, 11, 08, 08, 11, 08, 08, 08, 11, 08, 11, 11, 08, 08, 11, 08,
        11, 11, 11, 11, 08, 08, 11, 08, 11, 11, 08, 08, 11, 08, 11, 08,
        10, 10, 08, 10, 08, 11, 11, 08, 11, 08, 08, 11, 08, 08, 11, 11,
        08, 10, 08, 11, 08, 11, 08, 11, 11, 11, 10, 08, 11, 11, 08, 13,
        13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13,
        13, 13, 13, 03, 03, 03, 03, 03, 13, 03, 03, 03, 03, 03, 03, 13,
        03, 03, 01, 03, 03, 03, 03, 03, 01, 01, 03, 03, 03, 03, 03, 13,
        03, 13, 10, 03, 10, 13, 13, 13, 13, 13, 13, 03, 13, 13, 03, 03,
        17, 13, 13, 13, 13, 13, 13, 13, 13, 03, 13, 13, 13, 13, 13, 13,
        13, 13, 13, 13, 13, 13, 13, 03, 13,
    ]

    private static func getConsoleRegionFlag(consoleRegion: Int) -> Region3DSFlags {
        return Region3DSFlags(rawValue: 1 << consoleRegion)
    }

    /// Compares the Vivillon pattern against its region to determine legality.
    static func isPatternValid(form: Int, consoleRegion: Int) -> Bool {
        return if form >= Vivillon3DS.regionTable.count {
            false
        } else {
            Vivillon3DS.regionTable[form].hasFlag(getConsoleRegionFlag(consoleRegion: consoleRegion))
        }
    }

    /// Compares the pattern against its country and subregion to dertermine if could have natively been obtained
    static func isPatternNative(form: Int, country: Int, region: Int) -> Bool {
        if form > Vivillon3DS.maxWildFormID {
            return false
        }

        if country >= Vivillon3DS.sameCountry.count {
            return false
        }

        let same = Vivillon3DS.sameCountry[country]
        if same != Vivillon3DS.XX {
            return form == same
        }

        let tuple: Int = (country << 8) | region
        let index = Vivillon3DS.diffCountryRegion.firstIndex(of: tuple) ?? -1

        return if index >= 0 {
            form == Vivillon3DS.diffForm[index]
        } else {
            false
        }
    }

    /// Gets a compatible Vivillon pattern based on its country and subregion
    static func getPattern(country: Int, region: Int) -> Int {
        if country >= Vivillon3DS.sameCountry.count {
            return 0
        }

        let same = Vivillon3DS.sameCountry[country]
        if same != Vivillon3DS.XX {
            return same
        }

        let tuple: Int = (country << 8) | region
        let index = Vivillon3DS.diffCountryRegion.firstIndex(of: tuple) ?? -1

        return if index >= 0 {
            Vivillon3DS.diffForm[index]
        } else {
            0
        }
    }
}

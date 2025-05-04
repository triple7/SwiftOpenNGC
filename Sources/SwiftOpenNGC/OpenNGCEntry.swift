//
//  OpenNGCEntry.swift
//  SwiftOpenNGC
//
//  Created by Yuma decaux on 3/5/2025.
//


import Foundation

/// A single row from the OpenNGC CSV.
public struct OpenNGCEntry: Codable {
    public let name: String
    public let type: NGCType
    public let ra: Float
    public let dec: Float
    public var constellation: String?
    public var majAx:Float?
    public var minAx: Float?
    public var posAng:Float?
    public var bMag:Float?
    public var vMag:Float?
    public var jMag:Float?
    public var hMag:Float?
    public var kMag:Float?
    public var surfBr: Float?
    public var hubble: String?
    public var cstarUMag:Float?
    public var cstarBMag:Float?
    public var cstarVMag:Float?
    public var m:Float?
    public var ngc: String?
    public var ic: String?
    public var cstarNames: String?
    public var identifiers: String?
    public var commonNames: String?
    public var nedNotes: String?
    public var openNGCNotes: String?

    enum CodingKeys: String, CodingKey {
        case name            = "Name"
        case type            = "Type"
        case ra              = "RA"
        case dec             = "Dec"
        case constellation   = "Const"
        case majAx           = "MajAx"
        case minAx           = "MinAx"
        case posAng          = "PosAng"
        case bMag            = "B-Mag"
        case vMag            = "V-Mag"
        case jMag            = "J-Mag"
        case hMag            = "H-Mag"
        case kMag            = "K-Mag"
        case surfBr          = "SurfBr"
        case hubble          = "Hubble"
        case cstarUMag       = "Cstar U-Mag"
        case cstarBMag       = "Cstar B-Mag"
        case cstarVMag       = "Cstar V-Mag"
        case m               = "M"
        case ngc             = "NGC"
        case ic              = "IC"
        case cstarNames      = "Cstar Names"
        case identifiers     = "Identifiers"
        case commonNames     = "Common names"
        case nedNotes        = "NED notes"
        case openNGCNotes    = "OpenNGC notes"
    }
}

/// An enum of all OpenNGC column keys.
public enum OpenNGC_column: String, Codable, CaseIterable {
    case name          = "Name"
    case type          = "Type"
    case ra            = "RA"
    case dec           = "Dec"
    case constellation = "Const"
    case majAx         = "MajAx"
    case minAx         = "MinAx"
    case posAng        = "PosAng"
    case bMag          = "B-Mag"
    case vMag          = "V-Mag"
    case jMag          = "J-Mag"
    case hMag          = "H-Mag"
    case kMag          = "K-Mag"
    case surfBr        = "SurfBr"
    case hubble        = "Hubble"
    case cstarUMag     = "Cstar U-Mag"
    case cstarBMag     = "Cstar B-Mag"
    case cstarVMag     = "Cstar V-Mag"
    case m             = "M"
    case ngc           = "NGC"
    case ic            = "IC"
    case cstarNames    = "Cstar Names"
    case identifiers   = "Identifiers"
    case commonNames   = "Common names"
    case nedNotes      = "NED notes"
    case openNGCNotes  = "OpenNGC notes"
}

import Foundation

/// NGC object types
public enum NGCType: String, Codable, CaseIterable, Identifiable {
    case star               = "*"
    case doubleStar         = "**"
    case association        = "*Ass"
    case openCluster        = "OCl"
    case globularCluster    = "GCl"
    case clusterPlusNebula  = "Cl+N"
    case galaxy             = "G"
    case galaxyPair         = "GPair"
    case galaxyTriplet      = "GTrpl"
    case galaxyGroup        = "GGroup"
    case planetaryNebula    = "PN"
    case hIIRegion          = "HII"
    case darkNebula         = "DrkN"
    case emissionNebula     = "EmN"
    case nebula             = "Neb"
    case reflectionNebula   = "RfN"
    case supernovaRemnant   = "SNR"
    case novaStar           = "Nova"
    case nonExistent        = "NonEx"

    public var id: String { rawValue }
}


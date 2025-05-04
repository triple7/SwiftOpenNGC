//
//  OpenNGCEntry.swift
//  SwiftOpenNGC
//
//  Created by Yuma decaux on 3/5/2025.
//


import Foundation

public struct OpenNGCEntry: Codable {
    public let name: String
    public let objType: String
    public let raj2000: Int
    public let dej2000: Int
    public var constellation: String?
    public var majAxDeg: Float?
    public var minAxDeg: Float?
    public var posAng: Float?
    public var magB: Float?
    public var magV: Float?
    public var magJ: Float?
    public var magH: Float?
    public var magK:Float?
    public var surfBrB:String?
    public var hubbleType: String?
    public var pmRa: Float?
    public var pmDec:Float?
    public var rv: Float?
    public var z: Float?
    public var cstarMagU: Float?
    public var cstarMagB: Float?
    public var cstarMagV: Float?
    public var messierNr: Int?
    public var otherNgc: String?
    public let icCross: String?
    public var cstarId: Int?
    public var otherId: String?
    public var comName: String?
    public var nedNotes: String?
    public var sources: String?
    public var notes: String?

    enum CodingKeys: String, CodingKey {
        case name           = "name"
        case objType        = "obj_type"
        case raj2000        = "raj2000"
        case dej2000        = "dej2000"
        case constellation  = "constellation"
        case majAxDeg       = "maj_ax_deg"
        case minAxDeg       = "min_ax_deg"
        case posAng         = "pos_ang"
        case magB           = "mag_b"
        case magV           = "mag_v"
        case magJ           = "mag_j"
        case magH           = "mag_h"
        case magK           = "mag_k"
        case surfBrB        = "surf_br_B"
        case hubbleType     = "hubble_type"
        case pmRa           = "pmra"
        case pmDec          = "pmdec"
        case rv             = "rv"
        case z              = "z"
        case cstarMagU      = "cstar_mag_u"
        case cstarMagB      = "cstar_mag_b"
        case cstarMagV      = "cstar_mag_v"
        case messierNr      = "messier_nr"
        case otherNgc       = "other_ngc"
        case icCross        = "ic_cross"
        case cstarId        = "cstar_id"
        case otherId        = "other_id"
        case comName        = "comname"
        case nedNotes       = "ned_notes"
        case sources        = "sources"
        case notes          = "notes"
    }
}

public enum OpenNGC_column: String, CaseIterable {
    case name          = "name"
    case objType       = "obj_type"
    case raj2000       = "raj2000"
    case dej2000       = "dej2000"
    case constellation = "constellation"
    case majAxDeg      = "maj_ax_deg"
    case minAxDeg      = "min_ax_deg"
    case posAng        = "pos_ang"
    case magB          = "mag_b"
    case magV          = "mag_v"
    case magJ          = "mag_j"
    case magH          = "mag_h"
    case magK          = "mag_k"
    case surfBrB       = "surf_br_B"
    case hubbleType    = "hubble_type"
    case pmRa          = "pmra"
    case pmDec         = "pmdec"
    case rv            = "rv"
    case z             = "z"
    case cstarMagU     = "cstar_mag_u"
    case cstarMagB     = "cstar_mag_b"
    case cstarMagV     = "cstar_mag_v"
    case messierNr     = "messier_nr"
    case otherNgc      = "other_ngc"
    case icCross       = "ic_cross"
    case cstarId       = "cstar_id"
    case otherId       = "other_id"
    case comName       = "comname"
    case nedNotes      = "ned_notes"
    case sources       = "sources"
    case notes         = "notes"

    /// Human-readable description for each column
    public var description: String {
        switch self {
        case .name:
            return "Name"
        case .objType:
            return "Object Type"
        case .raj2000:
            return "RA (J2000)"
        case .dej2000:
            return "Dec (J2000)"
        case .constellation:
            return "Constellation"
        case .majAxDeg:
            return "Major Axis (deg)"
        case .minAxDeg:
            return "Minor Axis (deg)"
        case .posAng:
            return "Position Angle"
        case .magB:
            return "B Magnitude"
        case .magV:
            return "V Magnitude"
        case .magJ:
            return "J Magnitude"
        case .magH:
            return "H Magnitude"
        case .magK:
            return "K Magnitude"
        case .surfBrB:
            return "Surface Brightness (B)"
        case .hubbleType:
            return "Hubble Type"
        case .pmRa:
            return "Proper Motion RA"
        case .pmDec:
            return "Proper Motion Dec"
        case .rv:
            return "Radial Velocity"
        case .z:
            return "Redshift"
        case .cstarMagU:
            return "Central Star U Magnitude"
        case .cstarMagB:
            return "Central Star B Magnitude"
        case .cstarMagV:
            return "Central Star V Magnitude"
        case .messierNr:
            return "Messier Number"
        case .otherNgc:
            return "Other NGC"
        case .icCross:
            return "IC Cross"
        case .cstarId:
            return "Central Star ID"
        case .otherId:
            return "Other ID"
        case .comName:
            return "Common Name"
        case .nedNotes:
            return "NED Notes"
        case .sources:
            return "Sources"
        case .notes:
            return "Notes"
        }
    }
}

import Foundation

enum Unit: Int {
    case mm = 0, cm, m, km

    static func allCases() -> [String] {
        var i = 0
        var list = [String]()
        while let unit = Unit(rawValue: i) {
            list.append(unit.description())
            i = i + 1
        }
        return list
    }

    func description() -> String {
        switch self {
        case .mm:
            return "mm"
        case .cm:
            return "cm"
        case .m:
            return "m"
        case .km:
            return "km"
        }
    }

    static func fromString(_ string: String) -> Unit? {
        if string == "mm" {
            return .mm
        } else if string == "cm" {
            return .cm
        } else if string == "m" {
            return .m
        } else if string == "km" {
            return .km
        } else {
            return nil
        }
    }

    func convertTo(unit to: Unit, value val: Double) -> Double {
        var constant = 1.0
        switch self {
        case .mm:
            if to == .cm {
                constant = 0.1
            } else if to == .m {
                constant = 0.001
            } else if to == .km {
                constant = 1e-6
            }
        case .cm:
            if to == .mm {
                constant = 10
            } else if to == .m {
                constant = 0.01
            } else if to == .km {
                constant = 1e-5
            }
        case .m:
            if to == .mm {
                constant = 1000
            } else if to == .cm {
                constant = 100
            } else if to == .km {
                constant = 0.001
            }
        case .km:
            if to == .mm {
                constant = 1e+6
            } else if to == .cm {
                constant = 100000
            } else if to == .m {
                constant = 1000
            }
        }
        return constant * val
    }
}

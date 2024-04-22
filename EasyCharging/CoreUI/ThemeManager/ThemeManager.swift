//
//  ThemeManager.swift
//  SwiftUI-BoilerPlate
//
//  Created by Suraj Bhandari on 15/03/2023.
//

import UIKit

public protocol Theme {
    var primary: UIColor { get }
    var secondary: UIColor { get }
    var text: UIColor { get }
    var textGray: UIColor { get }
    var background: UIColor { get }
    var backgroundDark: UIColor { get }
    var clear: UIColor { get }
    var lightGray: UIColor { get }
}

struct LightTheme: Theme {
    let primary: UIColor = UIColor.darkGray
    let secondary: UIColor = UIColor.white
    let text: UIColor = UIColor.darkText
    let textGray: UIColor = UIColor.darkGray
    let background: UIColor = UIColor.white
    var backgroundDark: UIColor = UIColor.black
    var clear: UIColor = UIColor.clear
    var lightGray: UIColor = UIColor.lightGray
}

struct DarkTheme: Theme {
    let primary: UIColor = UIColor.black
    let secondary: UIColor = UIColor.white
    let text: UIColor = UIColor.darkText
    let textGray: UIColor = UIColor.darkGray
    let background: UIColor = UIColor.white
    var backgroundDark: UIColor = UIColor.black
    var clear: UIColor = UIColor.clear
    var lightGray: UIColor = UIColor.lightGray
}

public enum ColorThemeType {
    case primary, secondary, tertiary

    static let allValues = [primary, secondary, tertiary]
}

public enum ThemeType {
    case light
    case dark

    public var associatedObject: Theme {
        switch self {
        case .light: return LightTheme()
        case .dark: return DarkTheme()
        }
    }

    var isDark: Bool {
        switch self {
        case .dark: return true
        default: return false
        }
    }

    public func toggled() {
        var theme: ThemeType
        switch self {
        case .light: theme = ThemeType.light
        case .dark: theme = ThemeType.dark
        }
        theme.save()
    }
}

extension ThemeType {
    public static func currentTheme() -> ThemeType {
        let defaults = UserDefaults.standard
        let isDark = defaults.bool(forKey: "IsDarkKey")
        let theme = isDark ? ThemeType.dark : ThemeType.light
        return theme
    }

    public static func defaultTheme() {
        let defaults = UserDefaults.standard
        let isDark = defaults.bool(forKey: "IsDarkKey")
        let theme = isDark ? ThemeType.dark : ThemeType.light
        theme.save()
    }

    func save() {
        let defaults = UserDefaults.standard
        defaults.set(self.isDark, forKey: "IsDarkKey")
        NotificationCenter.default.post(name: .themeToggled, object: self)
    }
}



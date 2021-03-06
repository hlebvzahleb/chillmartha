//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `TimerSelectorViewController`.
    static let timerSelectorViewController = _R.storyboard.timerSelectorViewController()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "TimerSelectorViewController", bundle: ...)`
    static func timerSelectorViewController(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.timerSelectorViewController)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 13 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `SeaPrimaryColor`.
    static let seaPrimaryColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "SeaPrimaryColor")
    /// Color `backgroundColor`.
    static let backgroundColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "backgroundColor")
    /// Color `buttonActionBackgroundDefault`.
    static let buttonActionBackgroundDefault = Rswift.ColorResource(bundle: R.hostingBundle, name: "buttonActionBackgroundDefault")
    /// Color `buttonActionBackgroundFire`.
    static let buttonActionBackgroundFire = Rswift.ColorResource(bundle: R.hostingBundle, name: "buttonActionBackgroundFire")
    /// Color `buttonActionBackgroundForest`.
    static let buttonActionBackgroundForest = Rswift.ColorResource(bundle: R.hostingBundle, name: "buttonActionBackgroundForest")
    /// Color `buttonActionBackgroundRain`.
    static let buttonActionBackgroundRain = Rswift.ColorResource(bundle: R.hostingBundle, name: "buttonActionBackgroundRain")
    /// Color `buttonActionBackgroundSea`.
    static let buttonActionBackgroundSea = Rswift.ColorResource(bundle: R.hostingBundle, name: "buttonActionBackgroundSea")
    /// Color `dimBackgroundColor`.
    static let dimBackgroundColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "dimBackgroundColor")
    /// Color `firePrimaryColor`.
    static let firePrimaryColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "firePrimaryColor")
    /// Color `forestPrimaryColor`.
    static let forestPrimaryColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "forestPrimaryColor")
    /// Color `rainPrimaryColor`.
    static let rainPrimaryColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "rainPrimaryColor")
    /// Color `sliderThumbColor`.
    static let sliderThumbColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "sliderThumbColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "SeaPrimaryColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func seaPrimaryColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.seaPrimaryColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "backgroundColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func backgroundColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.backgroundColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "buttonActionBackgroundDefault", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func buttonActionBackgroundDefault(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.buttonActionBackgroundDefault, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "buttonActionBackgroundFire", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func buttonActionBackgroundFire(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.buttonActionBackgroundFire, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "buttonActionBackgroundForest", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func buttonActionBackgroundForest(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.buttonActionBackgroundForest, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "buttonActionBackgroundRain", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func buttonActionBackgroundRain(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.buttonActionBackgroundRain, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "buttonActionBackgroundSea", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func buttonActionBackgroundSea(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.buttonActionBackgroundSea, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "dimBackgroundColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func dimBackgroundColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.dimBackgroundColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "firePrimaryColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func firePrimaryColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.firePrimaryColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "forestPrimaryColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func forestPrimaryColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.forestPrimaryColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "rainPrimaryColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func rainPrimaryColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.rainPrimaryColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "sliderThumbColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func sliderThumbColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.sliderThumbColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "SeaPrimaryColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func seaPrimaryColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.seaPrimaryColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "backgroundColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func backgroundColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.backgroundColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "buttonActionBackgroundDefault", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func buttonActionBackgroundDefault(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.buttonActionBackgroundDefault.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "buttonActionBackgroundFire", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func buttonActionBackgroundFire(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.buttonActionBackgroundFire.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "buttonActionBackgroundForest", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func buttonActionBackgroundForest(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.buttonActionBackgroundForest.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "buttonActionBackgroundRain", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func buttonActionBackgroundRain(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.buttonActionBackgroundRain.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "buttonActionBackgroundSea", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func buttonActionBackgroundSea(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.buttonActionBackgroundSea.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "dimBackgroundColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func dimBackgroundColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.dimBackgroundColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "firePrimaryColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func firePrimaryColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.firePrimaryColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "forestPrimaryColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func forestPrimaryColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.forestPrimaryColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "rainPrimaryColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func rainPrimaryColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.rainPrimaryColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "sliderThumbColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func sliderThumbColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.sliderThumbColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `GoogleService-Info.plist`.
    static let googleServiceInfoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "GoogleService-Info", pathExtension: "plist")
    /// Resource file `Res`.
    static let res = Rswift.FileResource(bundle: R.hostingBundle, name: "Res", pathExtension: "")

    /// `bundle.url(forResource: "GoogleService-Info", withExtension: "plist")`
    static func googleServiceInfoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.googleServiceInfoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Res", withExtension: "")`
    static func res(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.res
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 25 images.
  struct image {
    /// Image `ColorfullRain`.
    static let colorfullRain = Rswift.ImageResource(bundle: R.hostingBundle, name: "ColorfullRain")
    /// Image `arrowDown`.
    static let arrowDown = Rswift.ImageResource(bundle: R.hostingBundle, name: "arrowDown")
    /// Image `arrowUp`.
    static let arrowUp = Rswift.ImageResource(bundle: R.hostingBundle, name: "arrowUp")
    /// Image `classicImage`.
    static let classicImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "classicImage")
    /// Image `colorfullFire`.
    static let colorfullFire = Rswift.ImageResource(bundle: R.hostingBundle, name: "colorfullFire")
    /// Image `colorfullForest`.
    static let colorfullForest = Rswift.ImageResource(bundle: R.hostingBundle, name: "colorfullForest")
    /// Image `colorfullSea`.
    static let colorfullSea = Rswift.ImageResource(bundle: R.hostingBundle, name: "colorfullSea")
    /// Image `colorlessFire`.
    static let colorlessFire = Rswift.ImageResource(bundle: R.hostingBundle, name: "colorlessFire")
    /// Image `colorlessForest`.
    static let colorlessForest = Rswift.ImageResource(bundle: R.hostingBundle, name: "colorlessForest")
    /// Image `colorlessRain`.
    static let colorlessRain = Rswift.ImageResource(bundle: R.hostingBundle, name: "colorlessRain")
    /// Image `colorlessSea`.
    static let colorlessSea = Rswift.ImageResource(bundle: R.hostingBundle, name: "colorlessSea")
    /// Image `cross`.
    static let cross = Rswift.ImageResource(bundle: R.hostingBundle, name: "cross")
    /// Image `fireIcon`.
    static let fireIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "fireIcon")
    /// Image `forestIcon`.
    static let forestIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "forestIcon")
    /// Image `hamburger`.
    static let hamburger = Rswift.ImageResource(bundle: R.hostingBundle, name: "hamburger")
    /// Image `homeButton`.
    static let homeButton = Rswift.ImageResource(bundle: R.hostingBundle, name: "homeButton")
    /// Image `iconStub`.
    static let iconStub = Rswift.ImageResource(bundle: R.hostingBundle, name: "iconStub")
    /// Image `jazzIcon`.
    static let jazzIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "jazzIcon")
    /// Image `loFiImage`.
    static let loFiImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "loFiImage")
    /// Image `musicIcon`.
    static let musicIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "musicIcon")
    /// Image `rainIcon`.
    static let rainIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "rainIcon")
    /// Image `screenImage`.
    static let screenImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "screenImage")
    /// Image `seaIcon`.
    static let seaIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "seaIcon")
    /// Image `sliderThumb`.
    static let sliderThumb = Rswift.ImageResource(bundle: R.hostingBundle, name: "sliderThumb")
    /// Image `timerIcon`.
    static let timerIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "timerIcon")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ColorfullRain", bundle: ..., traitCollection: ...)`
    static func colorfullRain(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.colorfullRain, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "arrowDown", bundle: ..., traitCollection: ...)`
    static func arrowDown(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.arrowDown, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "arrowUp", bundle: ..., traitCollection: ...)`
    static func arrowUp(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.arrowUp, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "classicImage", bundle: ..., traitCollection: ...)`
    static func classicImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.classicImage, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "colorfullFire", bundle: ..., traitCollection: ...)`
    static func colorfullFire(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.colorfullFire, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "colorfullForest", bundle: ..., traitCollection: ...)`
    static func colorfullForest(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.colorfullForest, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "colorfullSea", bundle: ..., traitCollection: ...)`
    static func colorfullSea(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.colorfullSea, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "colorlessFire", bundle: ..., traitCollection: ...)`
    static func colorlessFire(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.colorlessFire, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "colorlessForest", bundle: ..., traitCollection: ...)`
    static func colorlessForest(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.colorlessForest, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "colorlessRain", bundle: ..., traitCollection: ...)`
    static func colorlessRain(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.colorlessRain, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "colorlessSea", bundle: ..., traitCollection: ...)`
    static func colorlessSea(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.colorlessSea, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "cross", bundle: ..., traitCollection: ...)`
    static func cross(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.cross, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "fireIcon", bundle: ..., traitCollection: ...)`
    static func fireIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.fireIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "forestIcon", bundle: ..., traitCollection: ...)`
    static func forestIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.forestIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "hamburger", bundle: ..., traitCollection: ...)`
    static func hamburger(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.hamburger, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "homeButton", bundle: ..., traitCollection: ...)`
    static func homeButton(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.homeButton, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "iconStub", bundle: ..., traitCollection: ...)`
    static func iconStub(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconStub, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "jazzIcon", bundle: ..., traitCollection: ...)`
    static func jazzIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.jazzIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "loFiImage", bundle: ..., traitCollection: ...)`
    static func loFiImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.loFiImage, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "musicIcon", bundle: ..., traitCollection: ...)`
    static func musicIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.musicIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "rainIcon", bundle: ..., traitCollection: ...)`
    static func rainIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.rainIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "screenImage", bundle: ..., traitCollection: ...)`
    static func screenImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.screenImage, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "seaIcon", bundle: ..., traitCollection: ...)`
    static func seaIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.seaIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "sliderThumb", bundle: ..., traitCollection: ...)`
    static func sliderThumb(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sliderThumb, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "timerIcon", bundle: ..., traitCollection: ...)`
    static func timerIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.timerIcon, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 4 localization keys.
    struct localizable {
      /// Value: +%@ min
      static let popupTimerRestTimeValue = Rswift.StringResource(key: "popup.timer.restTime.value", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Rest time
      static let popupTimerRestTimeTitle = Rswift.StringResource(key: "popup.timer.restTime.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Start
      static let popupTimerStart = Rswift.StringResource(key: "popup.timer.start", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Timer
      static let popupTimerTitle = Rswift.StringResource(key: "popup.timer.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: +%@ min
      static func popupTimerRestTimeValue(_ value1: String, preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          let format = NSLocalizedString("popup.timer.restTime.value", bundle: hostingBundle, comment: "")
          return String(format: format, locale: applicationLocale, value1)
        }

        guard let (locale, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "popup.timer.restTime.value"
        }

        let format = NSLocalizedString("popup.timer.restTime.value", bundle: bundle, comment: "")
        return String(format: format, locale: locale, value1)
      }

      /// Value: Rest time
      static func popupTimerRestTimeTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("popup.timer.restTime.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "popup.timer.restTime.title"
        }

        return NSLocalizedString("popup.timer.restTime.title", bundle: bundle, comment: "")
      }

      /// Value: Start
      static func popupTimerStart(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("popup.timer.start", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "popup.timer.start"
        }

        return NSLocalizedString("popup.timer.start", bundle: bundle, comment: "")
      }

      /// Value: Timer
      static func popupTimerTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("popup.timer.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "popup.timer.title"
        }

        return NSLocalizedString("popup.timer.title", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try timerSelectorViewController.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct timerSelectorViewController: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = TimerSelectorViewController

      let bundle = R.hostingBundle
      let name = "TimerSelectorViewController"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}

//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
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
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `Home`.
    static let home = _R.storyboard.home()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Login`.
    static let login = _R.storyboard.login()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Home", bundle: ...)`
    static func home(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.home)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Login", bundle: ...)`
    static func login(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.login)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `cello`.
    static let cello = Rswift.ColorResource(bundle: R.hostingBundle, name: "cello")
    /// Color `oslo-grey`.
    static let osloGrey = Rswift.ColorResource(bundle: R.hostingBundle, name: "oslo-grey")
    /// Color `warning`.
    static let warning = Rswift.ColorResource(bundle: R.hostingBundle, name: "warning")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "cello", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func cello(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.cello, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "oslo-grey", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func osloGrey(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.osloGrey, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "warning", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func warning(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.warning, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 6 files.
  struct file {
    /// Resource file `Lato-Bold.ttf`.
    static let latoBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Lato-Bold", pathExtension: "ttf")
    /// Resource file `Lato-BoldItalic.ttf`.
    static let latoBoldItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Lato-BoldItalic", pathExtension: "ttf")
    /// Resource file `Lato-Italic.ttf`.
    static let latoItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Lato-Italic", pathExtension: "ttf")
    /// Resource file `Lato-Light.ttf`.
    static let latoLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Lato-Light", pathExtension: "ttf")
    /// Resource file `Lato-LightItalic.ttf`.
    static let latoLightItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Lato-LightItalic", pathExtension: "ttf")
    /// Resource file `Lato-Regular.ttf`.
    static let latoRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Lato-Regular", pathExtension: "ttf")

    /// `bundle.url(forResource: "Lato-Bold", withExtension: "ttf")`
    static func latoBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.latoBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Lato-BoldItalic", withExtension: "ttf")`
    static func latoBoldItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.latoBoldItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Lato-Italic", withExtension: "ttf")`
    static func latoItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.latoItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Lato-Light", withExtension: "ttf")`
    static func latoLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.latoLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Lato-LightItalic", withExtension: "ttf")`
    static func latoLightItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.latoLightItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Lato-Regular", withExtension: "ttf")`
    static func latoRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.latoRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 6 fonts.
  struct font: Rswift.Validatable {
    /// Font `Lato-BoldItalic`.
    static let latoBoldItalic = Rswift.FontResource(fontName: "Lato-BoldItalic")
    /// Font `Lato-Bold`.
    static let latoBold = Rswift.FontResource(fontName: "Lato-Bold")
    /// Font `Lato-Italic`.
    static let latoItalic = Rswift.FontResource(fontName: "Lato-Italic")
    /// Font `Lato-LightItalic`.
    static let latoLightItalic = Rswift.FontResource(fontName: "Lato-LightItalic")
    /// Font `Lato-Light`.
    static let latoLight = Rswift.FontResource(fontName: "Lato-Light")
    /// Font `Lato-Regular`.
    static let latoRegular = Rswift.FontResource(fontName: "Lato-Regular")

    /// `UIFont(name: "Lato-Bold", size: ...)`
    static func latoBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: latoBold, size: size)
    }

    /// `UIFont(name: "Lato-BoldItalic", size: ...)`
    static func latoBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: latoBoldItalic, size: size)
    }

    /// `UIFont(name: "Lato-Italic", size: ...)`
    static func latoItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: latoItalic, size: size)
    }

    /// `UIFont(name: "Lato-Light", size: ...)`
    static func latoLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: latoLight, size: size)
    }

    /// `UIFont(name: "Lato-LightItalic", size: ...)`
    static func latoLightItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: latoLightItalic, size: size)
    }

    /// `UIFont(name: "Lato-Regular", size: ...)`
    static func latoRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: latoRegular, size: size)
    }

    static func validate() throws {
      if R.font.latoBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Lato-Bold' could not be loaded, is 'Lato-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.latoBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Lato-BoldItalic' could not be loaded, is 'Lato-BoldItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.latoItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Lato-Italic' could not be loaded, is 'Lato-Italic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.latoLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Lato-Light' could not be loaded, is 'Lato-Light.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.latoLightItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Lato-LightItalic' could not be loaded, is 'Lato-LightItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.latoRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Lato-Regular' could not be loaded, is 'Lato-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 4 images.
  struct image {
    /// Image `lock`.
    static let lock = Rswift.ImageResource(bundle: R.hostingBundle, name: "lock")
    /// Image `person`.
    static let person = Rswift.ImageResource(bundle: R.hostingBundle, name: "person")
    /// Image `visibility-off`.
    static let visibilityOff = Rswift.ImageResource(bundle: R.hostingBundle, name: "visibility-off")
    /// Image `visibility-on`.
    static let visibilityOn = Rswift.ImageResource(bundle: R.hostingBundle, name: "visibility-on")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "lock", bundle: ..., traitCollection: ...)`
    static func lock(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.lock, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "person", bundle: ..., traitCollection: ...)`
    static func person(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.person, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "visibility-off", bundle: ..., traitCollection: ...)`
    static func visibilityOff(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.visibilityOff, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "visibility-on", bundle: ..., traitCollection: ...)`
    static func visibilityOn(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.visibilityOn, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `TextFieldView`.
    static let textFieldView = _R.nib._TextFieldView()
    /// Nib `UserTableViewCell`.
    static let userTableViewCell = _R.nib._UserTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "TextFieldView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.textFieldView) instead")
    static func textFieldView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.textFieldView)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "UserTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.userTableViewCell) instead")
    static func userTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.userTableViewCell)
    }
    #endif

    static func textFieldView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.textFieldView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func userTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UserTableViewCell? {
      return R.nib.userTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UserTableViewCell
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `UserTableViewCell`.
    static let userTableViewCell: Rswift.ReuseIdentifier<UserTableViewCell> = Rswift.ReuseIdentifier(identifier: "UserTableViewCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 8 localization keys.
    struct localizable {
      /// Value: Email
      static let email = Rswift.StringResource(key: "Email", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Loading
      static let loading = Rswift.StringResource(key: "Loading", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Login Error
      static let loginError = Rswift.StringResource(key: "Login Error", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ok
      static let ok = Rswift.StringResource(key: "Ok", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Password
      static let password = Rswift.StringResource(key: "Password", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Users
      static let users = Rswift.StringResource(key: "Users", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Your %@ invalid. Kindly check and try again.
      static let yourInvalidKindlyCheckAndTryAgain = Rswift.StringResource(key: "Your %@ invalid. Kindly check and try again.", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Your email or password is incorrect. Kindly check and try again.
      static let yourEmailOrPasswordIsIncorrectKindlyCheckAndTryAgain = Rswift.StringResource(key: "Your email or password is incorrect. Kindly check and try again.", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Email
      static func email(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Email", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Email"
        }

        return NSLocalizedString("Email", bundle: bundle, comment: "")
      }

      /// Value: Loading
      static func loading(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Loading", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Loading"
        }

        return NSLocalizedString("Loading", bundle: bundle, comment: "")
      }

      /// Value: Login Error
      static func loginError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Login Error", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Login Error"
        }

        return NSLocalizedString("Login Error", bundle: bundle, comment: "")
      }

      /// Value: Ok
      static func ok(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Ok", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Ok"
        }

        return NSLocalizedString("Ok", bundle: bundle, comment: "")
      }

      /// Value: Password
      static func password(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Password", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Password"
        }

        return NSLocalizedString("Password", bundle: bundle, comment: "")
      }

      /// Value: Users
      static func users(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Users", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Users"
        }

        return NSLocalizedString("Users", bundle: bundle, comment: "")
      }

      /// Value: Your %@ invalid. Kindly check and try again.
      static func yourInvalidKindlyCheckAndTryAgain(_ value1: String, preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          let format = NSLocalizedString("Your %@ invalid. Kindly check and try again.", bundle: hostingBundle, comment: "")
          return String(format: format, locale: applicationLocale, value1)
        }

        guard let (locale, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Your %@ invalid. Kindly check and try again."
        }

        let format = NSLocalizedString("Your %@ invalid. Kindly check and try again.", bundle: bundle, comment: "")
        return String(format: format, locale: locale, value1)
      }

      /// Value: Your email or password is incorrect. Kindly check and try again.
      static func yourEmailOrPasswordIsIncorrectKindlyCheckAndTryAgain(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Your email or password is incorrect. Kindly check and try again.", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Your email or password is incorrect. Kindly check and try again."
        }

        return NSLocalizedString("Your email or password is incorrect. Kindly check and try again.", bundle: bundle, comment: "")
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
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _TextFieldView.validate()
    }

    struct _TextFieldView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "TextFieldView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      static func validate() throws {
        if UIKit.UIImage(named: "person", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'person' is used in nib 'TextFieldView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "visibility-on", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'visibility-on' is used in nib 'TextFieldView', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "cello", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'cello' is used in storyboard 'TextFieldView', but couldn't be loaded.") }
          if UIKit.UIColor(named: "oslo-grey", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'oslo-grey' is used in storyboard 'TextFieldView', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }

    struct _UserTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = UserTableViewCell

      let bundle = R.hostingBundle
      let identifier = "UserTableViewCell"
      let name = "UserTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UserTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UserTableViewCell
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try home.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try login.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct home: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UserNavigationController

      let bundle = R.hostingBundle
      let name = "Home"
      let userNavigationController = StoryboardViewControllerResource<UserNavigationController>(identifier: "UserNavigationController")
      let userViewController = StoryboardViewControllerResource<UserViewController>(identifier: "UserViewController")

      func userNavigationController(_: Void = ()) -> UserNavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: userNavigationController)
      }

      func userViewController(_: Void = ()) -> UserViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: userViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "cello", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'cello' is used in storyboard 'Home', but couldn't be loaded.") }
        }
        if _R.storyboard.home().userNavigationController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'userNavigationController' could not be loaded from storyboard 'Home' as 'UserNavigationController'.") }
        if _R.storyboard.home().userViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'userViewController' could not be loaded from storyboard 'Home' as 'UserViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

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
    struct login: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = LoginViewController

      let bundle = R.hostingBundle
      let loginViewController = StoryboardViewControllerResource<LoginViewController>(identifier: "LoginViewController")
      let name = "Login"

      func loginViewController(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "cello", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'cello' is used in storyboard 'Login', but couldn't be loaded.") }
        }
        if _R.storyboard.login().loginViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginViewController' could not be loaded from storyboard 'Login' as 'LoginViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}

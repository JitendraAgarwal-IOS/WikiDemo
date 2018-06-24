
import Foundation
import UIKit

// Trim the String
    extension String {
        func removingWhitespaces() -> String {
            return components(separatedBy: .whitespaces).joined()
        }
    }

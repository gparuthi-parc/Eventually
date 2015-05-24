//: Playground - noun: a place where people can play

import UIKit

enum CountdownType: Int { case ToTheSecond, ToTheDay }
enum ColorScheme: Int { case AfterMidnight, ClassyYellow, Tealfish }

class Concern {
    var title: String = ""
    func title(aTitle: String?) -> Concern {
        title = aTitle ?? ""; return self
    }
    
    var subtitle = ""
    func subtitle(aSubtitle: String?) -> Concern {
        subtitle = aSubtitle ?? ""; return self
    }

    var countdownType: CountdownType = .ToTheSecond
    func countdownType(type: CountdownType) -> Concern {
        countdownType = type; return self
    }
    
    var colorScheme: ColorScheme = .AfterMidnight
    func colorScheme(scheme: ColorScheme) -> Concern {
        colorScheme = scheme; return self
    }
}

Concern()
    .title("Big Meeting")
    .subtitle("With those people")
    .countdownType(.ToTheDay)
    .colorScheme(.Tealfish)

//
//  StampImages.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/11.
//

import UIKit

struct StampImages {
    let image: UIImage
    var heartTapped: Bool
}

extension StampImages {
    static func dummy() -> [StampImages] {
        var stamps: [StampImages] = []
        for number in 1...9 {
            stamps.append(StampImages(image: UIImage(named: "Stamp\(number)")!,
                                heartTapped: false))
        }
        return stamps
    }
}

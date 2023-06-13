//
//  Images.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 07.06.2023.
//

import UIKit

struct Images{
    var image: String
    
    
    static func arrayOfImagesNames() -> [Images] {
        var array = [Images]()
        for i in 1...20 {
            array.append(Images(image:"image"+String(i)))
        }
        return array
    }
}

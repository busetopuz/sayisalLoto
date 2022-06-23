//
//  kolon.swift
//  sayisalLoto
//
//  Created by Buse Topuz on 23.06.2022.
//

import Foundation
class kolon{
    var sayilar: [Int] = []
    
    func asText()-> String{
        var r = ""
        
        for sayi in sayilar{
            r += "\(sayi),"
        }
        
        return r
        
        
    }
}

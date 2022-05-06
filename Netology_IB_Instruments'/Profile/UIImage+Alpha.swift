//
//  UIImage+Alpha.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 02.05.2022.
//

import UIKit

class UIImage_Alpha: UIImage {

}

extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

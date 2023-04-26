//
//  UIImage+.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/25.
//

import UIKit

extension UIImage {
    func resizeImage(image: UIImage, size: CGSize) -> CGImage {
        UIGraphicsBeginImageContext(size)
        image.draw(in:CGRect(x: 0, y: 0, width: size.width, height:size.height))
        let renderImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
            
        guard let resultImage = renderImage?.cgImage else {
            print("image resizing error")
            return UIImage().cgImage!
        }
        return resultImage
    }
}

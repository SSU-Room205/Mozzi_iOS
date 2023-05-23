//
//  LineView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/18.
//

import UIKit

final class LineView: UICollectionReusableView {
    static let identifier = "lineFooterView"
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        addBottomView()
    }
    
    func addBottomView() {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: bounds.size.height + 3))
            path.addLine(to: CGPoint(x: bounds.width, y: bounds.size.height + 3))
            path.close()

            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.lineWidth = path.lineWidth
            shapeLayer.fillColor = UIColor.mozziMain.cgColor
            shapeLayer.strokeColor = UIColor.mozziMain.cgColor
            layer.addSublayer(shapeLayer)
        }

}

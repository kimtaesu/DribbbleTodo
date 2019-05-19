import UIKit
class RoundShadowView: UIView {
    private var shadowLayer: CAShapeLayer?
    
    var cornerRadius: CGFloat = 4.0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = cornerRadius
        let shadowPath2 = UIBezierPath(rect: self.bounds)
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath2.cgPath
    }
}

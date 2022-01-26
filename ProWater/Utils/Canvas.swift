
import UIKit

struct Line {
    let strokeWidth: Float
    let color: UIColor
    var points: [CGPoint]
}

class Canvas: UIView {
    //banderaFirma
    var bandera : Bool = false
    //scrollView
    var viewScroll : UIScrollView? = nil
    // public function
    fileprivate var strokeColor = UIColor.black
    fileprivate var strokeWidth: Float = 1
    
    func setScrollView(viewScroll : UIScrollView){
        self.viewScroll = viewScroll
    }

    func setStrokeWidth(width: Float) {
        self.strokeWidth = width
    }

    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }

    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }

    func clear() {
        lines.removeAll()
        setNeedsDisplay()
        bandera = false
    }

    fileprivate var lines = [Line]()

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)
            for (i, p) in line.points.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    if p.x < self.frame.maxX && p.y < self.frame.maxY {
                        context.addLine(to: p)
                    }
                }
            }
            context.strokePath()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if viewScroll != nil {
            viewScroll?.isScrollEnabled = false
        }
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: []))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        bandera = true
        guard let point = touches.first?.location(in: self) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.points.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if viewScroll != nil {
            viewScroll?.isScrollEnabled = true
        }
    }
    
    func geSignature() -> UIImage{
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

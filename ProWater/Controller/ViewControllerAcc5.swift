//
//  ViewControllerAcc5.swift
//  ProWater
//
//  Created by user188472 on 1/21/22.
//

import UIKit

class ViewControllerAcc5: UIViewController {
    //
    var sellerSignature : UIImage? = nil
    var clientSignature : UIImage? = nil
    //Header
    @IBOutlet weak var viewHeader: UIImageView!
    //Views
    @IBOutlet weak var ivAviso: UIImageView!
    @IBOutlet weak var ivSellerConfirm: UIImageView!
    @IBOutlet weak var ivClientConfirm: UIImageView!
    @IBOutlet weak var viewClientSignature: UIView!
    //Firmas
    @IBOutlet weak var ivSellerSignature: UIImageView!
    @IBOutlet weak var ivClientSignature: UIImageView!
    //Buttons
    @IBOutlet weak var btn_navBack: UIButton!
    @IBOutlet weak var btn_navHome: UIButton!
    @IBOutlet weak var btn_navNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("seller \(sellerSignature)")
        ivSellerSignature.image = sellerSignature
        ivClientSignature.image = clientSignature
        configureSVG()
    }
    
    func configureSVG(){
        viewHeader.viewHeader()
        btn_navBack.svgBack()
        btn_navNext.svgNext()
        btn_navHome.svgHome()
        btn_navHome.isHidden = true
        ivAviso.setSvgAviso()
        ivSellerConfirm.setConfirmado()
        ivClientConfirm.setConfirmado()
        viewClientSignature.isHidden = true
    }

    @IBAction func navBackPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: false, completion: nil)
    }
    
}

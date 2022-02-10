//
//  ViewControllerReviewsPhoto.swift
//  ProWater
//
//  Created by user188472 on 2/3/22.
//

import UIKit

class ViewControllerReviewsPhoto: UIViewController {

    @IBOutlet weak var reusableNavBar: reusableNavBar!
    @IBOutlet weak var reusableHeader: reusableHeader!
    @IBOutlet weak var btnCancelReviews: UIButton!
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var btnAcceptReviews: UIButton!
    var imageSelectioned : UIImage?
    var idImageView : Int = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        reusableHeader.reusableHeaderTitle.text = "Preview"
        imagePreview.image = imageSelectioned

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCancelReviewsOnClick(_ sender: Any) {
        
        if idImageView==4 {
            Client.evidences.array_reviews.removeLast()
        }else{
            Client.evidences.array_reviews.remove(at: (idImageView))
        }
        print(Client.evidences.array_reviews.count)
        if Client.evidences.array_reviews.count > 0 {
            performSegue(withIdentifier: "PhotoReviewsToListReviews", sender: self)
        }else{
            performSegue(withIdentifier: "ReviewsPhotoToReviews", sender: self)
            
        }
    }
    @IBAction func btnAcceptReviewsOnClick(_ sender: Any) {
        performSegue(withIdentifier: "PhotoReviewsToListReviews", sender: self)
        
    }
    

}

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityDescription: UITextView!
    @IBOutlet weak var citysCountry: UILabel!
    
    var selectCity : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImage.image = selectCity?.image
        cityName.text = selectCity?.name
        citysCountry.text = selectCity?.country
        cityDescription.text = selectCity?.description
    }
    
}

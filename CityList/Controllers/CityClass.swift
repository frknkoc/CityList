import Foundation
import UIKit

class City{
    var name : String
    var country : String
    var description : String
    var image : UIImage
    
    init(name: String, country: String, description: String, image: UIImage) {
        self.name = name
        self.country = country
        self.description = description
        self.image = image
    }
}

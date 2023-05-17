import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var Cities = [City]()
    var citySelect : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let paris = City(name: "Paris", country: "Fransa", description: "Moda, sanat ve romantizmin başkenti olarak ünlüdür. Eiffel Kulesi, Louvre Müzesi ve Notre Dame Katedrali gibi önemli turistik cazibe merkezlerine ev sahipliği yapar.", image: UIImage(named: "1")!)
        let NewYork = City(name: "New York", country: "ABD", description: "Dünyanın en büyük metropollerinden biridir. Gökdelenler, Times Meydanı, Central Park ve Özgürlük Heykeli gibi sembolik yapılarıyla tanınır.", image: UIImage(named: "2")!)
        let Roma = City(name: "Roma", country: "İtalya", description: "Antik Roma İmparatorluğu'nun merkezi olan şehir, tarihi yapıları ve sanat eserleriyle ünlüdür. Colosseum, Pantheon ve Vatikan gibi yerler turistlerin ilgisini çeker.", image: UIImage(named: "3")!)
        let Tokyo = City(name: "Tokyo", country: "Japonya", description: "Japonya'nın başkenti ve en kalabalık şehri olan Tokyo, geleneksel Japon kültürüyle modernizmin bir araya geldiği bir yerdir. Şehir, teknoloji, alışveriş ve gece hayatıyla ünlüdür.", image: UIImage(named: "4")!)
        let RiodeJaneiro = City(name: "Rio de Janeiro", country: "Brezilya", description: "Muhteşem doğal güzelliklere sahip olan Rio de Janeiro, Copacabana ve Ipanema gibi ünlü plajlarıyla bilinir. Ayrıca her yıl düzenlenen renkli ve enerjik Rio Karnavalıyla da ünlüdür.", image: UIImage(named: "5")!)
        let Pekin = City(name: "Pekin", country: "Çin", description: "Çin'in başkenti olan Pekin, tarihi ve kültürel mirasıyla dikkat çeker. Büyük Duvar, Yasak Şehir ve Tiananmen Meydanı gibi önemli turistik noktaları barındırır.", image: UIImage(named: "6")!)
        let Kahire = City(name: "Kahire", country: "Mısır", description: "Nil Nehri'nin yanında yer alan Kahire, piramitleri ve antik Mısır medeniyetinin izlerini taşıyan tarihi yapılarıyla ünlüdür. Keops Piramidi ve Mısır Müzesi şehirdeki önemli turistik mekanlardır.", image: UIImage(named: "7")!)
        let Sydney = City(name: "Sydney", country: "Avustralya", description: "Harika manzaralarıyla ünlü olan Sydney, Opera Binası ve Sydney Limanı gibi sembolik yapılarıyla tanınır. Bondi Plajı ve Harbour Köprüsü de turistlerin ilgisini çeken yerler arasındadır.", image: UIImage(named: "8")!)
        
        Cities = [paris, NewYork, Roma, Tokyo, RiodeJaneiro, Pekin, Kahire, Sydney]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = Cities[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        citySelect = Cities[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectCity = citySelect
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Cities.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

}


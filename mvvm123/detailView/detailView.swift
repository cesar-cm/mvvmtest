
import UIKit


class DetailView: UIViewController {
    private var viewModel: DetailViewModel?
    
    var nameLabel: UILabel?
    var addressLabel: UILabel?
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        addUIElements()
        
        style()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addUIElements() {
        let person = viewModel?.getPerson()
        self.nameLabel = UILabel()
        self.addressLabel = UILabel()
        
        guard let nameLabel = nameLabel, let addressLabel = addressLabel else {
            return
        }
        
        nameLabel.text = person?.name
        view.addSubview(nameLabel)
            
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant:  16.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant:  16.0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -16.0).isActive = true
        
        if person?.address != nil {
            addressLabel.text = person?.address
            view.addSubview(addressLabel)
            
            addressLabel.translatesAutoresizingMaskIntoConstraints = false
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant:  30.0).isActive = true
            addressLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant:  16.0).isActive = true
            addressLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -16.0).isActive = true
        }
        
    }
    
    private func style() {
        title = "Detail View of"
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        nameLabel?.font = .boldSystemFont(ofSize: 27.0)
        nameLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nameLabel?.numberOfLines = 0
        
        
        addressLabel?.font = .italicSystemFont(ofSize: 14.0)
        addressLabel?.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        addressLabel?.numberOfLines = 0
    }
    
}

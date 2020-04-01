
import UIKit


//view
class TableViewController: UITableViewController {
    var tableViewModel: TableViewModel?
    
    //MARK: lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 20.0
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableViewModel = TableViewModel()
        
        tableViewModel?.rows?.bind(listener: { _ in
            self.tableView.reloadData()
        })
        
        addActions()
        style()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Style
    
    func style() {
        self.title = "My List"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
    
    func addActions() {
        let addElement = UIBarButtonItem(barButtonSystemItem: .add,
                                         target: tableViewModel,
                                         action: #selector(tableViewModel?.addElement))
        let removeElement = UIBarButtonItem(barButtonSystemItem: .trash,
                                            target: tableViewModel,
                                            action: #selector(tableViewModel?.removeElement))

        navigationItem.rightBarButtonItem = addElement
        navigationItem.leftBarButtonItem = removeElement
    }
    
    private func registerCells() {
        //all the cells that we will use
        tableView.register(OneLabelCellView.self, forCellReuseIdentifier: OneLabelCellView.identifier)
        tableView.register(TwoLabelCellView.self, forCellReuseIdentifier: TwoLabelCellView.identifier)
    }
    
    //MARK: DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewModel?.numberOfSections ?? 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel?.rows?.value.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let model = tableViewModel?.getCellModel(section: indexPath.section, row: indexPath.row) {
            switch model.associatedType {
            case .OneLabelCellViewModel:
                
                if let cellM = tableView.dequeueReusableCell(withIdentifier: OneLabelCellView.identifier) as? OneLabelCellView,
                    let model = model as? OneLabelCellViewModel{
                    cellM.configure(viewModel: model)
                    cell = cellM
                }
                
            case .TwoLabelCellViewModel:
                
                if let cellM = tableView.dequeueReusableCell(withIdentifier: TwoLabelCellView.identifier) as? TwoLabelCellView,
                    let model = model as? TwoLabelCellViewModel {
                    cellM.configure(viewModel: model)
                    cell = cellM
                }
            default:
                print("")
            }
        }
        
        return cell
    }
}

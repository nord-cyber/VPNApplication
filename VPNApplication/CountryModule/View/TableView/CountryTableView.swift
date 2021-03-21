//
//  CountryTableView.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit



class CountryTableView:UITableView {
    private let reuseIdentifier = "CountryCell"
    
    var tableViewModel:CountryTableViewModelProtocol?
    
    private var cells:[CountryResponseModel]? = [CountryResponseModel]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self

        self.register(CountryCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup () {
       // self.separatorStyle = .none
        self.backgroundColor = #colorLiteral(red: 0.7215686275, green: 0.7921568627, blue: 0.9725490196, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        DispatchQueue.main.async {
            self.tableViewModel?.getDecodeData(data: { [unowned self] (data) in
                self.cells = data
                self.reloadData()
            })
        }
    }
}

extension CountryTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CountryCell
        //cell.nameCountry.text = cells?[indexPath.row]
        return cell
    }
    
   
}

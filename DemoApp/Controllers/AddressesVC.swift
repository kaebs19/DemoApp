//
//  AddressesVC.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 19/11/2024.
//

import UIKit

class AddressesVC: UIViewController {
    
    @IBOutlet weak var addressesTV: UITableView!
    
    var addresList: [Addres] = [
        Addres(titleAddress: "Home Address", detailAddress: "Kuwait, Hawally , Bayan", isSelected: true),
        Addres(titleAddress: "Uncle Address", detailAddress: "Kuwait, Hawally , Bayan", isSelected: false),
        Addres(titleAddress: "Work Address", detailAddress: "Kuwait, Hawally , Bayan", isSelected: false),
        Addres(titleAddress: "Office Address", detailAddress: "Kuwait, Hawally , Bayan", isSelected: false),
        Addres(titleAddress: "Home Address", detailAddress: "Kuwait, Hawally , Bayan", isSelected: false)

        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        initUi()
        

    }
    

    
}

extension AddressesVC {
    
    func initUi () {
        initTV(tv: addressesTV)
    }
}

extension AddressesVC{
   func initTV(tv: UITableView){
       tv.configureTableView(delqate: self,
                             dataSource: self,
                             cellType: AddressesTvCell.self,
                             cellIdentifier: .AddressesTvCell)
       tv.separatorInset = UIEdgeInsets(top: 0,left: 0,
                                        bottom: 0, right: 0)
       tv.separatorStyle = .singleLine
    }
}

extension AddressesVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(index: indexPath, cellType: AddressesTvCell.self)
        let data = addresList[indexPath.row]
        cell.initCell(cellData: data)
        cell.index = indexPath.row
        cell.dellgate = self
        return cell
    }
    
    
}

extension AddressesVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension AddressesVC: AddressesTvCellProtocol  {
    func isSelectButTaped(cellIndex: Int) {
        print(cellIndex)
        for (i , item) in addresList.enumerated(){
            addresList[i].isSelected = false
        }
        addresList[cellIndex].isSelected = true
        addressesTV.reloadData()
        
    }

    
}

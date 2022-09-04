//
//  ViewController.swift
//  StaticTableView-With-CollectionView
//
//  Created by Mitya Kim on 9/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    let staticTableView = UITableView()
    let cellId = "cellId"
    
    let colors: [UIColor] = [.systemRed, .systemCyan, .blue, .green, .orange]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        staticTableView.dataSource = self
        staticTableView.delegate = self
        staticTableView.register(Cell.self, forCellReuseIdentifier: cellId)
        
        style()
        layout()
    }
}

// MARK: - Helper Methods
extension ViewController {
    func style() {
        staticTableView.translatesAutoresizingMaskIntoConstraints = false
        staticTableView.backgroundColor = .systemBackground
        staticTableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    func layout() {
        view.addSubview(staticTableView)
        
        NSLayoutConstraint.activate([
            staticTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            staticTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            staticTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            staticTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
//            header.topAnchor.constraint(equalTo: staticTableView.headerView(forSection: 1)!.topAnchor),
//            header.leadingAnchor.constraint(equalTo: staticTableView.headerView(forSection: 1)!.leadingAnchor),
//            header.trailingAnchor.constraint(equalTo: staticTableView.headerView(forSection: 1)!.trailingAnchor),
//            header.bottomAnchor.constraint(equalTo: staticTableView.headerView(forSection: 1)!.bottomAnchor)
        ])
    }
}

// MARK: - UITableView
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        var index = indexPath.row
        switch indexPath.section {
        case 0:
            index = 0
        case 1:
            index = 1
        case 2:
            index = 2
        case 3:
            index = 3
        case 4:
            index = 4
        default:
            break
        }
        
        cell.backgroundColor = colors[index]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var str = ""
        if section == 1 {
            str = "Hello"
        } else if section == 3 {
            str = "Dima Senior IOS Developer"
        } else {
            str = "Dima IOS Engeneer"
        }
        return str
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? Header
        if section == 3 {
            header?.configure(title: "Dima", subtitle: "IOS Developer")
        } else if section == 0 {
            header?.configure(title: "", subtitle: "")
        } else {
            header?.configure(title: "Originals", subtitle: "Amazon Prime")
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height: CGFloat = 0
        if section == 0 {
            height = 0
        } else {
            height = 100
        }
        return height
    }
    
    
}


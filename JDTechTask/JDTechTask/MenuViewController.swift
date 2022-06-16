//
//  ViewController.swift
//  JDTechTask
//
//  Created by Ali Hassan on 16/06/2022.
//

import UIKit

private class MenuSection {
    let title: String
    let options: [String]
    var isOpended: Bool
    
    init(title: String, options: [String], isOpended: Bool = false) {
        self.title = title
        self.options = options
        self.isOpended = isOpended
    }
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var sections = [MenuSection]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
        sections = [
            MenuSection(title: "Section 1", options: [1, 2, 3].map { "Option \($0)" } ),
            MenuSection(title: "Section 2", options: [1, 2, 3].map { "Option \($0)" } ),
            MenuSection(title: "Section 3", options: [1, 2, 3].map { "Option \($0)" } ),
            MenuSection(title: "Section 4", options: [1, 2, 3].map { "Option \($0)" } )
        ]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpended {
            return section.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].title
        } else {
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard indexPath.row == 0 else { return }
        sections[indexPath.section].isOpended.toggle()
        tableView.reloadSections([indexPath.section], with: .automatic)
    }
}


//
//  ViewController.swift
//  JDTechTask
//
//  Created by Ali Hassan on 16/06/2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    private let menuItemsProvider: MenuItemsProvider
    private var sections = [MenuSection]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    init(menuItemsProvider: MenuItemsProvider) {
        self.menuItemsProvider = menuItemsProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self

        menuItemsProvider.fetchMenuOptions { result in
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch result {
                case .success(let sections):
                    self.sections = sections
                    self.tableView.reloadData()
                case.failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if let options = section.options , section.isOpended {
            return options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let section = sections[indexPath.section]
        
        if indexPath.row == 0 {
            cell.textLabel?.text = section.title
        } else if let options = section.options {
            cell.textLabel?.text = options[indexPath.row - 1].name
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


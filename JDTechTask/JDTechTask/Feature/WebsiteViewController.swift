//
//  WebsiteViewController.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import UIKit
import WebKit
import SafariServices

final class WebsiteViewController: UIViewController {
    
    private let url: URL
    
    private let safariIcon = UIImage(systemName: "safari")
    private let webView = WKWebView()
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)

        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let openInSafariBarButton = UIBarButtonItem(image: safariIcon, style: .plain, target: self, action: #selector(openInSafari))
        navigationItem.rightBarButtonItem = openInSafariBarButton
    }
 
    @objc private func openInSafari() {
        UIApplication.shared.open(url)
    }
}

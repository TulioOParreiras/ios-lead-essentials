//
//  FeedViewController.swift
//  Prototype
//
//  Created by Usemobile on 20/03/20.
//  Copyright © 2020 tulioParreiras. All rights reserved.
//

import UIKit

final class FeedViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedImageCell")!
        return cell
    }
    
}

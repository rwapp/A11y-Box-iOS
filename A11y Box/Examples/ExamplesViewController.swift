//
//  ExamplesViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 08/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class ExamplesViewController: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExamplesDatasource.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let exampleTitle = ExamplesDatasource(rawValue: indexPath.row)?.title()
        cell.textLabel!.text = exampleTitle
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedExample = ExamplesDatasource(rawValue: indexPath.row) else { return }

        navigationController?.pushViewController(selectedExample.viewController(), animated: true)
    }
}

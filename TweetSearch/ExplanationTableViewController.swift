//
//  ExplanationTableViewController.swift
//  TweetSearch
//
//  Created by 内山和輝 on 2021/10/09.
//

import UIKit

class ExplanationTableViewController: UITableViewController {

    var memos = [
        ["title": "@", "detail": "指定ユーザーのツイートや、指定ユーザーへのリプライなどが表示されます。"],
        ["title": "from", "detail": "指定ユーザーのツイートが表示されます。指定ユーザーへのリプライなどは表示されません。"],
        ["title": "since", "detail": "指定した日付から現在までのツイートを表示します。"],
        ["title": "until", "detail": "過去から指定した日付までのツイートを表示します。"],
        ["title": "word", "detail": "特定の言葉が含まれるツイートを表示します。"],
        ["title": "-", "detail": "特定の言葉を除外して検索することができます。"],
        ["title": "#", "detail": "ハッシュタグの検索を行うことができます。"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.memos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.memos[indexPath.row]["title"]
        cell.detailTextLabel?.text = self.memos[indexPath.row]["detail"]
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

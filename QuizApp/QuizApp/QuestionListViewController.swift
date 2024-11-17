//
//  QuestionListViewController.swift
//  QuizApp
//
//  Created by user on 2024-11-16.
//

import UIKit

class QuestionListViewController: UITableViewController {

    var questionBank: [Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question Bank"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addQuestion))
    }

    @objc func addQuestion() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addVC = storyboard.instantiateViewController(withIdentifier: "AddQuestionVC") as? AddQuestionViewController {
            navigationController?.pushViewController(addVC, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionBank.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        let question = questionBank[indexPath.row]
        cell.textLabel?.text = question.text
        return cell
    }
}

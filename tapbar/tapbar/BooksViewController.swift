//
//  BooksViewController.swift
//  tapbar
//
//  Created by Камила Багдат on 13.11.2024.
//

import UIKit

class BooksViewController: UIViewController {
    
    private var books: [Books] = [
        Books(title: "To Kill a Mockingbird", image: .init(named: "toKill")!, description: "A powerful novel by Harper Lee that explores themes of racial injustice and moral growth in the American South, as seen through the eyes of young Scout Finch."),
        Books(title: "1984", image: ._1984, description: "George Orwell’s dystopian classic depicting a totalitarian society under constant surveillance, where independent thought is crushed, and truth is manipulated."),
        Books(title: "Pride and Prejudice", image: .pride, description: "Jane Austen’s beloved romantic novel following Elizabeth Bennet as she navigates love, class, and family expectations in 19th-century England."),
        Books(title: "The Great Gatsby", image: .gatsby, description: "F. Scott Fitzgerald’s iconic story of love, wealth, and the American Dream set in the Roaring Twenties, centered around the mysterious millionaire Jay Gatsby and his obsession with Daisy Buchanan."),
        Books(title: "Harry Potter and the Sorcerer's Stone", image: .harry, description: "The first book in J.K. Rowling’s magical series, where young Harry Potter discovers his wizarding heritage and begins his adventures at Hogwarts School of Witchcraft and Wizardry."),
        Books(title: "The Catcher in the Rye", image: .catcher, description: "J.D. Salinger’s coming-of-age story about Holden Caulfield, a rebellious teenager struggling with alienation and searching for purpose in a phony adult world."),
        Books(title: "The Hobbit", image: .hobbit, description: "J.R.R. Tolkien’s enchanting fantasy tale of Bilbo Baggins, a reluctant hobbit who sets out on a perilous journey with a band of dwarves to reclaim their mountain home from a dragon."),
        Books(title: "The Da Vinci Code", image: .davinci, description: "Dan Brown’s gripping thriller that follows symbologist Robert Langdon as he unravels a secret hidden within famous works of art, leading to a shocking religious conspiracy."),
        Books(title: "The Hunger Games", image: .hunger, description: "Suzanne Collins’s dystopian novel about Katniss Everdeen, who volunteers to participate in a brutal televised death match to protect her sister, sparking a rebellion against a tyrannical government."),
        Books(title: "The Lord of the Rings: The Fellowship of the Ring", image: .lord, description: "The first part of J.R.R. Tolkien’s epic fantasy saga, where Frodo Baggins begins his quest to destroy the One Ring and defeat the dark lord Sauron.")
    ]
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var selectedBook: Books?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(BooksTableViewCell.self, forCellReuseIdentifier: "booksTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? Books2ViewController else { return }
        destVC.configure(with: selectedBook)
//        destVC.configure(with: selectedBook ?? .init(title: "", image: UIImage(systemName: "doc.questionmark.fill")!, description: ""))
    }
}

extension BooksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = books[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BooksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "booksTableViewCell", for: indexPath) as! BooksTableViewCell
        let currentModel = books[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}

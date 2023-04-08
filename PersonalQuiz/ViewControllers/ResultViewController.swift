//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answersChosen: [Answer]?
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var whatAnimalYouLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        countAnimals()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func countAnimals() {
        if let answers = answersChosen {
            let animalCounts = [
                ("cat", answers.filter { $0.animal == .cat }.count),
                ("dog", answers.filter { $0.animal == .dog }.count),
                ("rabbit", answers.filter { $0.animal == .rabbit }.count),
                ("turtle", answers.filter { $0.animal == .turtle }.count)
            ]
            
            if let mostCommonAnimal = animalCounts.max(by: { $0.1 < $1.1 })?.0 {
                switch mostCommonAnimal {
                case "cat":
                    emojiLabel.text = "Вы \(Animal.cat.rawValue)"
                    whatAnimalYouLabel.text = Animal.cat.definition
                case "dog":
                    emojiLabel.text = "Вы \(Animal.dog.rawValue)"
                    whatAnimalYouLabel.text = Animal.dog.definition
                case "rabbit":
                    emojiLabel.text = "Вы \(Animal.rabbit.rawValue)"
                    whatAnimalYouLabel.text = Animal.rabbit.definition
                case "turtle":
                    emojiLabel.text = "Вы \(Animal.turtle.rawValue)"
                    whatAnimalYouLabel.text = Animal.turtle.definition
                default:
                    break
                }
            }
        }
    }
    
    func setUI() {

    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var yourAnimalLabel: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    
    var currentAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalPerson()

    }
    
// MARK: - Sorting function
    
    private func animalPerson(){
        var labeledTypes: [AnimalType : Int] = [:]
        let currentTypes = currentAnswers.map{$0.type}
        
        for type in currentTypes {
            labeledTypes[type] = (labeledTypes[type] ?? 0) + 1
        }
        
        let sortedAnswers = labeledTypes.sorted(by: {(animal1, animal2) ->
            Bool in return
            animal1.value > animal2.value
        })
        
        let mostAnswers = sortedAnswers.first!.key
        
        yourAnimalLabel.text = "\(mostAnswers.rawValue)"
        animalDescription.text = "\(mostAnswers.definition)"
    }
    
    
//    private func animalToShow() {
//        var dog = 0
//        var cat = 0
//        var rabbit = 0
//        var turtle = 0
//        var animalType: [String] = []
//
//        for animal in currentAnswers {
//            if animal.type == .dog {
//                dog += 1
//                animalType.append("dog")
//            } else if animal.type == .cat {
//                cat += 1
//                animalType.append("cat")
//            } else if animal.type == .rabbit {
//                rabbit += 1
//                animalType.append("rabbit")
//            } else if animal.type == .turtle {
//                turtle += 1
//                animalType.append("turtle")
//            }
//        }
//
//        if dog > cat && dog > rabbit && dog > turtle {
//            yourAnimalLabel.text = String(AnimalType.dog.rawValue)
//            animalDescription.text = AnimalType.dog.definition
//        } else if cat > dog && cat > rabbit && cat > turtle {
//            yourAnimalLabel.text = String(AnimalType.cat.rawValue)
//            animalDescription.text = AnimalType.cat.definition
//        } else if rabbit > dog && rabbit > cat && rabbit > turtle{
//            yourAnimalLabel.text = String(AnimalType.rabbit.rawValue)
//            animalDescription.text = AnimalType.rabbit.definition
//        } else if turtle > dog && turtle > cat && turtle > rabbit {
//            yourAnimalLabel.text = String(AnimalType.turtle.rawValue)
//            animalDescription.text = AnimalType.turtle.definition
//        }
//
//    }
    
}




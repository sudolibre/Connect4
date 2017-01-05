//
//  ViewController.swift
//  Connect4
//
//  Created by Jonathon Day on 1/4/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let board = Board()
    
    @IBOutlet var winLabel: UILabel!
    @IBOutlet var colButtons: UIStackView!
    @IBOutlet var stack0: UIStackView!
    @IBOutlet var stack1: UIStackView!
    @IBOutlet var stack2: UIStackView!
    @IBOutlet var stack3: UIStackView!
    @IBOutlet var stack4: UIStackView!
    @IBOutlet var stack5: UIStackView!
    @IBOutlet var stack6: UIStackView!
    @IBOutlet var stack7: UIStackView!

    
    @IBAction func col0Selected(_ sender: UIButton) {
        board.dropDisc( column: 0)
        updateView()
    }
    @IBAction func col1Selected(_ sender: UIButton) {
        board.dropDisc( column: 1)
        updateView()
    }
    @IBAction func col2Selected(_ sender: UIButton) {
        board.dropDisc( column: 2)
        updateView()
    }
    @IBAction func col3Selected(_ sender: UIButton) {
        board.dropDisc( column: 3)
        updateView()
    }
    @IBAction func col4Selected(_ sender: UIButton) {
        board.dropDisc( column: 4)
        updateView()
    }
    @IBAction func col5Selected(_ sender: UIButton) {
        board.dropDisc( column: 5)
        updateView()
    }
    @IBAction func col6Selected(_ sender: UIButton) {
        board.dropDisc( column: 6)
        updateView()
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.isHidden = true


        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView() {
        let columns = [stack0, stack1, stack2, stack3, stack4, stack5, stack6]
        
        if board.winner != .none {
            switch board.winner {
            case .red:
                winLabel.text = "Red Wins!!!"
                winLabel.isHidden = false
                for i in columns {
                    i?.alpha = 0.25
                    i?.isUserInteractionEnabled = false
                }
                stack7.isUserInteractionEnabled = false
                stack7.alpha = 0.25
            case .yellow:
                winLabel.text = "Yellow Wins!!!"
                winLabel.isHidden = false
                for i in columns {
                    i?.alpha = 0.25
                    i?.isUserInteractionEnabled = false
                }
                stack7.isUserInteractionEnabled = false
                stack7.alpha = 0.25
            default:
                break
            }
        }
        
        var columnsIndex = 0
        for c in board.places {
            var rowIndex = 0
            for d in c {
                switch d{
                case .red:
                columns[columnsIndex]?.arrangedSubviews.reversed()[rowIndex].backgroundColor = UIColor.red
                case .yellow:
                columns[columnsIndex]?.arrangedSubviews.reversed()[rowIndex].backgroundColor = UIColor.yellow
                case .none:
                    break
                }
                rowIndex += 1
            }
            if !board.availableColumns.contains(columnsIndex) {
                stack7.arrangedSubviews[columnsIndex].isUserInteractionEnabled = false
            }
            columnsIndex += 1
        }
    }


}


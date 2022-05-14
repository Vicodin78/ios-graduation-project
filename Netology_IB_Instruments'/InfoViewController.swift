//
//  InfoViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 25.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "InfoViewController"
        view.backgroundColor = .systemBlue
        makeAlertButton()
    }
    
    private func makeAlertButton() {
        let alertButton = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        alertButton.center = view.center
        alertButton.setTitle("Сжечь телефон", for: .normal)
        alertButton.layer.cornerRadius = 5
        alertButton.backgroundColor = .systemRed
        alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        view.addSubview(alertButton)
    }
    
    @objc private func alertAction() {
        let alertWin = UIAlertController(title: "Внимание!", message: "Возжожны ожоги на руках. Вы уверены что хотите сжечь телефон?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Сжечь его!", style: .default) { _ in
            self.dismiss(animated: true)
            print("Телефон уничтожен!")
        }
        let nonAction = UIAlertAction(title: "Погодите", style: .destructive) { _ in
            print("Этот слабак передумал")
        }
        alertWin.addAction(nonAction)
        alertWin.addAction(okAction)
        present(alertWin, animated: true)
    }
}

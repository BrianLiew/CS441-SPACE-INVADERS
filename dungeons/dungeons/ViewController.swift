//
//  ViewController.swift
//  dungeons
//
//  Created by Brian Liew on 11/4/21.
//

import UIKit

let screen_width = UIScreen.main.bounds.width
let screen_height = UIScreen.main.bounds.height

let dialogue_font = UIFont(name: "Courier New", size: 24)
let button_font = UIFont(name: "Courier New", size: 16)

class ViewController: UIViewController {
    
    // MARK: UI elements declaration
    
    let background_view = UIImageView(frame: CGRect(x: 0, y: 0, width: screen_width, height: screen_height / 2))
    let control_background_view = UIImageView(frame: CGRect(x: 0, y: screen_height / 2, width: screen_width, height: screen_height / 2))
    var img_view = UIImageView(frame: CGRect(x: 100, y: 100, width: screen_width - 200, height: screen_height / 2 - 100))
    var dialogue_box = UILabel(frame: CGRect(x: 0, y: screen_height / 2, width: screen_width, height: screen_height / 4))
    let left_button = UIButton(type: .custom)
    let right_button = UIButton()
        
    // singleton declaration
    let levels_instance = Levels.instance
    
    // MARK: variable declaration
    
    var current_level: Level?
    var current_state: State?
    
    required init(coder aDecoder: NSCoder) {
        if let level = levels_instance.get_level(number: 0) {
            current_level = level
            current_state = level.states[0]
        } else { fatalError("ViewController init() failed: cannot find LEVEL 1") }
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background_view.backgroundColor = UIColor.gray
        control_background_view.backgroundColor = UIColor.darkGray
        img_view.backgroundColor = UIColor.red
        dialogue_box.backgroundColor = UIColor.black
        left_button.backgroundColor = UIColor.red
        right_button.backgroundColor = UIColor.blue
        
        dialogue_box.font = dialogue_font
        left_button.titleLabel?.font = button_font
        right_button.titleLabel?.font = button_font
        
        dialogue_box.textColor = UIColor.white
        dialogue_box.textAlignment = .center
        
        left_button.addTarget(self, action: #selector(self.A_selected), for: .touchUpInside)
        right_button.addTarget(self, action: #selector(self.B_selected), for: .touchUpInside)
        
        view.addSubview(background_view)
        view.addSubview(control_background_view)
        view.addSubview(img_view)
        view.addSubview(dialogue_box)
        view.addSubview(left_button)
        view.addSubview(right_button)
        
        left_button.translatesAutoresizingMaskIntoConstraints = false
        right_button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            left_button.topAnchor.constraint(equalTo: dialogue_box.bottomAnchor, constant: 25),
            left_button.bottomAnchor.constraint(equalTo: control_background_view.bottomAnchor, constant: -25),
            left_button.leadingAnchor.constraint(equalTo: control_background_view.leadingAnchor, constant: 25),
            left_button.trailingAnchor.constraint(equalTo: control_background_view.centerXAnchor, constant: -25),
            right_button.topAnchor.constraint(equalTo: dialogue_box.bottomAnchor, constant: 25),
            right_button.bottomAnchor.constraint(equalTo: control_background_view.bottomAnchor, constant: -25),
            right_button.leadingAnchor.constraint(equalTo: control_background_view.centerXAnchor, constant: 25),
            right_button.trailingAnchor.constraint(equalTo: control_background_view.trailingAnchor, constant: -25)
        ])
        
        update_UI()
    }
    
    @objc func A_selected(sender: UIButton!) -> Void {
        print("Button A triggered")
        current_state = current_state?.A_next_state
        update_UI()
    }
    
    @objc func B_selected(sender: UIButton!) -> Void {
        current_state = current_state?.B_next_state
        update_UI()
    }
    
    func update_UI() -> Void {
        guard let state = current_state else { fatalError("ViewController update_UI() failed: cannot find state") }

        if let image = state.char_img { img_view.image = UIImage(named: image) }
        
        dialogue_box.text = state.dialouge
        left_button.setTitle(state.A_text, for: .normal)
        right_button.setTitle(state.B_text, for: .normal)
    }
    
}

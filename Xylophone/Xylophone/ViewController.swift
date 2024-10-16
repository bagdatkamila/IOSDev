//
//  ViewController.swift
//  Xylophone
//
//  Created by Камила Багдат on 16.10.2024.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    private var audioPlayer: AVAudioPlayer? = nil
    
    private let notesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        layoutSubviews()
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
    
    private func setupUI() {
        view.addSubview(notesStack)
        
        let notes: [String: UIColor] = [
            "C": .black,
            "D": .red,
            "E": .green,
            "F": .blue,
            "G": .yellow,
            "A": .orange,
            "B": .brown
        ]
        
        notes.forEach { note, color in
            let button = createButton(note: note, color: color)
            notesStack.addArrangedSubview(button)
        }
    }
    
    private func layoutSubviews() {
        NSLayoutConstraint.activate([
            notesStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            notesStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            notesStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func createButton(note: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(note, for: .normal)
        button.backgroundColor = color
        button.addTarget(self, action: #selector(noteTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }
    
    @objc func noteTapped(_ sender: UIButton) {
        if let note = sender.titleLabel?.text {
            playSound(note: note)
        }
    }
    
    private func playSound(note: String) {
        if let soundURL = Bundle.main.url(forResource: note, withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("AudioPlayer error: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found for note: \(note)")
        }
    }
}

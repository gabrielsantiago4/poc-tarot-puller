//
//  CompendiumView.swift
//  tarot-puller-test
//
//  Created by Gabriel Santiago on 13/10/22.
//

import UIKit
import AVFoundation

class CompendiumView: UIView {
    
    var audioplayer: AVAudioPlayer?
    
    var cards: [Card] = []
    
    var didTapButtonHandler: ((Card) -> Void)?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CompendiumTableViewCell.self, forCellReuseIdentifier: "CompendiumTableViewCell")
        tableView.rowHeight = 80
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
//        tableView.tintColor = .clear
        return tableView
    }()
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "background")
        return backgroundImage
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configCompendiumView()
        backgroundColor = .systemCyan
        ApiServices.getAllCards { list in
            self.cards = list.cards
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCompendiumView () {
        
        addSubview(backgroundImage)
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.heightAnchor.constraint(equalToConstant: 600),
            tableView.widthAnchor.constraint(equalToConstant: 370),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            tableView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
 
        ])
    }
}

extension CompendiumView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = cards[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompendiumTableViewCell") as! CompendiumTableViewCell
        cell.cardName.text = card.name
        cell.cardName.textColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let card = cards[indexPath.row]
        didTapButtonHandler?(card)
        
        let pathSound = Bundle.main.path(forResource: "PageTurnSound", ofType: "mp3")!
                let url = URL(fileURLWithPath: pathSound)

                do
                {
                    audioplayer = try AVAudioPlayer(contentsOf: url)
                    audioplayer?.play()

                }catch{
                    print(error)

                }
        
    }
    
    
}

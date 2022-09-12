//
//  ViewController.swift
//  Swiftbook-iosDev-2.1-2-trafficLight
//
//  Created by Айдар Абдуллин on 12.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLightLabel: UILabel!
    @IBOutlet var yellowLightLabel: UILabel!
    @IBOutlet var greenLightLabel: UILabel!
    @IBOutlet var switchColorLabel: UIButton!
    
    enum Condition: Int {
        case stop
        case ready
        case go
        case caution
        case attention
    }
    
    var lightState = Condition.stop
    
    let lightOn = 1.0
    let lightOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLight(for: redLightLabel)
        prepareLight(for: yellowLightLabel)
        prepareLight(for: greenLightLabel)

        // Do any additional setup after loading the view.
    }

    @IBAction func switchColorButton(_ sender: UIButton) {
        switch lightState {
        case .stop:
            redLightLabel.alpha = lightOn
            yellowLightLabel.alpha = lightOff
            lightState = .ready
            switchColorLabel.setTitle("NEXT", for: .normal)
        case .ready:
            yellowLightLabel.alpha = lightOn
            lightState = .go
        case .go:
            redLightLabel.alpha = lightOff
            yellowLightLabel.alpha = lightOff
            greenLightLabel.alpha = lightOn
            lightState = .caution
        case .caution:
            lightState = .attention
// want to try add green light flashing
        case .attention:
            greenLightLabel.alpha = lightOff
            yellowLightLabel.alpha = lightOn
            lightState = .stop
        }
    }
    
    func prepareLight(for light: UILabel) {
        light.layer.cornerRadius = light.frame.height / 2
        light.clipsToBounds = true
        light.alpha = lightOff
    }
}


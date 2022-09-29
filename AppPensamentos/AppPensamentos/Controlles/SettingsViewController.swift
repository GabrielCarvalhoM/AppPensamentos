//
//  SettingsViewController.swift
//  AppPensamentos
//
//  Created by Gabriel Carvalho on 26/09/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var switchAutoRefresh: UISwitch!
    @IBOutlet weak var sliderTimeRefresh: UISlider!
    @IBOutlet weak var segmentedControlColorScheme: UISegmentedControl!
    @IBOutlet weak var labelTimeRefresh: UILabel!
    @IBOutlet weak var labelMinRefreshTime: UILabel!
    @IBOutlet weak var labelMaxRefreshTime: UILabel!
    @IBOutlet weak var labelAutoChange: UILabel!
    
    
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
         

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
  
   
    
    
    func formatView() {
        switchAutoRefresh.setOn(config.autoRefresh, animated: false)
        sliderTimeRefresh.setValue(Float(config.timeRefresh), animated: false)
        segmentedControlColorScheme.selectedSegmentIndex = config.colorScheme
        changeTimeIntervalLabel(with: config.timeRefresh)
            
    }
    
    func changeTimeIntervalLabel(with value: Double) {
        labelTimeRefresh.text = "Mudar após \(config.timeRefresh) segundos."
        
    }
    
    
    @IBAction func changeAutorefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
        
    }
    
    @IBAction func changeTimeRefresh(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        config.timeRefresh = value
        
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex

    }
    
    
}

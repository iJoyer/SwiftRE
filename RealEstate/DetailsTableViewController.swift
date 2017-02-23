//
//  DetailsTableViewController.swift
//  RealEstate
//
//  Created by iJoyer Yip on 14/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import UIKit
import Charts

class DetailsTableViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var chartsControl: UISegmentedControl!
    @IBOutlet weak var radarChartView: RadarChartView!
    @IBOutlet weak var barChartView: HorizontalBarChartView!
    
    var house: House?
    var ratings: [Double]!
    var isFirstTimeScroll: Bool = true
    
    //Animation
    
    var beginContentY, endContentY: CGFloat?
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.beginContentY = scrollView.contentOffset.y
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        self.endContentY = scrollView.contentOffset.y
        if (isFirstTimeScroll) {
            isFirstTimeScroll = false
        }
        
        if (self.endContentY! - self.beginContentY! > 150 && self.endContentY! > 200) {
            self.navigationController?.isNavigationBarHidden = true
            
        }
        else if (self.endContentY! - self.beginContentY! < 0) {
            self.navigationController?.isNavigationBarHidden = false
        }
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y <= -64) {
            tableView.bounces = false
        }
        else if (scrollView.contentOffset.y > -64) {
            tableView.bounces = true
        }
    }
    
    //Animation
    
    @IBAction func chartChanged(_ sender: Any) {
        switch chartsControl.selectedSegmentIndex {
        case 0:
            radarChartView.isHidden = true
            barChartView.isHidden = false
            barChartView.animate(xAxisDuration: 0.2, yAxisDuration: 0.2, easingOption: .linear)
            
        case 1:
            radarChartView.isHidden = false
            barChartView.isHidden = true
            
            radarChartView.animate( yAxisDuration: 0.2, easingOption: .linear)
        default:
            break
        }
    }
    
    func SetRadarChart() {
        radarChartView.chartDescription?.text = ""
        radarChartView.rotationEnabled = false
        radarChartView.highlightPerTapEnabled = false
        radarChartView.webLineWidth = 0.75
        radarChartView.innerWebLineWidth = 0.75
        
        let x: XAxis = radarChartView.xAxis
        let y: YAxis = radarChartView.yAxis
        y.axisMaximum = 5.0
        y.axisMinimum = 0.0
        y.drawLabelsEnabled = false
        x.drawLabelsEnabled = true
        
        x.valueFormatter = IndexAxisValueFormatter(values: ratingFields)
        
        
        var dataEntries: [RadarChartDataEntry] = []
        
        
        for i in 0..<ratingFields.count {
            let dataEntry = RadarChartDataEntry(value: ratings[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = RadarChartDataSet(values: dataEntries, label: "评分")
        chartDataSet.drawFilledEnabled = true
        chartDataSet.fillColor = NSUIColor(colorLiteralRed: 128.0, green: 0.0, blue: 0.0, alpha: 0.5)
        
        let chartData = RadarChartData(dataSet: chartDataSet)
        
        radarChartView.labels = ratingFields
        radarChartView.data = chartData
        
        
    }
    
    func SetBarChart() {
        barChartView.chartDescription?.text = ""
        barChartView.rightAxis.enabled = false
        barChartView.highlightPerTapEnabled = false
        
        //barChartView.xAxis.enabled = false
        
        
        let x: XAxis = barChartView.xAxis
        let l: YAxis = barChartView.leftAxis
        
        l.drawGridLinesEnabled = false
        l.drawAxisLineEnabled = false
        l.drawLabelsEnabled = false
        l.axisMinimum = 0.0
        l.axisMaximum = 5.0
        l.granularity = 1.0
        x.drawGridLinesEnabled = false
        x.drawAxisLineEnabled = false
        x.valueFormatter = IndexAxisValueFormatter(values: ratingFields)
        x.granularity = 1.0
        x.labelPosition = .bottom
        
        
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<ratingFields.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: ratings[i])
            
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "")
        let chartData = BarChartData(dataSet: chartDataSet)
        
        
        barChartView.data = chartData
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 2) {
            return CGFloat(infoTitleList.count + 3) * 22.0
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        house = delegateHouse
        
        self.title = house?.title
        titleLabel.text = house?.title
        addressLabel.text = house?.address
        
        ratings = [3.4, 2.0, 3.0, 5.0, 2.0]
        SetRadarChart()
        SetBarChart()
        radarChartView.isHidden = true
        barChartView.isHidden = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

}

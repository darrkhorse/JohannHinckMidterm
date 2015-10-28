//
//  TableViewer.swift
//  AppleWatchMidterm
//
//  Created by Hinck, Johann A on 10/28/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit
import Foundation


class TableViewer: WKInterfaceController {
    @IBOutlet var mbpsLabel: WKInterfaceLabel!

    @IBOutlet var theTable: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        mbpsLabel.setText("Mbps = \(MbpsInfo.mbps)")
        let labelNames = ["Bps:","KBps:","MBps:","GBps:"]
        let labelValues = [125000,125,0.125,0.000125]
        
        self.theTable.setNumberOfRows(labelNames.count, withRowType: "cell")
        for(var i = 0; i < labelNames.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! conversionRow
            
            currRow.theLabel.setText(labelNames[i])
            currRow.theValueLabel.setText("\(Double(MbpsInfo.mbps) * labelValues[i])")
            
        }
            
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

//
//  WidgetBundle.swift
//  WidgetSpike
//
//  Created by alexis on 24/03/21.
// https://www.oliverbinns.co.uk/2020/06/27/create-a-tube-status-home-screen-widget-for-ios-14/

import SwiftUI
import WidgetKit

@main
struct TubeWidgets: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        AllLinesWidget()
        SingleLineWidget()
    }
}

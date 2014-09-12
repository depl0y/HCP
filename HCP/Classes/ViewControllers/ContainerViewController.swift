//
//  ContainerViewController.swift
//  HCP
//
//  Created by Wim Haanstra on 12/09/14.
//  Copyright (c) 2014 Wim Haanstra. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, DZNSegmentedControlDelegate {
	
	private var scrollView:UIScrollView = UIScrollView();
	private var devicesViewController: DevicesViewController = DevicesViewController();
	private var roomsViewController: RoomsViewController = RoomsViewController();
	
	private var menuBar: DZNSegmentedControl? = nil;

    override func viewDidLoad() {
        super.viewDidLoad()

		self.scrollView.frame = self.view.bounds;
		self.scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth;
		self.scrollView.pagingEnabled = true;
		
		self.menuBar = DZNSegmentedControl(items: ["ROOMS", "DEVICES"]);
		
		self.menuBar?.showsCount = false;
		self.menuBar?.delegate = self;
		self.menuBar?.selectedSegmentIndex = 0;
		self.menuBar?.autoresizingMask = UIViewAutoresizing.FlexibleWidth;
		self.menuBar?.addTarget(self, action: Selector("selectedSegment:"), forControlEvents: UIControlEvents.ValueChanged);
		
		self.view.addSubview(self.scrollView);
		self.view.addSubview(self.menuBar!);
    }
	
	override func viewDidAppear(animated: Bool) {
	
		self.view.backgroundColor = UIColor.whiteColor();
		
		self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height);
		
		self.roomsViewController.view.frame = self.view.bounds;
		self.devicesViewController.view.frame = CGRectOffset(self.view.bounds, self.view.bounds.size.width, 0);
		
		self.scrollView.addSubview(roomsViewController.view);
		self.scrollView.addSubview(devicesViewController.view);
		
		self.menuBar?.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.menuBar!.height);
		
	}
	
	func selectedSegment(menuBar: DZNSegmentedControl) -> Void {
		var viewFrame = self.scrollView.frame;
		viewFrame.origin.x = viewFrame.size.width * CGFloat(menuBar.selectedSegmentIndex);
		viewFrame.origin.y = 0;
		self.scrollView.scrollRectToVisible(viewFrame, animated: true);
	}
	
	func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
		return UIBarPosition.Top;
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
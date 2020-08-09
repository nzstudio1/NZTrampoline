//
//  NZTrampolineObjC.h
//  NZTrampoline
//
//  Created by H. Vakilian on 9/9/2020 AP.
//  Copyright © 2020 NZStudio. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 NOTICE: This class is abstract and should not be instantiated directly. You must subclass.
 
 Instances of the classes inherited from NZTrampolineBase are able to implement some delegate methods while they are able to forward all other methods of the protocol to the delegate object.
 
 E.g. we have created NZSegmentedControl class. We need to implement a bindToScrollView method which gets the target scrollView and binds the pages to the segmented control. In order to do this, NZSegmentedControl needs an access to the contentOffset for the scrollView which is only obtainable from delegate method scrollViewDidSroll:. So the segmented control itself will get the target UIScrollView instance as an argument in bindToScrollView method and it will set the scrollView's delegate to itself to get scrollViewDidScroll: calls. However, the class that contains the scrollView will not be able to access it's delegate methods. because the delegate can be only one object.
 By subclassing NZTrampolineBase and instantiating an object from it (lets call it ß), NZSegmentedControl will set scrollView's delegate to ß. ß is able to receive the delegate methods while it's capable of forwarding other delegate methods to the delegate object (which is probably the view controller which contains the scrollView)
 
 Note:
 - The target object's delegate (like a UIScrollView or UICollectionView) must be set to the instance created of this class.
 - For each delegate method you implement in this subclass, you have to call the target's delegate method manually yourself. Because the NZTrampoline won't be able to perform addclassmethod and you will get a debug output like:
 
        could not trampoline method: scrollViewWillBeginDragging:
 
 It doesn't make the app unstable but if you want to get rid of this output message, use shouldTrampolineMethod: to ignore trampolizing those methods you've declared.
 
 Example:
 @objc func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
     if delegate != nil && delegate!.responds(to: #selector(scrollViewDidEndDecelerating(_:))) {
         delegate!.scrollViewDidEndDecelerating?(scrollView)
     }
 }
 
 override func shouldTrampolineMethod(_ selector: Selector) -> Bool {
     let sel = NSStringFromSelector(selector)
     if (sel == "scrollViewDidEndDecelerating:") {
         return false
     } else if (sel == "scrollViewWillBeginDragging:") {
         return false
     } else {
         return true
     }
 }
 
 
 UPDATE: 21/Jan/2020
 
 I faced an issue in Cake project, where self inside the trampolined delete methods does not refer to the real delegate, instead it points to the trampoline object we've created in NZStickyHeaderCollectionView. However, developer needs to have access to the real self if he wants.
 
 */

@interface NZTrampolineObjC: NSObject

-(instancetype)initWithDelegate:(NSObject*)delegate;

@property (weak, nonatomic) id delegate;

@end

NS_ASSUME_NONNULL_END

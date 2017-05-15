//
//  WXSVGRenderableComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/16.
//
//

#import "WXSVGRenderableComponent.h"
#import "WXConvert+WXSVG.h"

@implementation WXSVGRenderableComponent

#pragma mark -
#pragma mark - override methods
- (instancetype)initWithRef:(NSString *)ref
                       type:(NSString*)type
                     styles:(nullable NSDictionary *)styles
                 attributes:(nullable NSDictionary *)attributes
                     events:(nullable NSArray *)events
               weexInstance:(WXSDKInstance *)weexInstance
{
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
    }
    
    return self;
}

#pragma mark -
#pragma mark - public methods
- (WXSVGRenderable *)node
{
    WXSVGRenderable *renderableView = [WXSVGRenderable new];
    [self syncViewAttributes:renderableView];
    return renderableView;
}

- (void)syncViewAttributes:(WXSVGNode *)view
{
    WXSVGRenderable *renderableView = (WXSVGRenderable *)view;
    if (self.attributes[@"strokeWidth"]) {
        renderableView.strokeWidth = [self.attributes[@"strokeWidth"] floatValue];
    }
    if (self.attributes[@"stroke"]) {
        renderableView.stroke = [WXConvert WXSVGCGColor:self.attributes[@"stroke"]];
    }
    if (self.attributes[@"fill"]) {
        renderableView.fill = [WXConvert WXSVGCGColor:self.attributes[@"fill"]];
    }
    if(self.attributes[@"strokeDasharray"]){
        renderableView.strokeDasharray = [WXConvert WXSVGCGFloatArray:self.attributes[@"strokeDasharray"]] ;
    }
    if(self.attributes[@"strokeLinecap"]){
        renderableView.strokeLinecap = [WXConvert CGLineCap:self.attributes[@"strokeLinecap"]] ;
    }
    renderableView.strokeMiterlimit = 4;
    [super syncViewAttributes:view];

}
    
    
- (void)updateAttributes:(NSDictionary *)attributes
{
    WXSVGRenderable *renderableView = (WXSVGRenderable *)self.view;
    if (attributes[@"strokeWidth"]) {
        renderableView.strokeWidth = [attributes[@"strokeWidth"] floatValue];
    }
    if (attributes[@"stroke"]) {
        renderableView.stroke = [WXConvert WXSVGCGColor:attributes[@"stroke"]];
    }
    if (attributes[@"fill"] && ![attributes[@"fill"] isEqualToString:@"none"]) {
        renderableView.fill = [WXConvert WXSVGCGColor:attributes[@"fill"]];
    }
    if(attributes[@"strokeDasharray"]){
        renderableView.strokeDasharray = [WXConvert WXSVGCGFloatArray:attributes[@"strokeDasharray"]] ;
    }
    if(attributes[@"strokeLinecap"]){
        renderableView.strokeLinecap = [WXConvert CGLineCap:attributes[@"strokeLinecap"]] ;
    }
}


@end

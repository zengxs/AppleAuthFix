#import <Foundation/Foundation.h>

%hook NSURLRequest
- (instancetype)initWithURL:(NSURL *)URL
                cachePolicy:(NSURLRequestCachePolicy)cachePolicy
            timeoutInterval:(NSTimeInterval)timeoutInterval
{
	NSString *host = URL.host;
	if ([host hasSuffix:@"-buy.itunes.apple.com"]) {
		NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:YES];
		components.host = @"apple-proxy.shadowdev-account.workers.dev";
		URL = components.URL;
	}

	return %orig(URL, cachePolicy, timeoutInterval);
}
%end

// match in music flipswitch toggle
// by brandon sachs (c) 2014

#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"
#import "notify.h"

#define musicSettingsPlist @"/var/mobile/Library/Preferences/com.apple.mobileipod.plist"

@interface MatchInMusicSwitch : NSObject <FSSwitchDataSource>
@end

@implementation MatchInMusicSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	NSDictionary *musicSettings = [NSDictionary dictionaryWithContentsOfFile:musicSettingsPlist];
    BOOL isShowingCloudSongs = [[musicSettings objectForKey:@"MusicShowCloudMediaEnabledSetting"] boolValue];
    return isShowingCloudSongs;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	NSMutableDictionary *musicSettings = [NSMutableDictionary dictionaryWithContentsOfFile:musicSettingsPlist];

	if (newState == FSSwitchStateIndeterminate){
		return;
	}
	else if (newState == FSSwitchStateOn){
		//turn match in music on
		[musicSettings setObject:[NSNumber numberWithBool:YES] forKey:@"MusicShowCloudMediaEnabledSetting"];
	}
	else if (newState == FSSwitchStateOff){
		//turn match in music off
		[musicSettings setObject:[NSNumber numberWithBool:NO] forKey:@"MusicShowCloudMediaEnabledSetting"];
	}

	[musicSettings writeToFile:musicSettingsPlist atomically:YES];
	
	notify_post("com.apple.mobileipod-prefsChanged");
}

@end
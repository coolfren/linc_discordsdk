package discordsdk;
import haxe.Int64Helper;
import haxe.Int64;
import cpp.ConstCharStar;
import cpp.Callable;
@:keep
@:include('linc_discordsdk.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('discordsdk'))
#end
extern class DiscordSDK {
        //external native function definition
        //can be wrapped in linc::libname or call directly
        //and the header for the lib included in linc_discordsdk.h
    @:native('linc::discordsdk::runCallbacks')
    static function runCallbacks() : Void;

    @:native('linc::discordsdk::makeParty')
    static function makeParty(id:ConstCharStar = cast "", joinId:ConstCharStar = cast "", spectateId:ConstCharStar = cast "", currentSize:Int = 1, maxSize:Int = 10, onPartyMake:(result:Int)->Void) : Void;

    @:native('linc::discordsdk::registerCommand')
    static function registerCommand(url:ConstCharStar = cast "") : Void;

    @:native('linc::discordsdk::init')
    static function _init(clientId:Int64, onInit:()->Void, onError:(code:Result)->Void) : Void;

    static inline function init(clientId:String, onInit:()->Void, onError:(code:Result)->Void) : Void{
        return _init(Int64Helper.parseString(clientId), onInit, onError);
    };
    
    @:native('linc::discordsdk::updateActivity')
    static function updateActivity(
        details:ConstCharStar = cast "",
        state:ConstCharStar = cast "",
        smallImage:ConstCharStar = cast "",
        smallText:ConstCharStar = cast "",
        largeImage:ConstCharStar = cast "",
        largeText:ConstCharStar = cast "",
        type:ActivityType = Playing,
        startTimestamp:Float = 0,
        endTimestamp:Float = 0,
        callback:()->Void
    ) : Void;
        //inline functions can be used as wrappers
        //and can be useful to juggle haxe typing to or from the c++ extern

} //DiscordSDK

@:native("discord::Result")
enum abstract Result(Int) from Int to Int
{
    var Ok = 0;
    var ServiceUnavailable = 1;
    var InvalidVersion = 2;
    var LockFailed = 3;
    var InternalError = 4;
    var InvalidPayload = 5;
    var InvalidCommand = 6;
    var InvalidPermissions = 7;
    var NotFetched = 8;
    var NotFound = 9;
    var Conflict = 10;
    var InvalidSecret = 11;
    var InvalidJoinSecret = 12;
    var NoEligibleActivity = 13;
    var InvalidInvite = 14;
    var NotAuthenticated = 15;
    var InvalidAccessToken = 16;
    var ApplicationMismatch = 17;
    var InvalidDataUrl = 18;
    var InvalidBase64 = 19;
    var NotFiltered = 20;
    var LobbyFull = 21;
    var InvalidLobbySecret = 22;
    var InvalidFilename = 23;
    var InvalidFileSize = 24;
    var InvalidEntitlement = 25;
    var NotInstalled = 26;
    var NotRunning = 27;
    var InsufficientBuffer = 28;
    var PurchaseCanceled = 29;
    var InvalidGuild = 30;
    var InvalidEvent = 31;
    var InvalidChannel = 32;
    var InvalidOrigin = 33;
    var RateLimited = 34;
    var OAuth2Error = 35;
    var SelectChannelTimeout = 36;
    var GetGuildTimeout = 37;
    var SelectVoiceForceRequired = 38;
    var CaptureShortcutAlreadyListening = 39;
    var UnauthorizedForAchievement = 40;
    var InvalidGiftCode = 41;
    var PurchaseError = 42;
    var TransactionAborted = 43;
}

@:enum
abstract ActivityType(Int) from Int to Int {
    var Playing = 0;
    var Streaming = 1;
    var Listening = 2;
    var Watching = 3;
}
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

    @:native('linc::discordsdk::init')
    static function _init(clientId:Int64) : Void;

    static inline function init(clientId:String) : Void{
        return _init(Int64Helper.parseString(clientId));
    };
    
    @:native('linc::discordsdk::updateActivity')
    static function updateActivity(
        details:ConstCharStar,
        state:ConstCharStar,
        smallImage:ConstCharStar,
        smallText:ConstCharStar,
        largeImage:ConstCharStar,
        largeText:ConstCharStar,
        type:ActivityType
    ) : Void;
        //inline functions can be used as wrappers
        //and can be useful to juggle haxe typing to or from the c++ extern

} //DiscordSDK

@:enum
abstract ActivityType(Int) from Int to Int {
    var Playing = 0;
    var Streaming = 1;
    var Listening = 2;
    var Watching = 3;
}
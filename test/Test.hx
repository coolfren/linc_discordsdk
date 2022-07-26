import discordsdk.DiscordSDK;
class Test {
        
    static function onUpdateActivity(){
        DiscordSDK.makeParty("foo id", "foo join", "foo spectate", 1, 5, (res)->{
            trace("Party created!");
        });
    }

    static function onInit(){
        trace("Changing Activity...");
        DiscordSDK.updateActivity(
            "Formerly Chuck's",
            "Arguing with the city slicker",
            "sneed",
            "Playing as Sneed",
            "sfsfc",
            "Sneed's Feed & Seed",
            Playing,
            Date.now().getTime(),
            Date.now().getTime() + 60,
            onUpdateActivity
        );
    }

    static function onError(result:Result){
        trace("Error code: " + result);
    }

    static function main() {
        trace("Initializing Discord...");
        DiscordSDK.init("1000534631373881344", onInit, onError);
        while(true){
            DiscordSDK.runCallbacks();
            Sys.sleep(0.01);
        }
    }
}
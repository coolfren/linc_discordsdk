
class Test {
        
    static function main() {
        trace("Initializing Discord...");
        discordsdk.DiscordSDK.init("310270644849737729");
        haxe.Timer.delay(()->{
            trace("Changing Activity...");
            discordsdk.DiscordSDK.updateActivity(
                "Fruit Tarts",
                "Pop Snacks",
                "the",
                "i mage",
                "the",
                "u mage",
                Playing
            );
        }, 500).run();
        Sys.stdin().readLine();
    }

}
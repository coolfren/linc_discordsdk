
class Test {
        
    static function main() {
        trace("Initializing Discord...");
        discordsdk.DiscordSDK.init("310270644849737729", ()->{
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
        });
        while(true){
            discordsdk.DiscordSDK.runCallbacks();
            Sys.sleep(1);
        }
    }

}
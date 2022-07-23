//hxcpp include should be first
#include <hxcpp.h>
#include "./linc_discordsdk.h"
#define function []
namespace linc {
    namespace discordsdk {
        discord::Core* core{};

        void runCallbacks(){
            core->RunCallbacks();
        }

        void makeParty(){
            
        }

        void updateActivity(const char* details,
            const char* state,
            const char* smallImage,
            const char* smallText,
            const char* largeImage,
            const char* largeText,
            int type
        ){
                discord::Activity activity{};
                activity.SetDetails(details);
                activity.SetState(state);
                activity.GetAssets().SetSmallImage(smallImage);
                activity.GetAssets().SetSmallText(smallText);
                activity.GetAssets().SetLargeImage(largeImage);
                activity.GetAssets().SetLargeText(largeText);
                activity.SetType((discord::ActivityType)type);
                core->ActivityManager().UpdateActivity(activity, [](discord::Result result) {
                    std::cout << ((result == discord::Result::Ok) ? "Succeeded" : "Failed")
                            << " updating activity!\n";
                });

        }

        void init(int64_t clientId, Dynamic& callback){
            auto result = discord::Core::Create(clientId, DiscordCreateFlags_Default, &core);
            if (!core) {
                std::cout << "Failed to instantiate discord core! (err " << static_cast<int>(result)
                        << ")\n";
                std::exit(-1);
            }
            callback();
        }
    } //discordsdk namespace
} //linc
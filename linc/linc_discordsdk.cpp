//hxcpp include should be first
#include <hxcpp.h>
#include "./linc_discordsdk.h"

namespace linc {
    namespace discordsdk {
        discord::Core* core{};
        discord::Activity activity{};

        Dynamic onInit; // using dynamic for functions probably is not a good idea, but eh 
        Dynamic onError;

        void runCallbacks(){
            core->RunCallbacks();
        }

        void onActivityJoinRequest(const std::function<void(const char*, int64_t, const char*)> callback){
            core->ActivityManager().OnActivityJoinRequest.Connect([callback = std::move(callback)](discord::User user){
                 callback(user.GetUsername(), user.GetId(), user.GetAvatar());
            });
        }

        void makeParty(const char* id, const char* joinId, const char* spectateId, int currentSize, int maxSize, Dynamic& onPartyMake){
                activity.GetParty().SetId(id);
                activity.GetParty().GetSize().SetCurrentSize(currentSize == 0 ? 1 : currentSize);
                activity.GetParty().GetSize().SetMaxSize(maxSize);
                activity.GetSecrets().SetJoin(joinId);
                activity.GetSecrets().SetSpectate(spectateId);
                core->ActivityManager().UpdateActivity(activity, [onPartyMake = std::move(onPartyMake)](discord::Result result) {
                    const_cast<Dynamic&>(onPartyMake)(((int)result));
                });
        }

        void registerCommand(const char* url){
            core->ActivityManager().RegisterCommand(url);
        }

        void updateActivity(const char* details,
            const char* state,
            const char* smallImage,
            const char* smallText,
            const char* largeImage,
            const char* largeText,
            int type,
            float startTimestamp,
            float endTimestamp,
            Dynamic& callback
        ){
                discord::Activity& activity = discordsdk::activity; // too lazy kek
                activity.SetDetails(details);
                activity.SetState(state);
                activity.GetAssets().SetSmallImage(smallImage);
                activity.GetAssets().SetSmallText(smallText);
                activity.GetAssets().SetLargeImage(largeImage);
                activity.GetAssets().SetLargeText(largeText);
                activity.SetType((discord::ActivityType)type);
                activity.GetTimestamps().SetStart(startTimestamp);
                activity.GetTimestamps().SetEnd(endTimestamp);
                activity.SetInstance(true);
                core->ActivityManager().UpdateActivity(activity, [callback = std::move(callback)](discord::Result result) {
                    (result == discord::Result::Ok) ? const_cast<Dynamic&>(callback)() : onError((int)result);
                });

        }

        void init(int64_t clientId, Dynamic& onInit, Dynamic& onError){
            auto result = discord::Core::Create(clientId, DiscordCreateFlags_Default, &core);
            if (!core) {
                onError((int)result);
                return;
            }
            discordsdk::onInit = std::move(onInit);
            discordsdk::onError = std::move(onError);
            onInit();
        }
    } //discordsdk namespace
} //linc
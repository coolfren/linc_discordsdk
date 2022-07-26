#pragma once

//hxcpp include should always be first    
#ifndef HXCPP_H
#include <hxcpp.h>
#endif
#include <iostream>
#include <chrono>
#include <thread>
#include "../lib/discord.h"
//include other library includes as needed
// #include "../lib/____"

namespace linc {

    namespace discordsdk {

        extern void runCallbacks();

        extern void makeParty(const char* id, const char* joinId, const char* spectateId, int currentSize, int maxSize, Dynamic& onPartyMake);

        extern void registerCommand(const char* url);

        extern void updateActivity(
            const char* details,
            const char* state,
            const char* smallImage,
            const char* smallText,
            const char* largeImage,
            const char* largeText,
            int type,
            float startTimestamp,
            float endTimestamp,
            Dynamic& callback
        );

        extern void init(int64_t clientId, Dynamic& onInit, Dynamic& onError);

    } //discordsdk namespace

} //linc
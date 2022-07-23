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
        extern void updateActivity(
            const char* details,
            const char* state,
            const char* smallImage,
            const char* smallText,
            const char* largeImage,
            const char* largeText,
            int type
        );

        extern void init(int64_t clientId);

    } //discordsdk namespace

} //linc
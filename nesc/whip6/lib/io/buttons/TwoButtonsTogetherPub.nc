/*
 * whip6: Warsaw High-performance IPv6.
 *
 * Copyright (c) 2012-2017 Szymon Acedanski
 * All rights reserved.
 *
 * This file is distributed under the terms in the attached LICENSE     
 * files.
 */

generic configuration TwoButtonsTogetherPub(uint32_t maxDifferenceMs) {
    provides interface ButtonPress;

    uses interface ButtonPress as Button1;
    uses interface ButtonPress as Button2;
}
implementation {
    components new TwoButtonsTogetherPrv(maxDifferenceMs) as Impl;
    Button1 = Impl.Button1;
    Button2 = Impl.Button2;
    ButtonPress = Impl.ButtonPress;

    components new PlatformTimerMilliPub() as Timer;
    Impl.Timer -> Timer;
}

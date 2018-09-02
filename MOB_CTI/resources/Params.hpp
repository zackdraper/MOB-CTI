class params
{
    class headlessClient
    {
        title="Headless Client";
        texts[]={"Disabled","Enabled"};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class load_game
    {
        title="Load Previous Session?";
        texts[]={"Boot misssion from scratch","Load all the data from the previous session"};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class wipe_game
    {
        title="Wipe Old Session?";
        texts[]={"Leave my data alone!","Deletes old saved information from last session"};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class faction1
    {
        title=":::::::::::::::::::::::::: Faction #1 :::::::::::::::::::::::::: ";
        texts[]={"",""};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class faction1_type
    {
        title="Class Type";
        texts[]={"NATO","NATO (Pacific)","FIA","United States Army (Wood) [RHS+CUP]","United States Marine Corp (Wood) [RHS+CUP]","Royal Army Corp of Sahrani (Des) [CUP]",};
        values[]={0,1,2,3,4,5};
        default=0;
        isGlobal=1;
    };

    class faction1_halo
    {
        title="HALO";
        texts[]={"No HALO","Can HALO"};
        values[]={0,1};
        default=1;
        isGlobal=1;
    };

    class faction1_random_pos
    {
        title="Start Position";
        texts[]={"Random","At Base"};
        values[]={0,1};
        default=1;
        isGlobal=1;
    };

    class faction1_aicom
    {
        title="AI Commander";
        texts[]={"No Commander","Assault","Defend"};
        values[]={0,1,2};
        default=0;
        isGlobal=1;
    };

    class faction1_econ
    {
        title="Economy";
        texts[]={"Occupation","External Ammo + Occupation","Limited","Unlimited"};
        values[]={0,1,2,3};
        default=0;
        isGlobal=1;
    };

    class faction1_startfunds
    {
        title="Starting Funds";
        texts[]={"0","100","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000","15000","20000","25000","35000","50000"};
        values[]={"0","100","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000","15000","20000","25000","35000","50000"};
        default="20000";
        isGlobal=1;
    };

    class faction1_startammo
    {
        title="Starting Ammo";
        texts[]={"0","100","250","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000","15000","25000","35000","50000"};
        values[]={"0","100","250","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000","15000","25000","35000","50000"};
        default="250";
        isGlobal=1;
    };

    class faction1_maxfuel
    {
        title="Fuel Supply";
        texts[]={"0","50","100","500","1000","2500","5000","7500","10000"};
        values[]={"0","50","100","500","1000","2500","5000","7500","10000"};
        default="100";
        isGlobal=1;
    };


    class faction1_destroyer
    {
        title="Enable Destroyer";
        texts[]={"Active","Inactive"};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class faction2
    {
        title=":::::::::::::::::::::::::: Faction #2 :::::::::::::::::::::::::: ";
        texts[]={"",""};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class faction2_type
    {
        title="Class Type";
        texts[]={"CSAT","CSAT (Pacific)","Russian Amred Forces (Wood) [RHS+CUP]","Royal Army Corp of Sahrani (Des) [CUP]"};
        values[]={0,1,2,3};
        default=0;
        isGlobal=1;
    };

    class faction2_halo
    {
        title="HALO";
        texts[]={"No HALO","Can HALO"};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class faction2_random_pos
    {
        title="Start Position";
        texts[]={"Random","At Base"};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class faction2_aicom
    {
        title="AI Commander";
        texts[]={"No Commander","Assault","Defend"};
        values[]={0,1,2};
        default=2;
        isGlobal=1;
    };

    class faction2_econ
    {
        title="Economy";
        texts[]={"Occupation","External Ammo + Occupation","Limited","Unlimited"};
        values[]={0,1,2,3};
        default=0;
        isGlobal=1;
    };

    class faction2_startfunds
    {
        title="Starting Funds";
        texts[]={"0","100","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000","15000","20000","25000","35000","50000"};
        values[]={"0","100","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000","15000","20000","25000","35000","50000"};
        default="20000";
        isGlobal=1;
    };

    class faction2_startammo
    {
        title="Starting Ammo";
        texts[]={"0","100","250","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000","15000","25000","35000","50000"};
        values[]={"0","100","250","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000","15000","25000","35000","50000"};
        default="250";
        isGlobal=1;
    };

    class faction2_maxfuel
    {
        title="Fuel Supply";
        texts[]={"0","50","100","500","1000","2500","5000","7500","10000"};
        values[]={"0","50","100","500","1000","2500","5000","7500","10000"};
        default="100";
        isGlobal=1;
    };

    class resistance
    {
        title=":::::::::::::::::::::::::: Resistance :::::::::::::::::::::::::: ";
        texts[]={"",""};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class resistance_type
    {
        title="Class Type";
        texts[]={"AAF","Royal Army Corp of Sahrani (Des) [CUP]"};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };

    class resistance_spawn
    {
        title="Spawn Resistance";
        texts[]={"False","True"};
        values[]={0,1};
        default=1;
        isGlobal=1;
    };

    class resistance_force_mp
    {
        title="Force Multiplier";
        texts[]={0.5,1,1.5,2};
        values[]={0.5,1,1.5,2};
        default=1;
        isGlobal=1;
    };

};

local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 32099;

if EVENT == 100 then
   SelectMsg(UID, 3, -1, 3333, NPC, 9003, 203, 9005, 225);
end

local ITEMA = 0;

if EVENT == 203 then
   -- Exchange Calliou Stick
   -- Henüz tamamen bitmemiştir yakın zamanda tamamlanacaktır hapis sistemi için hazırlanmıştır.
   ITEMA = HowmuchItem(UID, 810164000);
   if ITEMA == 0 then
      SelectMsg(UID, 2, -1, 3334, NPC, 27, 168);
   else
      SelectMsg(UID, 2, -1, 1114, NPC, 4006, 209, 4005, 210);
   end
end

if EVENT == 209 then
   RobItem(UID, 810164000, 1)
   GiveItem(UID, 514573474, 1)
   SelectMsg(UID, 2, -1, 1114, NPC, 27, 168);
end

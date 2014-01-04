local UserClass;
local QuestNum;
local Ret = 0;
local savenum = 100;
local NPC = 29235;
local Level = 50;

if EVENT == 100 then
   SelectMsg(UID, 3, -1, 99999, NPC, 9000, 3001, 9001, 3002, 9002, 3003);
end

if EVENT == 3001 then
   IsTakeToday = GetUserDailyOp(UID, 1);
   if IsTakeToday == 1 then
   GiveItem(UID, 900001000, 1); // Henüz tamamlanmış değil üzerinde oynamalar yapılacaktır.
   else
   SelectMsg(UID, 2, -1, 201318, NPC, 22, 201, 23, 0);
   end
end

if EVENT == 3002 then
   IsTakeToday = GetUserDailyOp(UID, 1);
   if IsTakeToday == 1 then
   GiveItem(UID, 910246000, 1);
   else
   SelectMsg(UID, 2, -1, 201318, NPC, 22, 202, 23, 0);
   end
end

if EVENT == 3003 then
   IsTakeToday = GetUserDailyOp(UID, 1);
   if IsTakeToday == 1 then
   GiveItem(UID, 910246000, 1);
   else
   SelectMsg(UID, 2, -1, 201318, NPC, 22, 203, 23, 0);
   end
end

if EVENT == 201 then
   ExpChange(UID, 200000000)
end   

if EVENT == 3005 then
   ITEMA = HowmuchItem(UID, 900184000);
   if ITEMA > 0 then
   SelectMsg(UID, 2, -1, 9269, NPC, 7119, 202, 7120, 204);
   else
   SelectMsg(UID, 2, -1, 9276, NPC, 10, 241);
   end
end

if EVENT == 202 then
   GiveItem(UID, 900028683, 1)
end

if EVENT == 203 then
   GiveItem(UID, 910246000, 1)
   GiveItem(UID, 800012000, 1)
   GiveItem(UID, 800014000, 1)
   GiveItem(UID, 800010000, 1)
   GiveItem(UID, 800015000, 1)
end

if EVENT == 3004 then
   SelectMsg(UID, 3, -1, 9277, NPC, 7121, 206, 7122, 207, 7123, 208, 7124, 209);
end

if EVENT == 241 then
   Ret = 1;
end

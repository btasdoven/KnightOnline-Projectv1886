--[°íÇàÀÇ °¨½ÃÀÎ]Å×ÆÄ
-- ±×³É ´Ý±â 168

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ë

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;


if EVENT == 168 then
	Ret = 1;
end

-- [°íÇàÀÇ °¨½ÃÀÎ]Å×ÆÄ Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

local ItemA;
local NPC = 14417;
local savenum = 431;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910127000);  -- ¸í·É¼­ 
    if  ItemA == 0 then -- ¸í·É¼­ ¾øÀ»¶§
    SelectMsg(UID, 2, savenum, 4550, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- ¸í·É¼­ ÀÖÀ»¶§ 
    SelectMsg(UID, 4, savenum, 4551, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4552, NPC, 4212, 102, 4213, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 102 then
   ChangePosition(UID)
   RunExchange(UID, 482);		 
   SaveEvent(UID, 4297);
end

if EVENT == 103 then
    ChangePosition(UID)
    RobItem(UID, 910127000, 1);
    SelectMsg(UID, 2, savenum, 4553, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

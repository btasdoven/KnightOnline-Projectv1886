--[°íÇàÀÇ ±³´ëÀÎ]ÆÄÅõ
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

-- [°íÇàÀÇ ±³´ëÀÎ]ÆÄÅõ Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

local ItemA;
local NPC = 14420;
local savenum = 434;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910130000);  -- 3¹øÂ° ÁõÇ¥ 
    if  ItemA == 0 then -- 3¹øÂ° ÁõÇ¥  ¾øÀ»¶§
    SelectMsg(UID, 2, savenum, 4562, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 3¹øÂ° ÁõÇ¥  ÀÖÀ»¶§ 
    SelectMsg(UID, 4, savenum, 4563, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4564, NPC, 4218, 102, 4219, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 103 then
   ChangePosition(UID)
   RunExchange(UID, 485);		 
   SaveEvent(UID, 4300);
end

if EVENT == 102 then
    ChangePosition(UID)
    RobItem(UID, 910130000, 1);
    SelectMsg(UID, 2, savenum, 4565, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

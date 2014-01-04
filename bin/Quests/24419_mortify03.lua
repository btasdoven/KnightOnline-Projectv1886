--[°íÇàÀÇ ¼öÇàÀÎ]ÆÄÇ»´Ù
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

-- [°íÇàÀÇ ¼öÇàÀÎ]ÆÄÇ»´Ù Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

local ItemA;
local NPC = 24419;
local savenum = 433;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910129000);  -- 2¹øÂ° ÁõÇ¥ 
    if  ItemA == 0 then -- 2¹øÂ° ÁõÇ¥ ¾øÀ»¶§
    SelectMsg(UID, 2, savenum, 4528, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 2¹øÂ° ÁõÇ¥  ÀÖÀ»¶§ 
    SelectMsg(UID, 4, savenum, 4529, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4530, NPC, 4216, 102, 4217, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 102 then
   ChangePosition(UID)
   RunExchange(UID, 484);		 
   SaveEvent(UID, 4285);
end

if EVENT == 103 then
    ChangePosition(UID)
    RobItem(UID, 910129000, 1);
    SelectMsg(UID, 2, savenum, 4531, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

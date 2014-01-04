--[°íÇàÀÇ À²½ÃÀÎ]Á¦¶óÀÎ
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

-- [°íÇàÀÇ À²½ÃÀÎ]Á¦¶óÀÎ Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

local ItemA;
local NPC = 24422;
local savenum = 436;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910132000);   -- 5¹øÂ° ÁõÇ¥
    if  ItemA == 0 then  -- 5¹øÂ° ÁõÇ¥ ¾øÀ»¶§
    SelectMsg(UID, 2, savenum, 4540, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 4¹øÂ° ÁõÇ¥ ÀÖÀ»¶§ 
    SelectMsg(UID, 4, savenum, 4541, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4542, NPC, 4222, 102, 4223, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 102 then
   ChangePosition(UID)
   RunExchange(UID, 487);		 
   SaveEvent(UID, 4288);
end

if EVENT == 103 then
    ChangePosition(UID)
    RobItem(UID, 910132000, 1);
    SelectMsg(UID, 2, savenum, 4543, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

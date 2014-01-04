
-- [¸¶½ºÅÍ ½ºÄ«Å°]

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°ø?

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;

-- [¸¶½ºÅÍ ½ºÄ«Å°][Ä«·ç] Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, 24201);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 3824, 24201, 3001, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- ¹» ÇÏ´Â °É±î?
			 Ret = 1; -- ÀÌ°Ç ¿Ö ÀúÀå ½ÃÄÑ¿ä? ±×³É RETURNÀº ¾ÈµÇ³ª¿ä?
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          NpcMsg(UID, 3824, 24201)
      else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end


--½ºÅ©¸² Äù½ºÆ®

if EVENT == 220 then
   SelectMsg(UID, 1, 310, 3028, 24201, 3006, 221, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 221 then
   ShowMap(UID, 305);
   SaveEvent(UID, 3142);
end

if EVENT == 222 then
   SelectMsg(UID, 1, 310, 3028, 24201, 3006, 221, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- ½ºÅ©¸² 310¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 223 then
   SelectMsg(UID, 2, 310, 3064, 24201, 3010, 224, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 224 then
   SelectMsg(UID, 4, 310, 3065, 24201, 22, 225, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 225 then
   SaveEvent(UID, 3143);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 226 then
   SaveEvent(UID, 3145);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 310, 3069, 24201, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 310, 3070, 24201, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 228 then
   ITEM_COUNT1 = HowmuchItem(UID, 379046000);
   ITEM_COUNT2 = HowmuchItem(UID, 389074000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 29 and ITEM_COUNT3  > 4999999  then-- Àç·á ´ÙÀÖÀ»¶§
      SelectMsg(UID, 4, 310, 3071, 24201, 10, 230, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1Àç·á ¾øÀ»¶§
        SelectMsg(UID, 2, 310, 3068, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <=29 then -- 2Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, 310, 3068, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 3Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, 310, 3068, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end

if EVENT == 229 then
   ShowMap(UID, 305);
end

local Check;

if EVENT == 230 then
   Check = CheckExchange(UID, 310)
   if  Check ==1 then
   RunExchange(UID, 310);
   SaveEvent(UID, 3146);
   else
  Ret = 1;	
  end	 
end

--ÈûÀÇÀÎÀå Äù½ºÆ®
--local SHOW_MAP; -- Áöµµ º¸¿©ÁÖ´« ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä

if EVENT == 300 then
   SelectMsg(UID, 1, 311, 3001, 24201, 28, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 301 then
   ShowMap(UID, 305);
   SaveEvent(UID, 3162);
end

if EVENT == 302 then
   SelectMsg(UID, 1, 311, 3002, 24201, 28, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--ÈûÀÇÀÎÀå 311¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 303 then
   SelectMsg(UID, 2, 311, 3072, 24201, 3002, 304, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 304 then
   SelectMsg(UID, 4, 311, 3073, 24201, 22, 305, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 305 then
   SaveEvent(UID, 3163);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 306 then
   SaveEvent(UID, 3165);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 311, 3077, 24201, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 311, 3078, 24201, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 308 then
   ITEM_COUNT1 = HowmuchItem(UID, 910042000);
   ITEM_COUNT2 = HowmuchItem(UID, 389076000);
   ITEM_COUNT3 = HowmuchItem(UID, 379067000);
   if ITEM_COUNT1  > 29 and ITEM_COUNT2  > 29 and ITEM_COUNT3  > 0 then-- Àç·á ´ÙÀÖÀ»¶§
      SelectMsg(UID, 4, 311, 3079, 24201, 10, 310, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if  ITEM_COUNT1 <= 29 then -- 1Àç·á ¾øÀ»¶§
        SelectMsg(UID, 2, 311, 3076, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 29 then -- 2Àç·á ¾øÀ»¶§
        SelectMsg(UID, 2, 311, 3076, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 3Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, 311, 3076, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end


if EVENT == 309 then
   ShowMap(UID, 305);
end

local Check;

if EVENT == 310 then
   Check = CheckExchange(UID, 311)
   if  Check ==1 then
   RunExchange(UID, 311);
   SaveEvent(UID, 3166);
   else
  Ret = 1;	
  end	 
end

--Ã¼·ÂÀÇºñ¾à Äù½ºÆ®
--local SHOW_MAP; -- Áöµµ º¸¿©ÁÖ´« ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä

if EVENT == 400 then
   SelectMsg(UID, 1, 312, 3001, 24201, 28, 401, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 401 then
   ShowMap(UID, 305);
   SaveEvent(UID, 3182);
end

if EVENT == 402 then
   SelectMsg(UID, 1, 312, 3002, 24201, 28, 401, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--Ã¼·ÂÀÇºñ¾à 312¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 403 then
   SelectMsg(UID, 2, 312, 3080, 24201, 3000, 404, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 404 then
   SelectMsg(UID, 4, 312, 3081, 24201, 22, 405, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 405 then
   SaveEvent(UID, 3183);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 406 then
   SaveEvent(UID, 3185);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 312, 3085, 24201, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 312, 3086, 24201, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 407 then
   SaveEvent(UID, 3185);
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 408 then
   ITEM_COUNT1 = HowmuchItem(UID, 379204000);
   ITEM_COUNT2 = HowmuchItem(UID, 379041000);
   ITEM_COUNT3 = HowmuchItem(UID, 379099000);
   if ITEM_COUNT1  > 49 and ITEM_COUNT2  > 0 and ITEM_COUNT3  > 19 then-- Àç·á ´ÙÀÖÀ»¶§
      SelectMsg(UID, 4, 312, 3087, 24201, 10, 410, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if  ITEM_COUNT1 <= 49 then -- 1Àç·á ¾øÀ»¶§
        SelectMsg(UID, 2, 312, 3084, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2Àç·á ¾øÀ»¶§
        SelectMsg(UID, 2, 312, 3084, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 3Àç·á ¾øÀ»¶§
        SelectMsg(UID, 2, 312, 3084, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end

if EVENT == 409 then
   ShowMap(UID, 305);
end

local Check;

if EVENT == 410 then
   Check = CheckExchange(UID, 400)
   if  Check ==1 then
   RunExchange(UID, 312);
   SaveEvent(UID, 3186);
   else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 2Â÷ ÀüÁ÷ ½ÃÀÛ 
--******************************************************--

local NPC = 24201;
local savenum = 408;

-- ½Ãµå¹Ì¼¿ µîÀå

if EVENT == 530 then
   Class = CheckClass (UID);
   if Class == 5 then -- 2Â÷ÀüÁ÷ °¡´ÉÇÑ °æ¿ì
   SaveEvent(UID, 4081); --helper ¹øÈ£ ¼öÁ¤ 
   NATION = CheckNation(UID);
      if NATION == 1 then --Ä«·ç½º ÀÏ¶§ 
      SelectMsg(UID, 1, savenum, 4080, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, savenum, 4081, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   else -- 2Â÷ ÀüÁ÷ÀÌ µÇ°Å³ª, 1Â÷ ÀüÁ÷µµ ¾ÈÇÑ °æ¿ì
    Ret = 1;
   end
end

-- ½ºÄ«Å° 408¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 532 then   
Level = CheckLevel(UID)
   if Level > 59 then -- ·¹º§ÀÌ 60ÀÌ»óÀÎ°¡?   
   Class = CheckClass (UID);
      if Class == 5 or Class == 7 or Class == 9 or Class == 11 then -- 1Â÷ ÀüÁ÷ ÀüÀÎ°¡ Ã¼Å©
       SelectMsg(UID, 4, savenum, 4084, NPC, 22, 533, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else --1Â÷ ÀüÁ÷À» ÀÌ¹Ì ÇßÀ»¶§
      SaveEvent(UID, 4083);
      SelectMsg(UID, 2, savenum, 4083, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   else --·¹º§ÀÌ 60ÀÌÇÏÀÏ¶§ 
   SelectMsg(UID, 2, savenum, 4082, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 533 then
   SaveEvent(UID, 4082); --¼ö¶ô½Ã
end

if EVENT == 534 then
   SaveEvent(UID, 4085); -- °ÅÀý½Ã 
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 535 then
   SaveEvent(UID, 4084);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, savenum, 4089, NPC, 4080, 538, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, savenum, 4090, NPC, 4080, 538, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

-- ½ºÄ«Å° 408¹øÀÇ ¼Ó¼º 1¹ø 3¹øÀÏ °æ¿ì

if EVENT == 536 then
   ITEM_COUNTA = HowmuchItem(UID, 320410011); --·Îº¸ÀÇ Ææ´øÆ®
   ITEM_COUNTB = HowmuchItem(UID, 320410012); -- ·¯ÆÛ½ºÀÇ ÆÒ´øÆ®
   ITEM_COUNTC = HowmuchItem(UID, 320410013);-- ¸®Ä«¿ÂÀÇ ÆÒ´øÆ®
   ITEM_COUNTD = HowmuchItem(UID, 379236000);-- ¸¶¹ýÀÇ º¸¼®°¡·ç
    if  ITEM_COUNTA  > 0 and  ITEM_COUNTB  > 0 and  ITEM_COUNTC  > 0 and  ITEM_COUNTD  > 0 then --Àç·á°¡ ´ÙÀÖÀ»¶§ 
      SelectMsg(UID, 2, savenum, 4091, NPC, 4062, 537, 4063, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- Àç·á°¡ ¾øÀ»¶§
       if ITEM_COUNTA <= 0 then -- A Àç·á ¾øÀ»¶§
       SelectMsg(UID, 2, savenum, 4085, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTB <= 0 then -- B Àç·á ¾øÀ»¶§ 
       SelectMsg(UID, 2, savenum, 4086, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTC <= 0 then -- C Àç·á ¾øÀ»¶§ 
       SelectMsg(UID, 2, savenum, 4087, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- D Àç·á ¾øÀ»¶§
       SelectMsg(UID, 2, savenum, 4088, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
   end
end

if EVENT == 537 then
   SaveEvent(UID, 4083);
   RobItem(UID, 320410011, 1);
   RobItem(UID, 320410012, 1);
   RobItem(UID, 320410013, 1);
   RobItem(UID, 379236000, 1);
   PromoteUser(UID)
   NATION = CheckNation(UID);
   if NATION == 1 then --Ä«·ç½º ÀÏ¶§ 
   SelectMsg(UID, 1, savenum, 4092, NPC, 4064, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
   SelectMsg(UID, 1, savenum, 4093, NPC, 4064, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 538 then
   ShowMap(UID, 305);
end

--******************************************************--
-- 2Â÷ ÀüÁ÷ ³¡ 
--******************************************************--
--******************************************************--
-- 70Lv skill - start
--******************************************************--

--seed or misel call

if EVENT == 620 then
   SelectMsg(UID, 1, 51, 3215, 24201, 3006, 621, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 621 then
   ShowMap(UID, 305);
   SaveEvent(UID, 3412);
end

if EVENT == 622 then
   SelectMsg(UID, 1, 51, 3214, 24201, 3006, 621, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 70Lv skill no.51 type 0 or 4

if EVENT == 623 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2Â÷ ÀüÁ÷ ÀÚÀÎ°¡ Ã¼Å© 
    SelectMsg(UID, 2, 51, 3216, 24201, 10, 624, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2Â÷ ÀüÁ÷À» ¾ÈÇßÀ»¶§ 
    SelectMsg(UID, 2, 51, 4710, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 623 then
   SelectMsg(UID, 2, 51, 3216, 24201, 10, 624, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 624 then
   SelectMsg(UID, 4, 51, 3217, 24201, 22, 625, 23, 631, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 625 then
   SaveEvent(UID, 3413);
   SelectMsg(UID, 2, 51, 3218, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 631 then
   SelectMsg(UID, 2, 51, 3219, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 626 then
   SaveEvent(UID, 3415);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 51, 3221, 24201, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 51, 3222, 24201, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 628 then
   ITEM_COUNT1 = HowmuchItem(UID, 379243000);
   ITEM_COUNT2 = HowmuchItem(UID, 379244000);
   ITEM_COUNT3 = HowmuchItem(UID, 379063000);
   ITEM_COUNT4 = HowmuchItem(UID, 389076000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 0 and ITEM_COUNT3  > 0  and ITEM_COUNT4  > 29  then-- Àç·á ´ÙÀÖÀ»¶§
      SelectMsg(UID, 4, 51, 3223, 24201, 41, 630, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1Àç·á ¾øÀ»¶§
        SelectMsg(UID, 2, 51, 3220, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, 51, 3220, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT3 <= 0 then -- 3Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, 51, 3220, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 4Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, 51, 3220, 24201, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end

if EVENT == 629 then
   ShowMap(UID, 304);
end

local Check;

if EVENT == 630 then
        Check = CheckExchange(UID, 329)
        if  Check == 1 then
            Exchange =RunExchange(UID, 329);
            if  Exchange ==0 then
            SaveEvent(UID, 3414);
            else
            Ret = 1;	
            end	 
        else
        Ret = 1;	
        end	 
end

--******************************************************--
-- 70Lv skill - end
--******************************************************--

--******************************************************--
-- 75Lv skill - start
local savenum = 510;
local NPC = 24201;
--******************************************************--

--seed or misel call

if EVENT == 720 then
   SelectMsg(UID, 1, savenum, 5100, NPC, 3006, 721, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--½Ãµå

if EVENT == 721 then
   ShowMap(UID, 305);
   SaveEvent(UID, 5107);
end

if EVENT == 722 then
   SelectMsg(UID, 1, savenum, 5101, NPC, 3006, 721, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--¹Ì¼¿

-- 70Lv skill no.51 type 0 or 4

if EVENT == 723 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2Â÷ ÀüÁ÷ ÀÚÀÎ°¡ Ã¼Å© 
    SelectMsg(UID, 2, savenum, 5103, NPC, 10, 724, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2Â÷ ÀüÁ÷À»¾ÈÇßÀ»¶§ 
    SelectMsg(UID, 2, savenum, 5102, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 724 then
   SelectMsg(UID, 4, savenum, 5104, NPC, 22, 725, 23, 731, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 725 then
   SaveEvent(UID, 5108);
   SelectMsg(UID, 2, savenum, 5105, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 731 then
   SelectMsg(UID, 2, savenum, 5106, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 726 then
   SaveEvent(UID, 5110);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, savenum, 5108, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, savenum, 5109, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 728 then
   ITEM_COUNT1 = HowmuchItem(UID, 379244000);
   ITEM_COUNT2 = HowmuchItem(UID, 379236000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- Àç·á ´ÙÀÖÀ»¶§
      SelectMsg(UID, 4, savenum, 5110, NPC, 41, 730, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1Àç·á ¾øÀ»¶§
        SelectMsg(UID, 2, savenum, 5107, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, savenum, 5107, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT3 <= 0 then -- 3Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, savenum, 5107, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 4Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, savenum, 5107, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end



local Check;

if EVENT == 730 then
   Check = CheckExchange(UID, 520)
   if  Check == 1 then
   Exchange =RunExchange(UID, 520);
        if  Exchange ==0 then
        SaveEvent(UID, 5109);
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 75Lv skill - end
--******************************************************--
--******************************************************--
-- 80Lv skill - start
local savenum = 511;
local NPC = 24201;
--******************************************************--

--seed or misel call

if EVENT == 820 then
   SelectMsg(UID, 1, savenum, 5111, NPC, 3006, 821, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--½Ãµå

if EVENT == 821 then
   ShowMap(UID, 305);
   SaveEvent(UID, 5113);
end

if EVENT == 822 then
   SelectMsg(UID, 1, savenum, 5112, NPC, 3006, 821, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--¹Ì¼¿

-- 70Lv skill no.51 type 0 or 4

if EVENT == 823 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2Â÷ ÀüÁ÷ ÀÚÀÎ°¡ Ã¼Å© 
    SelectMsg(UID, 2, savenum, 5114, NPC, 10, 824, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2Â÷ ÀüÁ÷À»¾ÈÇßÀ»¶§ 
    SelectMsg(UID, 2, savenum, 5113, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 824 then
   SelectMsg(UID, 4, savenum, 5115, NPC, 22, 825, 23, 831, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 825 then
   SaveEvent(UID, 5114);
   SelectMsg(UID, 2, savenum, 5116, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 831 then
   SelectMsg(UID, 2, savenum, 5117, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 826 then
   SaveEvent(UID, 5116);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, savenum, 5119, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, savenum, 5120, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 828 then
   ITEM_COUNT1 = HowmuchItem(UID, 379243000);
   ITEM_COUNT2 = HowmuchItem(UID, 379236000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- Àç·á ´ÙÀÖÀ»¶§
      SelectMsg(UID, 4, savenum, 5121, NPC, 41, 830, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1Àç·á ¾øÀ»¶§
        SelectMsg(UID, 2, savenum, 5118, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, savenum, 5118, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT3 <= 0 then -- 3Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, savenum, 5118, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 4Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, savenum, 5118, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end


local Check;

if EVENT == 830 then
   Check = CheckExchange(UID, 521)
   if  Check == 1 then
   Exchange =RunExchange(UID, 521);
        if  Exchange ==0 then
        SaveEvent(UID, 5115);
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 80Lv skill - end
--******************************************************--

return Ret;

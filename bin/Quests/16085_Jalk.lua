-- [°æºñº´]ÀßÅ©
-- ±×³É ´Ý±â 168

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ë

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°ø?

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 14427;


-- [°æºñº´]ÀßÅ© Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

if EVENT == 165 then
    Level = CheckLevel(UID)
    if Level < 17 then -- ·¹º§ÀÌ 17ÀÌÇÏÀÎ°¡?
    SelectMsg(UID, 2, savenum, 4700, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else 
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
			 SelectMsg(UID, 2, -1, 4701, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1;
		elseif QuestNum > 1 and QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          NpcMsg(UID, 4131, NPC)
        else--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          EVENT = QuestNum
		end
   end
end


if EVENT == 168 then -- ±×³É ´Ý±â 
    Ret = 1;
end


-------------------------------
------´Á´ëÀÎ°£ »ç³É ----------
-------------------------------

if EVENT == 300 then
   SelectMsg(UID, 1, 135, 1232, NPC, 28, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 301 then
   ShowMap(UID, 496);
   SaveEvent(UID, 432);
end

--  102¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 302 then
   SelectMsg(UID, 2, 135, 657, NPC, 10, 310, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 310 then
   SelectMsg(UID, 4, 135, 658, NPC, 22, 303, 23,304, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 303 then
   SaveEvent(UID, 433);
end

if EVENT == 304 then
   SaveEvent(UID, 436);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 305 then
   SaveEvent(UID, 435);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 135, 659, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 135, 660, NPC, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 307 then
    ITEM_COUNT = GetMaxExchange(UID, 85); --exchange Å×ÀÌºí ÀÎµ¦½º°ª   
   if  ITEM_COUNT <= 0 then -- Àç·á ¾øÀ»¶§
      SelectMsg(UID, 2, 135, 661, NPC, 18, 308, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT  > 0 then-- Àç·á ÀÖÀ»¶§
          SelectMsg(UID, 2, 135, 662, NPC, 4006, 309, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
           
   end
end

if EVENT == 308 then
   ShowMap(UID, 35);
end


local Check;

if EVENT == 309 then
  Check = CheckExchange(UID, 85)
   if  Check ==1 then
   ITEM_COUNT = GetMaxExchange(UID, 85); --exchange Å×ÀÌºí ÀÎµ¦½º°ª    
 	RunCountExchange(UID, 85, ITEM_COUNT);	   
   SaveEvent(UID, 436);
   else
  Ret = 1;	
  end	 
end

-------------------------------
------´Á´ëÀÎ°£ »ç³É³¡----------
-------------------------------

-------------------------------
------ºí·¢ ½ÇÅ© ¹¶Ä¡ ----------
-------------------------------

if EVENT == 231 then
   SelectMsg(UID, 1, 125, 577, NPC, 28, 232, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 232 then
   ShowMap(UID, 496);
   SaveEvent(UID, 332);
end

--  102¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 233 then
   SelectMsg(UID, 2, 125, 578, NPC, 10, 234, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 234 then
   SelectMsg(UID, 4, 125, 579, NPC, 22, 235, 23, 236, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 235 then
   SaveEvent(UID, 333);
end

if EVENT == 236 then
   SaveEvent(UID, 336);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 237 then
   SaveEvent(UID, 335);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 125, 580, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 125, 581, NPC, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 



if EVENT == 239 then
 ITEM_COUNT = HowmuchItem(UID, 379252000);  
   if  ITEM_COUNT < 50 then -- Àç·á ¾øÀ»¶§
      SelectMsg(UID, 2, 225, 582, NPC, 18, 240, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT  >= 50 then-- Àç·á ÀÖÀ»¶§
          SelectMsg(UID, 2, 225, 583, NPC, 4006, 241, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
           
   end
end

if EVENT == 240 then
   ShowMap(UID, 33);
end



local Check;

if EVENT == 241 then
  Check = CheckExchange(UID, 51)
   if  Check ==1 then
   SaveEvent(UID, 334);
   RunExchange(UID, 51)
   else
  Ret = 1;	
  end	 
end
-------------------------------
------ºí·¢ ½ÇÅ© ¹¶Ä¡ ³¡--------
-------------------------------

-------------------------------
------È²½Ç °ø»ç - ÇÉ¼­ µ¶ -----
-------------------------------
--ÇÉ¼­µ¶ ¼öÁý
--. ¹Ì½©

if EVENT == 195 then
   SelectMsg(UID, 1, 123, 1228, NPC, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 496);
   SaveEvent(UID, 302);
end

--  102¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 200 then
   SelectMsg(UID, 2, 123, 562, NPC, 10, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 123, 563, NPC, 22, 202, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 202 then
   SaveEvent(UID, 303);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 205 then
   SaveEvent(UID, 305);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 123, 564, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 123, 565, NPC, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 210 then
   ITEM_COUNT = GetMaxExchange(UID, 46); --exchange Å×ÀÌºí ÀÎµ¦½º°ª   
   if  ITEM_COUNT <= 0 then -- Àç·á ¾øÀ»¶§
      SelectMsg(UID, 2, 123, 566, NPC, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT  > 0 then-- Àç·á ÀÖÀ»¶§
          SelectMsg(UID, 2, 123, 567, NPC, 4006, 214, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
           
   end
end

if EVENT == 213 then
   ShowMap(UID, 32);
end

local Check;

if EVENT == 214 then
  Check = CheckExchange(UID, 46)
   if  Check ==1 then
   ITEM_COUNT = GetMaxExchange(UID, 46); --exchange Å×ÀÌºí ÀÎµ¦½º°ª    
 	RunCountExchange(UID, 46, ITEM_COUNT);	   
   SaveEvent(UID, 306);      
   else
  Ret = 1;	
  end	 
end
-------------------------------
------È²½Ç °ø»ç - ÇÉ¼­ µ¶ ³¡---
-------------------------------

-------------------------------
------Áß¾Ó ÄÍÇÁ ¼öÈ£ ----------
-------------------------------


--¹Ì½© ½ÃÀÛ
if EVENT == 215 then
   SelectMsg(UID, 1, 124, 1229, NPC, 28, 216, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 216 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
   ShowMap(UID, 496);
   SaveEvent(UID, 308);
    elseif Class == 2 or Class == 7 or Class == 8 then
   ShowMap(UID, 496);
   SaveEvent(UID, 314);
    elseif Class == 3 or Class == 9 or Class == 10 then
   ShowMap(UID, 496);
   SaveEvent(UID, 320);
   elseif Class == 4 or Class == 11 or Class == 12 then
   ShowMap(UID, 496);
   SaveEvent(UID, 326);
   end
end


-- [´ëÀåÀåÀÌ] ÇØÆÄ   104¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 217 then
   SelectMsg(UID, 2, 124, 570, NPC, 10, 218, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 218 then
   SelectMsg(UID, 4, 124, 571, NPC, 22, 219, 23, 220, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 219 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 309);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 315);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 321);
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 327);
   end
end

if EVENT == 220 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 312);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 318);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 324);
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 330);
   end
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 221 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       SaveEvent(UID, 311);
       EVENT = 222
       elseif Class == 2 or Class == 7 or Class == 8 then
       SaveEvent(UID, 317);
       EVENT = 222
       elseif Class == 3 or Class == 9 or Class == 10 then
       SaveEvent(UID, 323);
       EVENT = 222
      elseif Class == 4 or Class == 11 or Class == 12 then
       SaveEvent(UID, 329);
       EVENT = 222
      end
end

if EVENT == 222 then
   NATION = CheckNation(UID);
   if NATION == 1 then --Ä«·ç½º ÀÏ¶§ 
   SelectMsg(UID, 1, 124, 572, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
   SelectMsg(UID, 1, 124, 573, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


--[´ëÀåÀåÀÌ] ÇØÆÄ   124¹øÀÇ ¼Ó¼º 1¹ø 3¹øÀÏ °æ¿ì

   local ItemA = 0;
   local RUN_EXCHANGE ;

if EVENT == 224 then 
    ItemA = HowmuchItem(UID, 379253000);  
      if  ItemA < 1  then
       SelectMsg(UID, 2, 124, 574, NPC, 10, 225, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif  ItemA >= 5  then
       SelectMsg(UID, 5, 124, 575, NPC, 4006, 226, 27, 220, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

if EVENT == 225 then
   ShowMap(UID, 23);
end

if EVENT == 226 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       EVENT = 227
       elseif Class == 2 or Class == 7 or Class == 8 then
       EVENT = 228
       elseif Class == 3 or Class == 9 or Class == 10 then
       EVENT = 229
      elseif Class == 4 or Class == 11 or Class == 12 then
       EVENT = 230
      end
end

local Check;
if EVENT == 227 then
  Check = CheckExchange(UID, 47)
   if  Check ==1 then
   SaveEvent(UID, 310);
   RunSelectExchange(UID, 47)
   else
  Ret = 1;	
  end	 
end

local Check1;

if EVENT == 228 then
  Check1 = CheckExchange(UID, 48)
   if  Check1 ==1 then
   SaveEvent(UID, 316);
   RunSelectExchange(UID, 48)
   else
  Ret = 1;	
  end	 
end

local Check2;

if EVENT == 229 then
  Check2 = CheckExchange(UID, 49)
   if  Check2 ==1 then
   SaveEvent(UID, 322);
   RunSelectExchange(UID, 49)
   else
  Ret = 1;	
  end	 
end


local Check3;

if EVENT == 230 then
  Check3 = CheckExchange(UID, 50)
   if  Check3 ==1 then
   SaveEvent(UID, 328);
   RunSelectExchange(UID, 50)
   else
  Ret = 1;	
  end	 
end


-------------------------------
------Áß¾Ó ÄÍÇÁ ¼öÈ£ ³¡ -------
-------------------------------

-------------------------------
------½ºÆ÷ÀÏ·¯ »ç³É ½ÃÀÛ-------
-------------------------------

if EVENT == 8230 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7938);
    EVENT = 8231
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7943);
    EVENT = 8231
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7948);
    EVENT = 8231
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7953);
    EVENT = 8231
   end
end

if EVENT == 8231 then
    SelectMsg(UID, 1, 802, 8019, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8232 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 802, 8021, NPC, 10, 8235, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 802, 8149, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8235 then
    SelectMsg(UID, 4, 802, 8022, NPC, 22, 8233, 23, 8034, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8233 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7939);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7944);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7949);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7954);
   end
end

if EVENT == 8234 then
   SaveEvent(UID, 7942); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 8240 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7941);
    EVENT = 8241
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7946);
    EVENT = 8241
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7951);
    EVENT = 8241
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7956);
    EVENT = 8241
   end
end

if EVENT == 8241 then
    SelectMsg(UID, 1, 802, 8020, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8236 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, 802, 8023, NPC, 10, 8237, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
       SelectMsg(UID, 4, 802, 8024, NPC, 10, 8238, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8237 then
   ShowMap(UID, 521);
end

local Check;

if EVENT == 8238 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 801)
        if  Check ==1 then        
        RunExchange(UID, 801);
        SaveEvent(UID, 7940);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 803)
        if  Check ==1 then        
        RunExchange(UID, 803);
        SaveEvent(UID, 7945);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 804)
        if  Check ==1 then        
        RunExchange(UID, 804);
        SaveEvent(UID, 7950);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 805)
        if  Check ==1 then        
        RunExchange(UID, 805);
        SaveEvent(UID, 7955);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-------½ºÆ÷ÀÏ·¯ »ç³É ³¡--------
-------------------------------

----------------------------------
------ÀüÀï ±¸È£ ¹°ÀÚ ÁØºñ - 2Â÷---
----------------------------------


--¹Ì½© ½ÃÀÛ
if EVENT == 242 then
   SelectMsg(UID, 1, 126, 1231, NPC, 28, 243, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 243 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
   ShowMap(UID, 496);
   SaveEvent(UID, 338);
    elseif Class == 2 or Class == 7 or Class == 8 then
   ShowMap(UID, 496);
   SaveEvent(UID, 343);
    elseif Class == 3 or Class == 9 or Class == 10 then
   ShowMap(UID, 496);
   SaveEvent(UID, 348);
   elseif Class == 4 or Class == 11 or Class == 12 then
   ShowMap(UID, 496);
   SaveEvent(UID, 353);
   end
end


-- [´ëÀåÀåÀÌ] ÇØÆÄ   104¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 244 then
   SelectMsg(UID, 2, 126, 586, NPC, 10, 245, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 245 then
   SelectMsg(UID, 4, 126, 587, NPC, 22, 246, 23, 247, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 246 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 339);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 344);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 349);
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 354);
   end
end

if EVENT == 247 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 342);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 347);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 352);
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 357);
   end
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 248 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       SaveEvent(UID, 341);
       EVENT = 249
       elseif Class == 2 or Class == 7 or Class == 8 then
       SaveEvent(UID, 346);
       EVENT = 249
       elseif Class == 3 or Class == 9 or Class == 10 then
       SaveEvent(UID, 351);
       EVENT = 249
      elseif Class == 4 or Class == 11 or Class == 12 then
       SaveEvent(UID, 356);
       EVENT = 249
      end
end

if EVENT == 249 then
   NATION = CheckNation(UID);
   if NATION == 1 then --Ä«·ç½º ÀÏ¶§ 
   SelectMsg(UID, 1, 126, 588, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
   SelectMsg(UID, 1, 126, 589, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


--[´ëÀåÀåÀÌ] ÇØÆÄ   124¹øÀÇ ¼Ó¼º 1¹ø 3¹øÀÏ °æ¿ì

   local ItemA = 0;
   local RUN_EXCHANGE ;

if EVENT == 250 then 
    ItemA = HowmuchItem(UID, 379015000);  
      if  ItemA < 10  then
       SelectMsg(UID, 2, 126, 590, NPC, 10, 256, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ItemA >= 10  then
       SelectMsg(UID, 2, 126, 591, NPC, 4006, 251, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

if EVENT == 256 then
   ShowMap(UID, 21);
end

if EVENT == 251 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       EVENT = 252
       elseif Class == 2 or Class == 7 or Class == 8 then
       EVENT = 253
       elseif Class == 3 or Class == 9 or Class == 10 then
       EVENT = 254
      elseif Class == 4 or Class == 11 or Class == 12 then
       EVENT = 255
      end
end

local Check;
if EVENT == 252 then
  Check = CheckExchange(UID, 52)
   if  Check ==1 then
   SaveEvent(UID, 340);
   RunExchange(UID, 52)
   else
  Ret = 1;	
  end	 
end

local Check1;

if EVENT == 253 then
  Check1 = CheckExchange(UID, 53)
   if  Check1 ==1 then
   SaveEvent(UID, 345);
   RunExchange(UID, 53)
   else
  Ret = 1;	
  end	 
end

local Check2;

if EVENT == 254 then
  Check2 = CheckExchange(UID, 54)
   if  Check2 ==1 then
   SaveEvent(UID, 350);
   RunExchange(UID, 54)
   else
  Ret = 1;	
  end	 
end


local Check3;

if EVENT == 255 then
  Check3 = CheckExchange(UID, 55)
   if  Check3 ==1 then
   SaveEvent(UID, 355);
   RunExchange(UID, 55)
   else
  Ret = 1;	
  end	 
end



-------------------------------
------ÀüÀï ±¸È£ ¹°ÀÚ ÁØºñ - 2Â÷ ³¡ -------
-------------------------------


-------------------------------
-------·ç°¡·ç »ç³É ½ÃÀÛ--------
-------------------------------

if EVENT == 8330 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7980);
    EVENT = 8331
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7985);
    EVENT = 8331
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7990);
    EVENT = 8331
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7995);
    EVENT = 8331
   end
end

if EVENT == 8331 then
    SelectMsg(UID, 1, 803, 8035, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8332 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 803, 8037, NPC, 10, 8335, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 803, 8149, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8335 then
    SelectMsg(UID, 4, 803, 8038, NPC, 22, 8333, 23, 8334, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8333 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7981);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7986);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7991);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7996);
   end
end

if EVENT == 8334 then
   SaveEvent(UID, 7984); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 8340 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7983);
    EVENT = 8341
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7988);
    EVENT = 8341
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7993);
    EVENT = 8341
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7998);
    EVENT = 8341
   end
end

if EVENT == 8341 then
    SelectMsg(UID, 1, 803, 8036, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8336 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 30 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, 803, 8039, NPC, 10, 8337, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
       SelectMsg(UID, 4, 803, 8040, NPC, 10, 8338, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8337 then
   ShowMap(UID, 68);
end

local Check;

if EVENT == 8338 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 806)
        if  Check ==1 then        
        RunExchange(UID, 806);
        SaveEvent(UID, 7982);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 807)
        if  Check ==1 then        
        RunExchange(UID, 807);
        SaveEvent(UID, 7987);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 808)
        if  Check ==1 then        
        RunExchange(UID, 808);
        SaveEvent(UID, 7992);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 809)
        if  Check ==1 then        
        RunExchange(UID, 809);
        SaveEvent(UID, 7997);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
--------·ç°¡·ç »ç³É ³¡---------
-------------------------------

-------------------------------
-----´ÙÀÌ¾î ¿ïÇÁ »ç³É ½ÃÀÛ-----
-------------------------------

if EVENT == 8430 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8034);
    EVENT = 8431
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8039);
    EVENT = 8431
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8044);
    EVENT = 8431
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8049);
    EVENT = 8431
   end
end

if EVENT == 8431 then
    SelectMsg(UID, 1, 801, 8047, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8432 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 801, 8049, NPC, 10, 8435, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 801, 8149, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8435 then
    SelectMsg(UID, 4, 801, 8050, NPC, 22, 8433, 23, 8434, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8433 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8035);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8040);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8045);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8050);
   end
end

if EVENT == 8434 then
   SaveEvent(UID, 8038); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 8440 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8037);
    EVENT = 8441
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8042);
    EVENT = 8441
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8047);
    EVENT = 8441
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8052);
    EVENT = 8441
   end
end

if EVENT == 8441 then
    SelectMsg(UID, 1, 801, 8048, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8436 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 30 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, 801, 8051, NPC, 10, 8437, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
       SelectMsg(UID, 4, 801, 8052, NPC, 10, 8438, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8437 then
   ShowMap(UID, 523);
end

local Check;

if EVENT == 8438 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 810)
        if  Check ==1 then        
        RunExchange(UID, 810);
        SaveEvent(UID, 8036);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 811)
        if  Check ==1 then        
        RunExchange(UID, 811);
        SaveEvent(UID, 8041);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 812)
        if  Check ==1 then        
        RunExchange(UID, 812);
        SaveEvent(UID, 8046);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 813)
        if  Check ==1 then        
        RunExchange(UID, 813);
        SaveEvent(UID, 8051);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
------´ÙÀÌ¾î¿ïÇÁ »ç³É ³¡-------
-------------------------------

-------------------------------
-------½º¹Ì¸£µ· »ç³É ½ÃÀÛ--------
-------------------------------

if EVENT == 8530 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8076);
    EVENT = 8531
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8081);
    EVENT = 8531
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8086);
    EVENT = 8531
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8091);
    EVENT = 8531
   end
end

if EVENT == 8531 then
    SelectMsg(UID, 1, 816, 8061, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8532 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 816, 8062, NPC, 10, 8535, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 816, 8149, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8535 then
    SelectMsg(UID, 4, 816, 8063, NPC, 22, 8533, 23, 8534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8533 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8077);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8082);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8087);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8092);
   end
end

if EVENT == 8534 then
   SaveEvent(UID, 8080); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 8540 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8079);
    EVENT = 8541
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8084);
    EVENT = 8541
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8089);
    EVENT = 8541
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8094);
    EVENT = 8541
   end
end

if EVENT == 8541 then
    SelectMsg(UID, 1, 816, 8048, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8536 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, 816, 8064, NPC, 10, 8537, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
       SelectMsg(UID, 4, 816, 8065, NPC, 10, 8538, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8537 then
   ShowMap(UID, 525);
end

local Check;

if EVENT == 8538 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 836)
        if  Check ==1 then        
        RunExchange(UID, 836);
        SaveEvent(UID, 8078);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 837)
        if  Check ==1 then        
        RunExchange(UID, 837);
        SaveEvent(UID, 8083);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 838)
        if  Check ==1 then        
        RunExchange(UID, 838);
        SaveEvent(UID, 8088);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 839)
        if  Check ==1 then        
        RunExchange(UID, 839);
        SaveEvent(UID, 8093);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-------½º¹Ì¸£µ· »ç³É ³¡--------
-------------------------------

-------------------------------
--------ÄÉÀÏ¶õ »ç³É ½ÃÀÛ-------
-------------------------------

if EVENT == 8130 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8124);
    EVENT = 8131
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8129);
    EVENT = 8131
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8134);
    EVENT = 8131
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8139);
     EVENT = 8131
   end
end

if EVENT == 8131 then
    SelectMsg(UID, 1, 810, 8071, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8132 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 810, 8072, NPC, 10, 8135, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 810, 8149, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8135 then
    SelectMsg(UID, 4, 810, 8073, NPC, 22, 8133, 23, 8134, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8133 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8125);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8130);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8135);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8140);
   end
end

if EVENT == 8134 then
   SaveEvent(UID, 8128); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 8140 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8127);
    EVENT = 8141
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8132);
    EVENT = 8141
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8137);
    EVENT = 8141
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8142);
    EVENT = 8141
   end
end

if EVENT == 8141 then
    SelectMsg(UID, 1, 810, 8048, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8136 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, 810, 8074, NPC, 10, 8137, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
        SelectMsg(UID, 4, 810, 8075, NPC, 10, 8138, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8137 then
   ShowMap(UID, 527);
end

local Check;

if EVENT == 8138 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 896)
        if  Check ==1 then        
        RunExchange(UID, 896);
        SaveEvent(UID, 8126);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 897)
        if  Check ==1 then        
        RunExchange(UID, 897);
        SaveEvent(UID, 8131);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 898)
        if  Check ==1 then        
        RunExchange(UID, 898);
        SaveEvent(UID, 8136);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 899)
        if  Check ==1 then        
        RunExchange(UID, 899);
        SaveEvent(UID, 8141);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
---------ÄÉÀÏ¶õ »ç³É ³¡--------
-------------------------------



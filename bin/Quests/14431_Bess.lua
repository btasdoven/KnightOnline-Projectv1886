-- [°æºñº´]º£½º

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 14431;


if EVENT == 155 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 8256, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- ¹» ÇÏ´Â °É±î?
			 Ret = 1; -- ÀÌ°Ç ¿Ö ÀúÀå ½ÃÄÑ¿ä? ±×³É RETURNÀº ¾ÈµÇ³ª¿ä?
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          NpcMsg(UID, 8258, NPC)
      else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          EVENT = QuestNum
		end
end

if EVENT == 158 then
    Ret = 1;
end



-- [°æºñº´]º£½º Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

-------------------------------
---------¶ó¹Ì¾Æ »ç³É-----------
-------------------------------

if EVENT == 8250 then
   SelectMsg(UID, 1, 843, 8242, NPC, 28, 8251, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8251 then
   ShowMap(UID, 563);
   SaveEvent(UID, 9015);
end

local MonsterSub = 0;

if EVENT == 8252 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
	SelectMsg(UID, 2, 843, 8243, NPC, 10, 8260, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 2, 843, 8265, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8260 then
   SelectMsg(UID, 4, 843, 8244, NPC, 22, 8253, 23, 8254, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8253 then
   SaveEvent(UID, 9016);
end

if EVENT == 8254 then
   SaveEvent(UID, 9019);
end

-- »ç³É ¿Ï·á½Ã ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå
if EVENT == 8255 then
   SelectMsg(UID, 1, 843, 8266, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9018);
end

local MonsterCount = 0;

if EVENT == 8257 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 843, 8267, NPC, 10, 8258, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 843, 8268, NPC, 10, 8259, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8258 then
   ShowMap(UID, 513);
end

if EVENT == 8259 then
   Check = CheckExchange(UID, 1004)
   if  Check ==1 then
   RunExchange(UID, 1004);
   SaveEvent(UID, 9017);
   SaveEvent(UID, 9011);
   else
  Ret = 1;	
  end	 
end

-------------------------------
--------¶ó¹Ì¾Æ »ç³É ³¡---------
-------------------------------

-------------------------------
-------¿ì¸£Å© ÇÏÀÌ »ç³É--------
-------------------------------

if EVENT == 8350 then
   SelectMsg(UID, 1, 845, 8274, NPC, 14, 8351, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8351 then
    SaveEvent(UID, 9027);
end

local MonsterSub = 0;

if EVENT == 8352 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
	SelectMsg(UID, 2, 845, 8275, NPC, 10, 8360, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 2, 845, 8265, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8360 then
   SelectMsg(UID, 4, 845, 8276, NPC, 22, 8353, 23, 8354, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8353 then
   SaveEvent(UID, 9028);
end

if EVENT == 8354 then
   SaveEvent(UID, 9031);
end

-- »ç³É ¿Ï·á½Ã ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå
if EVENT == 8355 then
   SelectMsg(UID, 1, 845, 8266, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9012);
end

local MonsterCount = 0;

if EVENT == 8357 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 845, 8267, NPC, 10, 8358, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 845, 8268, NPC, 10, 8359, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8358 then
   ShowMap(UID, 543);
end

if EVENT == 8359 then
   Check = CheckExchange(UID, 1006)
   if  Check ==1 then
   RunExchange(UID, 1006);
   SaveEvent(UID, 9029);
   SaveEvent(UID, 9023);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-----¿ì¸£Å© ÇÏÀÌ »ç³É ³¡-------
-------------------------------

-------------------------------
---------Æ®·»Æ® »ç³É-----------
-------------------------------

if EVENT == 8650 then
   SelectMsg(UID, 1, 850, 8291, NPC, 3008, 8651, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8651 then
   SelectMsg(UID, 1, 850, 8292, NPC, 4080, 8652, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9063);
end

local MonsterSub = 0;

if EVENT == 8652 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 1, 850, 8293, NPC, 10, 8653, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 1, 850, 8294, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8653 then
    SelectMsg(UID, 1, 850, 8295, NPC, 22, 8654, 23, 8655, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8654 then --¼ö¶ô½Ã
    ShowMap(UID, 505);
    SaveEvent(UID, 9064);
end

if EVENT == 8655 then --°ÅÀý½Ã
    SelectMsg(UID, 1, 850, 8298, NPC, 4255, 8655, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    SaveEvent(UID, 9067);
end

-- 836¹ø ¼Ó¼º 0, 4¹øÀÏ °æ¿ì

if EVENT == 8660 then
   SelectMsg(UID, 2, 850, 8296, NPC, 3002, 8661, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8661 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 4, 850, 8297, NPC, 3018, 8662, 3019, 8668, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 850, 8299, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8662 then --¼ö¶ô½Ã
    SaveEvent(UID, 9064);
end

if EVENT == 8668 then --°ÅÀý½Ã
    SaveEvent(UID, 9067);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå 

if EVENT == 8663 then
    SelectMsg(UID, 1, 850, 8300, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    SaveEvent(UID, 9066);
end

-- 836ÀÌ 1¹ø 3¹øÀÎ °æ¿ì 

local MonsterCount = 0;

if EVENT == 8665 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 30 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
    SelectMsg(UID, 2, 850, 8301, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
    SelectMsg(UID, 4, 850, 8302, NPC, 10, 8667, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local Check;

if EVENT == 8667 then
  Slot = CheckGiveSlot(UID) 
  if Slot > 1 then
   RunExchange(UID, 945);
   SaveEvent(UID, 9059);
   SaveEvent(UID, 9065);
  else
   SelectMsg(UID, 2, 850, 8499, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  end	 	 
end

-------------------------------
--------Æ®·»Æ® »ç³É ³¡---------
-------------------------------

-------------------------------
--------¿¡ÀÌ¼ÇÆ® »ç³É----------
-------------------------------

if EVENT == 9180 then
   SelectMsg(UID, 1, 829, 8274, NPC, 14, 9181, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9181 then
   SaveEvent(UID, 9075);
end

local MonsterSub = 0;

if EVENT == 9182 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
	SelectMsg(UID, 2, 829, 8305, NPC, 10, 9190, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 2, 829, 8265, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9190 then
   SelectMsg(UID, 4, 829, 8306, NPC, 22, 9183, 23, 9184, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9183 then
   SaveEvent(UID, 9076);
end

if EVENT == 9184 then
   SaveEvent(UID, 9079);
end

-- »ç³É ¿Ï·á½Ã ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå
if EVENT == 9185 then
   SelectMsg(UID, 1, 829, 8266, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9078);
end

local MonsterCount = 0;

if EVENT == 9187 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 829, 8267, NPC, 10, 9188, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 829, 8268, NPC, 10, 9189, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9188 then
   ShowMap(UID, 546);
end

if EVENT == 9189 then
   Check = CheckExchange(UID, 947)
   if  Check ==1 then
   RunExchange(UID, 947);
   SaveEvent(UID, 9077);
   SaveEvent(UID, 9071);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-------¿¡ÀÌ¼ÇÆ® »ç³É ³¡--------
-------------------------------

-------------------------------
------¿ë¾Æ ±â»ç ´ÜÀå »ç³É------
-------------------------------

if EVENT == 9020 then
   SelectMsg(UID, 1, 871, 8274, NPC, 14, 9021, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9021 then
   SaveEvent(UID, 9099);
end

local MonsterSub = 0;

if EVENT == 9022 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
	SelectMsg(UID, 2, 871, 8446, NPC, 10, 9030, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 2, 871, 8265, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9030 then
   SelectMsg(UID, 4, 871, 8447, NPC, 22, 9023, 23, 9024, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9023 then
   SaveEvent(UID, 9100);
end

if EVENT == 9024 then
   SaveEvent(UID, 9103);
end

-- »ç³É ¿Ï·á½Ã ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå
if EVENT == 9025 then
   SelectMsg(UID, 1, 871, 8266, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9102);
end

local MonsterCount = 0;

if EVENT == 9027 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 30 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 871, 8267, NPC, 10, 9028, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 871, 8451, NPC, 10, 9029, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9028 then
   ShowMap(UID, 586);
end

if EVENT == 9029 then
  Slot = CheckGiveSlot(UID) 
  if Slot > 1 then
   RunExchange(UID, 1008);
   SaveEvent(UID, 9101);
   SaveEvent(UID, 9095);
  else
   SelectMsg(UID, 2, 871, 8499, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  end	 
end

-------------------------------
----¿ë¾Æ ±â»ç ´ÜÀå »ç³É ³¡-----
-------------------------------

------------------------------
------¿ì¸£Å© ºí·¹ÀÌµå »ç³É-----
-------------------------------

if EVENT == 9040 then
   SelectMsg(UID, 1, 873, 8274, NPC, 14, 9041, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9041 then
   SaveEvent(UID, 9111);
end

local MonsterSub = 0;

if EVENT == 9042 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
	SelectMsg(UID, 2, 873, 8456, NPC, 10, 9050, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 2, 873, 8265, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9050 then
   SelectMsg(UID, 4, 873, 8457, NPC, 22, 9043, 23, 9044, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9043 then
   SaveEvent(UID, 9112);
end

if EVENT == 9044 then
   SaveEvent(UID, 9115);
end

-- »ç³É ¿Ï·á½Ã ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå
if EVENT == 9045 then
   SelectMsg(UID, 1, 873, 8266, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9114);
end

local MonsterCount = 0;

if EVENT == 9047 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 873, 8267, NPC, 10, 9048, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 873, 8268, NPC, 10, 9049, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9048 then
   ShowMap(UID, 550);
end

if EVENT == 9049 then
   Check = CheckExchange(UID, 1041)
   if  Check ==1 then
   RunExchange(UID, 1041);
   SaveEvent(UID, 9113);
   SaveEvent(UID, 9107);
   else
  Ret = 1;	
  end	 
end

-------------------------------
----¿ì¸£Å© ºí·¹ÀÌµå »ç³É ³¡----
-------------------------------

-------------------------------
------µ¥·çºñ½Ã »ç³É ½ÃÀÛ-------
-------------------------------

if EVENT == 9080 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9150);
    EVENT = 9081
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9155);
    EVENT = 9081
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9160);
    EVENT = 9081
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9144);
     EVENT = 9081
   end
end

if EVENT == 9081 then
    SelectMsg(UID, 1, 877, 8464, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 9082 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 877, 8465, NPC, 10, 9085, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 877, 8265, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9085 then
    SelectMsg(UID, 4, 877, 8466, NPC, 22, 9083, 23, 9084, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9083 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9151);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9156);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9161);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9166);
   end
end

if EVENT == 9084 then
   SaveEvent(UID, 9154); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 9090 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9153);
    EVENT = 9091
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9158);
    EVENT = 9091
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9163);
    EVENT = 9091
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9168);
    EVENT = 9091
   end
end

if EVENT == 9091 then
    SelectMsg(UID, 1, 877, 8467, NPC, 3002, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9086 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 40 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
     SelectMsg(UID, 2, 877, 8468, NPC, 10, 9087, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
     SelectMsg(UID, 4, 877, 8469, NPC, 10, 9088, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 9087 then
   ShowMap(UID, 517);
end

local Check;

if EVENT == 9088 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 936)
        if  Check ==1 then        
        RunExchange(UID, 936);
        SaveEvent(UID, 9152);
        SaveEvent(UID, 9131);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 937)
        if  Check ==1 then        
        RunExchange(UID, 937);
        SaveEvent(UID, 9157);
        SaveEvent(UID, 9131);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 938)
        if  Check ==1 then        
        RunExchange(UID, 938);
        SaveEvent(UID, 9162);
        SaveEvent(UID, 9131);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 939)
        if  Check ==1 then        
        RunExchange(UID, 939);
        SaveEvent(UID, 9167);
        SaveEvent(UID, 9131);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
-------µ¥·çºñ½Ã »ç³É ³¡--------
-------------------------------

-------------------------------
--------»çµµ »ç³É ½ÃÀÛ---------
-------------------------------

if EVENT == 9100 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9192);
    EVENT = 9101
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9197);
    EVENT = 9101
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9202);
    EVENT = 9101
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9207);
     EVENT = 9101
   end
end

if EVENT == 9101 then
    SelectMsg(UID, 1, 879, 8476, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 9102 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 879, 8477, NPC, 10, 9105, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 879, 8265, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9105 then
    SelectMsg(UID, 4, 879, 8478, NPC, 22, 9103, 23, 9104, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9103 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9193);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9198);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9203);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9208);
   end
end

if EVENT == 9104 then
   SaveEvent(UID, 9196); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 9110 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9195);
    EVENT = 9111
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9200);
    EVENT = 9111
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9205);
    EVENT = 9111
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9210);
    EVENT = 9111
   end
end

if EVENT == 9111 then
    SelectMsg(UID, 1, 879, 8467, NPC, 3002, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9106 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 40 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
     SelectMsg(UID, 2, 879, 8468, NPC, 10, 9107, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
     SelectMsg(UID, 4, 879, 8479, NPC, 10, 9108, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 9107 then
   ShowMap(UID, 552);
end

local Check;

if EVENT == 9108 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 916)
        if  Check ==1 then        
        RunExchange(UID, 916);
        SaveEvent(UID, 9194);
        SaveEvent(UID, 9173);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 917)
        if  Check ==1 then        
        RunExchange(UID, 917);
        SaveEvent(UID, 9199);
        SaveEvent(UID, 9173);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 918)
        if  Check ==1 then        
        RunExchange(UID, 918);
        SaveEvent(UID, 9204);
        SaveEvent(UID, 9173);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 919)
        if  Check ==1 then        
        RunExchange(UID, 919);
        SaveEvent(UID, 9209);
        SaveEvent(UID, 9173);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
---------»çµµ »ç³É ³¡----------
-------------------------------

-------------------------------
--------Æ®·Ñ »ç³É ½ÃÀÛ---------
-------------------------------

if EVENT == 9120 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9234);
    EVENT = 9121
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9239);
    EVENT = 9121
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9244);
    EVENT = 9121
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9249);
     EVENT = 9121
   end
end

if EVENT == 9121 then
    SelectMsg(UID, 1, 881, 8476, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 9122 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 881, 8483, NPC, 10, 9125, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 881, 8265, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9125 then
    SelectMsg(UID, 4, 881, 8484, NPC, 22, 9123, 23, 9124, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9123 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9235);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9240);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9245);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9250);
   end
end

if EVENT == 9124 then
   SaveEvent(UID, 9238); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 9130 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9237);
    EVENT = 9131
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9242);
    EVENT = 9131
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9247);
    EVENT = 9131
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9252);
    EVENT = 9131
   end
end

if EVENT == 9131 then
    SelectMsg(UID, 1, 881, 8467, NPC, 29, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9126 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
     SelectMsg(UID, 2, 881, 8468, NPC, 10, 9127, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
     SelectMsg(UID, 4, 881, 8485, NPC, 10, 9128, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 9127 then
   ShowMap(UID, 554);
end

local Check;

if EVENT == 9128 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1048)
        if  Check ==1 then        
        RunExchange(UID, 1048);
        SaveEvent(UID, 9236);
        SaveEvent(UID, 9215);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1049)
        if  Check ==1 then        
        RunExchange(UID, 1049);
        SaveEvent(UID, 9241);
        SaveEvent(UID, 9215);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1050)
        if  Check ==1 then        
        RunExchange(UID, 1050);
        SaveEvent(UID, 9246);
        SaveEvent(UID, 9215);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1051)
        if  Check ==1 then        
        RunExchange(UID, 1051);
        SaveEvent(UID, 9251);
        SaveEvent(UID, 9215);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
---------Æ®·Ñ »ç³É ³¡----------
-------------------------------

-------------------------------
------½ºÅæ°ñ·½ »ç³É ½ÃÀÛ-------
-------------------------------

if EVENT == 9160 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9318);
    EVENT = 9161
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9323);
    EVENT = 9161
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9328);
    EVENT = 9161
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9333);
     EVENT = 9161
   end
end

if EVENT == 9161 then
    SelectMsg(UID, 1, 885, 8476, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 9162 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 885, 8489, NPC, 10, 9165, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 885, 8265, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9165 then
    SelectMsg(UID, 4, 885, 8490, NPC, 22, 9163, 23, 9164, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9163 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9319);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9324);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9329);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9334);
   end
end

if EVENT == 9164 then
   SaveEvent(UID, 9322); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 9170 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9321);
    EVENT = 9171
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9326);
    EVENT = 9171
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9331);
    EVENT = 9171
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9336);
    EVENT = 9171
   end
end

if EVENT == 9171 then
    SelectMsg(UID, 1, 885, 8467, NPC, 29, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9166 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
     SelectMsg(UID, 2, 885, 8468, NPC, 10, 9167, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
     SelectMsg(UID, 4, 885, 8491, NPC, 10, 9168, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 9167 then
   ShowMap(UID, 556);
end

local Check;

if EVENT == 9168 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 997)
        if  Check ==1 then        
        RunExchange(UID, 997);
        SaveEvent(UID, 9320);
        SaveEvent(UID, 9299);        
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 998)
        if  Check ==1 then        
        RunExchange(UID, 998);
        SaveEvent(UID, 9325);
        SaveEvent(UID, 9299);        
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 999)
        if  Check ==1 then        
        RunExchange(UID, 999);
        SaveEvent(UID, 9330);
        SaveEvent(UID, 9299);        
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1000)
        if  Check ==1 then        
        RunExchange(UID, 1000);
        SaveEvent(UID, 9335);
        SaveEvent(UID, 9299);        
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
--------½ºÅæ°ñ·½ »ç³É ³¡-------
-------------------------------

return Ret;

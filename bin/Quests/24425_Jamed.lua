-- [¼ö»ö´ëÀå]ÀÚ¸Þµå

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 24425;

-- [¼ö»ö´ëÀå]ÀÚ¸Þµå Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
			 SelectMsg(UID, 2, -1, 4578, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1; 
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          NpcMsg(UID, 4579, NPC)
      else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--******************************************************--
-- ¾Æ¸£µå¸²ÀÇ ÆòÈ­ ½ÃÀÛ 
--******************************************************--

local savenum = 438;

-- ½Ãµå¹Ì¼¿ µîÀå

if EVENT == 530 then
    SaveEvent(UID, 4306);
    SelectMsg(UID, 1, savenum, 4580, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 438 ¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

local MonsterSub = 0;

if EVENT == 532 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 3, savenum, 4582, NPC, 4228, 535, 4157, 520, 4063, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, savenum, 4583, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 535 then
    SelectMsg(UID, 4, savenum, 4646, NPC, 22, 533, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 520 then
    Status = CheckEventStatus(UID, 445)
       if Status == 2 then
       SelectMsg(UID, 2, savenum, 4643, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else
       SelectMsg(UID, 2, savenum, 4643, NPC, 10, 521, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end

end


if EVENT == 521 then
    RunExchange(UID, 505);
    SaveEvent(UID, 4398); --200 È¹µæ 
end


if EVENT == 533 then
   SaveEvent(UID, 4307); --¼ö¶ô½Ã
end


if EVENT == 534 then
   SaveEvent(UID, 4310); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 180 then
    SaveEvent(UID, 4309);
    SelectMsg(UID, 1, savenum, 4585, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 438ÀÇ 1¹ø 3¹øÀÎ °æ¿ì 

local MonsterCount = 0;

if EVENT == 536 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 30 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, savenum, 4587, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 2, savenum, 4588, NPC, 4172, 537, 4173, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local Check;

if EVENT == 537 then
  Check = CheckExchange(UID, 489)
   if  Check ==1 then
   RunExchange(UID, 489);
   SaveEvent(UID, 4308);
   SaveEvent(UID, 4315);
   else
  Ret = 1;	
  end	 
end


--******************************************************--
-- ¾Æ¸£µå¸²ÀÇ ÆòÈ­ ³¡ 
--******************************************************--

return Ret;

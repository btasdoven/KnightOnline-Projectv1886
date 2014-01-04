-- [°íÇàÀÚ]º£´Ù

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 24424;

-- [°íÇàÀÚ]º£´Ù Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

if EVENT == 190 then
	QuestNum = 2; --SearchQuest(UID, NPC);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
			 SelectMsg(UID, 2, -1, 4513, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1; 
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          NpcMsg(UID, 4514, NPC)
      else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--******************************************************--
-- ÀÏ°ö ÁõÇ¥ÀÇ ¼öÈ£ÀÚ ½ÃÀÛ 
--******************************************************--

local savenum = 430;

-- ½Ãµå¹Ì¼¿ µîÀå

if EVENT == 530 then
   NATION = CheckNation(UID);
      if NATION == 1 then --Ä«·ç½º ÀÏ¶§ 
      SaveEvent(UID, 4266);
      SelectMsg(UID, 1, savenum, 4503, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- ¿¤¸ðÀÏ¶§
      SaveEvent(UID, 4271);
      SelectMsg(UID, 1, savenum, 4504, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

-- 430 ¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 532 then   
    SelectMsg(UID, 4, savenum, 4505, NPC, 22, 533, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 533 then
   SaveEvent(UID, 4267); --¼ö¶ô½Ã
   GiveItem(UID, 910127000, 1);
end

if EVENT == 534 then
   SaveEvent(UID, 4270); -- °ÅÀý½Ã 
end

-- 430 ¹øÀÇ ¼Ó¼º 1¹ø 3¹øÀÏ °æ¿ì

local ItemA
local ItemB

if EVENT == 536 then
ItemA = HowmuchItem(UID, 910134000); --7¹øÂ° ÁõÇ¥
ItemB = HowmuchItem(UID, 910127000); -- ¸í·É¼­
    if  ItemA == 0 then -- Àç·á°¡ ¾øÀ»¶§
       if ItemB == 0 then -- ¸í·É¼­µµ  ¾øÀ»¶§
       GiveItem(UID, 910127000, 1);
       SelectMsg(UID, 2, savenum, 4507, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- B Àç·á ÀÖÀ»¶§ 
       SelectMsg(UID, 2, savenum, 4508, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
    else --7¹øÂ° ¿­¼è ÀÖÀ»¶§ 
    SelectMsg(UID, 2, savenum, 4506, NPC, 4172, 537, 4173, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 537 then
    Check = CheckExchange(UID, 481)
        if  Check ==1 then
        SaveEvent(UID, 4268);
        RunExchange(UID, 481);
        else
        Ret = 1; 
        end  
end


--******************************************************--
-- ÀÏ°ö ÁõÇ¥ÀÇ ¼öÈ£ÀÚ ³¡ 
--******************************************************--

--******************************************************--
-- ¸ó½ºÅÍ·Î ºÎÅÍÀÇ À§Çè ½ÃÀÛ 
--******************************************************--

local savenum = 440;

-- ½Ãµå¹Ì¼¿ µîÀå

if EVENT == 630 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4333);
    EVENT = 631
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4338);
    EVENT = 631
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4343);
    EVENT = 631
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4348);
     EVENT = 631
   end
end

if EVENT == 631 then
    SelectMsg(UID, 1, savenum, 4613, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


-- 440 ¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

local MonsterSub = 0;

if EVENT == 632 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 4, savenum, 4614, NPC, 22, 633, 23, 634, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, savenum, 4615, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end



if EVENT == 633 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4334);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4339);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4344);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4349);
   end
end


if EVENT == 634 then
   SaveEvent(UID, 4337); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 280 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4336);
    EVENT = 281
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4341);
    EVENT = 281
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4346);
    EVENT = 281
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4351);
     EVENT = 281
   end
end

if EVENT == 281 then
    SelectMsg(UID, 1, savenum, 4616, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


-- 440ÀÇ 1¹ø 3¹øÀÎ °æ¿ì 

local MonsterCount01
local MonsterCount02
local MonsterCount03
local MonsterCount04


if EVENT == 636 then
   MonsterCount01  = CountMonsterQuestSub(UID, 1);
   MonsterCount02  = CountMonsterQuestSub(UID, 2);
   MonsterCount03  = CountMonsterQuestSub(UID, 3);
   MonsterCount04  = CountMonsterQuestSub(UID, 4);  
    if  MonsterCount01  > 0 and  MonsterCount02  > 0 and  MonsterCount03  > 0 and  MonsterCount04  > 0 then -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 5, savenum, 4621, NPC, 4161, 637, 4162, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
       if MonsterCount01 <= 0 then -- A »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, savenum, 4617, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  MonsterCount02 <= 0 then -- B »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, savenum, 4618, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  MonsterCount03 <= 0 then -- C »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, savenum, 4619, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- D »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, savenum, 4620, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
   end
end

local Check;

if EVENT == 637 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 493)
        if  Check ==1 then        
        RunSelectExchange(UID, 493);
        SaveEvent(UID, 4335);
        SaveEvent(UID, 4356);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 494)
        if  Check ==1 then        
        RunSelectExchange(UID, 494);
        SaveEvent(UID, 4340);
        SaveEvent(UID, 4356);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 495)
        if  Check ==1 then        
        RunSelectExchange(UID, 495);
        SaveEvent(UID, 4345);
        SaveEvent(UID, 4356);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 496)
        if  Check ==1 then        
        RunSelectExchange(UID, 496);
        SaveEvent(UID, 4350);
        SaveEvent(UID, 4356);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end



--******************************************************--
-- ¸ó½ºÅÍ·Î ºÎÅÍÀÇ À§Çè ³¡ 
--******************************************************--

return Ret;

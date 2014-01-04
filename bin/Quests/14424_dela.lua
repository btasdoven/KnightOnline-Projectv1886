-- [°íÇàÀÚ]Å¸º£µå

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 14424;

-- [°íÇàÀÚ]Å¸º£µå Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
			 SelectMsg(UID, 2, -1, 4515, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1; 
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          NpcMsg(UID, 4516, NPC)
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

-- 430¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 532 then   
    SelectMsg(UID, 4, savenum, 4509, NPC, 22, 533, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 533 then
   SaveEvent(UID, 4272); --¼ö¶ô½Ã
   GiveItem(UID, 910127000, 1);
end

if EVENT == 534 then
   SaveEvent(UID, 4275); -- °ÅÀý½Ã 
end

-- 9¹øÀÇ ¼Ó¼º 1¹ø 3¹øÀÏ °æ¿ì

local ItemA
local ItemB

if EVENT == 536 then
ItemA = HowmuchItem(UID, 910134000); --7¹øÂ° ÁõÇ¥ 
ItemB = HowmuchItem(UID, 910127000); -- ¸í·É¼­
    if  ItemA == 0 then -- Àç·á°¡ ¾øÀ»¶§
       if ItemB == 0 then -- ¸í·É¼­µµ  ¾øÀ»¶§
       GiveItem(UID, 910127000, 1);
       SelectMsg(UID, 2, savenum, 4511, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- B Àç·á ¾øÀ»¶§ 
       SelectMsg(UID, 2, savenum, 4512, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
    else --7¹øÂ° ¿­¼è ÀÖÀ»¶§ 
    SelectMsg(UID, 2, savenum, 4510, NPC, 4172, 537, 4173, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 537 then
    Check = CheckExchange(UID, 481)
        if  Check ==1 then
        SaveEvent(UID, 4273);
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

local savenum = 441;

-- ½Ãµå¹Ì¼¿ µîÀå

if EVENT == 630 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4354);
    EVENT = 631
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4354);
    EVENT = 631
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4354);
    EVENT = 631
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4354);
     EVENT = 631
   end
end

if EVENT == 631 then
    SelectMsg(UID, 1, savenum, 4622, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


-- 440 ¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

local MonsterSub = 0;

if EVENT == 632 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 4, savenum, 4623, NPC, 22, 633, 23, 634, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, savenum, 4624, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 633 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4355);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4360);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4365);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4370);
   end
end


if EVENT == 634 then
   SaveEvent(UID, 4358); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 
    
if EVENT == 280 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4357);
    EVENT = 281
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4362);
    EVENT = 281
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4367);
    EVENT = 281
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4372);
     EVENT = 281
   end
end

if EVENT == 281 then
    SelectMsg(UID, 1, savenum, 4625, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 5, savenum, 4630, NPC, 4161, 637, 4162, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
       if MonsterCount01 <= 0 then -- A »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, savenum, 4626, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  MonsterCount02 <= 0 then -- B »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, savenum, 4627, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  MonsterCount03 <= 0 then -- C »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, savenum, 4628, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- D »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, savenum, 4629, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
   end
end

local Check;

if EVENT == 637 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then    
    Check = CheckExchange(UID, 497)
        if  Check ==1 then
        RunSelectExchange(UID, 497);
        SaveEvent(UID, 4356);
        SaveEvent(UID, 4335);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 498)
        if  Check ==1 then        
        RunSelectExchange(UID, 498);
        SaveEvent(UID, 4361);
        SaveEvent(UID, 4335);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 499)
        if  Check ==1 then        
        RunSelectExchange(UID, 499);
        SaveEvent(UID, 4366);
        SaveEvent(UID, 4335);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 500)
        if  Check ==1 then        
        RunSelectExchange(UID, 500);
        SaveEvent(UID, 4371);
        SaveEvent(UID, 4335);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    end
   else
end



--******************************************************--
-- ¸ó½ºÅÍ·Î ºÎÅÍÀÇ À§Çè ³¡ 
--******************************************************--

return Ret;

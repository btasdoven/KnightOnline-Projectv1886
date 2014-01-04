-- [¿ëº´]Å×ÀÏ½º

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 14430;


if EVENT == 150 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 8200, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- ¹» ÇÏ´Â °É±î?
			 Ret = 1; -- ÀÌ°Ç ¿Ö ÀúÀå ½ÃÄÑ¿ä? ±×³É RETURNÀº ¾ÈµÇ³ª¿ä?
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          NpcMsg(UID, 8202, NPC)
      else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          EVENT = QuestNum
		end
end

if EVENT == 153 then
    Ret = 1;
end



-- [¿ëº´]Å×ÀÏ½º Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

-------------------------------
-----------Äá°¡ »ç³É-----------
-------------------------------

if EVENT == 8270 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8868);
    EVENT = 8271
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8873);
    EVENT = 8271
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8878);
    EVENT = 8271
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8883);
     EVENT = 8271
   end
end

if EVENT == 8271 then
    SelectMsg(UID, 1, 860, 8404, NPC, 3013, 8279, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8279 then
    ShowMap(UID, 561);
end

local MonsterSub = 0;

if EVENT == 8272 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 860, 8405, NPC, 10, 8275, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 860, 8406, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8275 then
    SelectMsg(UID, 4, 860, 8407, NPC, 22, 8273, 23, 8274, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8273 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8869);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8874);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8879);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8884);
   end
end

if EVENT == 8274 then
   SaveEvent(UID, 8872); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 8280 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8871);
    EVENT = 8281
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8876);
    EVENT = 8281
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8881);
    EVENT = 8281
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8886);
    EVENT = 8281
   end
end

if EVENT == 8281 then
    SelectMsg(UID, 1, 860, 8408, NPC, 3002, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8276 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
     SelectMsg(UID, 2, 860, 8409, NPC, 10, 8277, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
     SelectMsg(UID, 4, 860, 8410, NPC, 10, 8278, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8277 then
   ShowMap(UID, 511);
end

local Check;

if EVENT == 8278 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 985)
        if  Check ==1 then        
        RunExchange(UID, 985);
        SaveEvent(UID, 8870);
        SaveEvent(UID, 8849);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 986)
        if  Check ==1 then        
        RunExchange(UID, 986);
        SaveEvent(UID, 8875);
        SaveEvent(UID, 8849);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 987)
        if  Check ==1 then        
        RunExchange(UID, 987);
        SaveEvent(UID, 8880);
        SaveEvent(UID, 8849);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 988)
        if  Check ==1 then        
        RunExchange(UID, 988);
        SaveEvent(UID, 8885);
        SaveEvent(UID, 8849);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
----------Äá°¡ »ç³É ³¡---------
-------------------------------

-------------------------------
---------¿¡ÀÌÇÁ »ç³É-----------
-------------------------------

if EVENT == 8600 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8910);
    EVENT = 8601
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8915);
    EVENT = 8601
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8920);
    EVENT = 8601
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8925);
     EVENT = 8601
   end
end

if EVENT == 8601 then
   SelectMsg(UID, 1, 863, 8183, NPC, 3002, 8602, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8602 then
   SelectMsg(UID, 1, 863, 8184, NPC, 4241, 8603, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8603 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 1, 863, 8185, NPC, 10, 8604, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 1, 863, 8186, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8604 then
    SelectMsg(UID, 1, 863, 8187, NPC, 22, 8605, 23, 8606, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8605 then --¼ö¶ô½
   ShowMap(UID, 541);
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8911);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8916);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8921);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8926);
   end
end

if EVENT == 8606 then
   SelectMsg(UID, 1, 863, 8493, NPC, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 8914); -- °ÅÀý½Ã 
end

-- 836¹ø ¼Ó¼º 0, 4¹øÀÏ °æ¿ì

if EVENT == 8610 then
   SelectMsg(UID, 2, 863, 8202, NPC, 3002, 8611, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8611 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 4, 863, 8189, NPC, 3018, 8612, 3019, 8619, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 863, 8190, NPC, 4242, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8612 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8911);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8916);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8921);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8926);
   end
end

if EVENT == 8619 then
    SaveEvent(UID, 8914); -- °ÅÀý½Ã 
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå 

if EVENT == 8613 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8913);
    EVENT = 8614
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8918);
    EVENT = 8614
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8923);
    EVENT = 8614
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8928);
    EVENT = 8614
   end
end

if EVENT == 8614 then
    SelectMsg(UID, 1, 863, 8415, NPC, 4080, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 836ÀÌ 1¹ø 3¹øÀÎ °æ¿ì 

local MonsterCount = 0;

if EVENT == 8615 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 30 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
    SelectMsg(UID, 2, 863, 8190, NPC, 10, 8617, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
    SelectMsg(UID, 4, 863, 8413, NPC, 10, 8618, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8617 then
   ShowMap(UID, 541);
end

local Check;

if EVENT == 8618 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 924)
        if  Check ==1 then        
        RunExchange(UID, 924);
        SaveEvent(UID, 8912);
        SaveEvent(UID, 8891);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 925)
        if  Check ==1 then        
        RunExchange(UID, 925);
        SaveEvent(UID, 8917);
        SaveEvent(UID, 8891);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 926)
        if  Check ==1 then        
        RunExchange(UID, 926);
        SaveEvent(UID, 8922);
        SaveEvent(UID, 8891);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 927)
        if  Check ==1 then        
        RunExchange(UID, 927);
        SaveEvent(UID, 8927);
        SaveEvent(UID, 8891);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
--------¿¡ÀÌÇÁ »ç³É ³¡---------
-------------------------------

-------------------------------
------¹ö´× ½ºÄÌ·¹Åæ »ç³É-------
-------------------------------

if EVENT == 8500 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8952);
    EVENT = 8501
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8957);
    EVENT = 8501
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8962);
    EVENT = 8501
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8967);
    EVENT = 8501
   end
end

if EVENT == 8501 then
    SelectMsg(UID, 1, 817, 8195, NPC, 56, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8502 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 817, 8196, NPC, 10, 8505, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 817, 8406, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8505 then
    SelectMsg(UID, 4, 817, 8197, NPC, 22, 8503, 23, 8504, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8503 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8953);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8958);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8963);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8968);
   end
end

if EVENT == 8504 then
   SaveEvent(UID, 8956); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 8510 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8955);
    EVENT = 8511
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8960);
    EVENT = 8511
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8965);
    EVENT = 8511
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8970);
    EVENT = 8511
   end
end

if EVENT == 8511 then
    SelectMsg(UID, 1, 817, 8188, NPC, 3007, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8506 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 30 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
       SelectMsg(UID, 2, 817, 8409, NPC, 10, 8507, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
       Class = CheckClass(UID);
        if Class == 1 or Class == 5 or Class == 6 or Class == 3 or Class == 9 or Class == 10 or Class == 4 or Class == 11 or Class == 12 then
        SelectMsg(UID, 4, 817, 8198, NPC, 10, 8508, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        elseif Class == 2 or Class == 7 or Class == 8 then
        SelectMsg(UID, 5, 817, 8172, NPC, 10, 8508, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    end
end

if EVENT == 8507 then
   ShowMap(UID, 509);
end

local Check;

if EVENT == 8508 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 900)
        if  Check ==1 then        
        RunExchange(UID, 900);
        SaveEvent(UID, 8954);
        SaveEvent(UID, 8933);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 901)
        if  Check ==1 then        
        RunSelectExchange(UID, 901);
        SaveEvent(UID, 8959);
        SaveEvent(UID, 8933);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 902)
        if  Check ==1 then        
        RunExchange(UID, 902);
        SaveEvent(UID, 8964);
        SaveEvent(UID, 8933);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 903)
        if  Check ==1 then        
        RunExchange(UID, 903);
        SaveEvent(UID, 8969);
        SaveEvent(UID, 8933);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-----¹ö´× ½ºÄÌ·¹Åæ »ç³É ³¡-----
-------------------------------

-------------------------------
-------¾Ö½¬³ªÀÌÆ® »ç³É---------
-------------------------------

if EVENT == 8070 then
   SelectMsg(UID, 1, 800, 8148, NPC, 14, 8351, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8071 then
   SaveEvent(UID, 8991);
end

local MonsterSub = 0;

if EVENT == 8072 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
	SelectMsg(UID, 2, 800, 8156, NPC, 10, 8080, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 2, 800, 8406, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8080 then
   SelectMsg(UID, 4, 800, 8174, NPC, 22, 8073, 23, 8074, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8073 then
   SaveEvent(UID, 8992);
end

if EVENT == 8074 then
   SaveEvent(UID, 8995);
end

-- »ç³É ¿Ï·á½Ã ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå

if EVENT == 8075 then
   SelectMsg(UID, 1, 800, 8215, NPC, 3014, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 8994);
end

local MonsterCount = 0;

if EVENT == 8077 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 800, 8409, NPC, 10, 8078, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 800, 8216, NPC, 10, 8079, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8078 then
   ShowMap(UID, 503);
end

if EVENT == 8079 then
   Check = CheckExchange(UID, 800)
   if  Check ==1 then
   RunExchange(UID, 800);
   SaveEvent(UID, 8993);
   SaveEvent(UID, 8987);
   else
  Ret = 1;	
  end	 
end

-------------------------------
------¾Ö½¬³ªÀÌÆ® »ç³É ³¡-------
-------------------------------

-------------------------------
----------ÇÏ¿õ°¡ »ç³É----------
-------------------------------

if EVENT == 8150 then
   SelectMsg(UID, 1, 841, 8221, NPC, 3002, 8151, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8151 then
   SaveEvent(UID, 9003);
end

local MonsterSub = 0;

if EVENT == 8152 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
	SelectMsg(UID, 2, 841, 8222, NPC, 10, 8160, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 2, 841, 8406, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8160 then
   SelectMsg(UID, 4, 841, 8223, NPC, 22, 8153, 23, 8154, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8153 then
   SaveEvent(UID, 9004);
end

if EVENT == 8154 then
   SaveEvent(UID, 9007);
end

-- »ç³É ¿Ï·á½Ã ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå

if EVENT == 8155 then
   SelectMsg(UID, 1, 841, 8215, NPC, 3014, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9006);
end

local MonsterCount = 0;

if EVENT == 8157 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 210 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 841, 8409, NPC, 10, 8158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 841, 8224, NPC, 10, 8159, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8158 then
   ShowMap(UID, 515);
end

if EVENT == 8159 then
   Check = CheckExchange(UID, 949)
   if  Check ==1 then
   RunExchange(UID, 949);
   SaveEvent(UID, 9005);
   SaveEvent(UID, 8999);
   else
  Ret = 1;	
  end	 
end

-------------------------------
---------ÇÏ¿õ°¡ »ç³É ³¡--------
-------------------------------

-------------------------------
--------¿ë¾Æ º´»ç »ç³É---------
-------------------------------

if EVENT == 8550 then
   SelectMsg(UID, 1, 866, 8005, NPC, 14, 8551, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8551 then
   SaveEvent(UID, 9051);
end

local MonsterSub = 0;

if EVENT == 8552 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
	SelectMsg(UID, 2, 866, 8006, NPC, 10, 8560, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 2, 866, 8406, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8560 then
   SelectMsg(UID, 4, 866, 8007, NPC, 22, 8553, 23, 8554, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8553 then
   SaveEvent(UID, 9052);
end

if EVENT == 8554 then
   SaveEvent(UID, 9055);
end

-- »ç³É ¿Ï·á½Ã ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå

if EVENT == 8555 then
   SelectMsg(UID, 1, 866, 8008, NPC, 3014, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9054);
end

local MonsterCount = 0;

if EVENT == 8557 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 866, 8409, NPC, 10, 8558, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 866, 8012, NPC, 10, 8559, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8558 then
   ShowMap(UID, 584);
end

if EVENT == 8559 then
   Check = CheckExchange(UID, 1002)
   if  Check ==1 then
   RunExchange(UID, 1002);
   SaveEvent(UID, 9053);
   SaveEvent(UID, 9047);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-------¿ë¾Æ º´»ç »ç³É ³¡-------
-------------------------------

-------------------------------
--------¿ë¾Æ ±â»ç »ç³É---------
-------------------------------

if EVENT == 9000 then
   SelectMsg(UID, 1, 869, 8005, NPC, 14, 9001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9001 then
   SaveEvent(UID, 9087);
end

local MonsterSub = 0;

if EVENT == 9002 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
	SelectMsg(UID, 2, 869, 8015, NPC, 10, 9010, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 	SelectMsg(UID, 2, 869, 8406, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9010 then
   SelectMsg(UID, 4, 869, 8016, NPC, 22, 9003, 23, 9004, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9003 then
   SaveEvent(UID, 9088);
end

if EVENT == 9004 then
   SaveEvent(UID, 9091);
end

-- »ç³É ¿Ï·á½Ã ½Ãµå¿Í ¹Ì¼¿ÀÇ µîÀå

if EVENT == 9005 then
   SelectMsg(UID, 1, 869, 8008, NPC, 3014, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9090);
end

local MonsterCount = 0;

if EVENT == 9007 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 869, 8409, NPC, 10, 9008, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 869, 8224, NPC, 10, 9009, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9008 then
   ShowMap(UID, 29);
end

if EVENT == 9009 then
   Check = CheckExchange(UID, 943)
   if  Check ==1 then
   RunExchange(UID, 943);
   SaveEvent(UID, 9089);
   SaveEvent(UID, 9083);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-------¿ë¾Æ ±â»ç »ç³É ³¡-------
-------------------------------

return Ret;



local UserClass;
local QuestNum;
local Ret = 0;
local savenum = 100;
local NPC= 16079;

if EVENT == 190 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then
			 SelectMsg(UID, 2, -1, 191, NPC, 10, 193);
			 Ret = 1;
		elseif QuestNum > 1 and  QuestNum < 100 then
          NpcMsg(UID, 193,NPC)
      else
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

local NATION = 0;

if EVENT == 105 then
    SaveEvent(UID, 6);
   NATION = CheckNation(UID);
   if NATION == 1 then
   SelectMsg(UID, 1, savenum, 105, NPC, 28, 107);
   else
   SelectMsg(UID, 1, savenum, 111, NPC, 28, 107);
   end
end


if EVENT == 110 then
   SelectMsg(UID, 2, savenum, 150, NPC, 29, 111);
end


if EVENT == 111 then
   SelectMsg(UID, 4, savenum, 156, NPC, 22, 112, 23, 193);
end

if EVENT == 112 then
   SaveEvent(UID, 7);
end

local NATION = 0;

if EVENT == 120 then
    SaveEvent(UID, 9);
   NATION = CheckNation(UID);
   if NATION == 1 then
   SelectMsg(UID, 1, savenum, 131, NPC, 14, 193);
   else
   SelectMsg(UID, 1, savenum, 132, NPC, 14, 193);
   end
end


   local ItemA = 0;
   local RUN_EXCHANGE ;

if EVENT == 280 then 
    ItemA = HowmuchItem(UID, 379048000);  
   if  ItemA < 3  then 
		SelectMsg(UID, 2, savenum, 157, NPC, 10, 193);
   else
		SelectMsg(UID, 4, savenum, 158, NPC, 4006, 281, 27, 193);
    end
end

if EVENT == 281 then 
   RobItem(UID, 379048000, 3)
   ExpChange(UID, 100)
   GoldGain(UID, 500)
   SaveEvent(UID, 8)
end


if EVENT == 195 then
   SelectMsg(UID, 1, 102, 195, NPC, 28, 196);
end

if EVENT == 196 then
   ShowMap(UID, 5);
   SaveEvent(UID, 56);
end

if EVENT == 197 then
   SelectMsg(UID, 1, 102, 197, NPC, 29, 196);
end


if EVENT == 200 then
   SelectMsg(UID, 2, 102, 200, NPC, 29, 201);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 102, 201, NPC, 22, 202, 23, 193);
end

if EVENT == 202 then
   SaveEvent(UID, 57);
end

local NATION = 0;

if EVENT == 205 then
   SaveEvent(UID, 59);
   NATION = CheckNation(UID);
   if NATION == 1 then
      SelectMsg(UID, 1, 102, 206, NPC, 32, 189);
   else
      SelectMsg(UID, 1, 102, 207, NPC, 4080, 189);
   end
end

if EVENT == 189 then
   ShowMap(UID, 5);
end


local ITEM_COUNT=0;
local RUN_EXCHANGE ;

if EVENT == 210 then
   ITEM_COUNT = HowmuchItem(UID, 379078000);
   if  ITEM_COUNT < 2 then
      SelectMsg(UID, 2, 102, 211, NPC, 18, 213);
   else
      SelectMsg(UID, 2, 102, 212, NPC, 4006, 214, 27, 193);
   end
end

if EVENT == 213 then
   ShowMap(UID, 7);
end



local Check;

if EVENT == 214 then
   RobItem(UID, 379078000, 2)
   ExpChange(UID, 340)
   GoldGain(UID, 1500)
   SaveEvent(UID, 58)	 
end


if EVENT == 300 then
   SelectMsg(UID, 1, 105, 292, NPC, 28, 301);
end

if EVENT == 301 then
   ShowMap(UID, 5);
   SaveEvent(UID, 93);
end

if EVENT == 302 then
   SelectMsg(UID, 1, 105, 293, NPC, 29, 301);
end



if EVENT == 303 then
   SelectMsg(UID, 2, 105, 294, NPC, 29, 304);
end

if EVENT == 304 then
   SelectMsg(UID, 4, 105, 295, NPC, 22, 305, 23, 193);
end

if EVENT == 305 then
   SaveEvent(UID, 94);
end

local NATION = 0;

if EVENT == 306 then
   SaveEvent(UID, 96);
   NATION = CheckNation(UID);
   if NATION == 1 then
      SelectMsg(UID, 1, 105, 299, NPC, 32, 307);
   else
      SelectMsg(UID, 1, 105, 300, NPC, 4080, 307);
   end
end


if EVENT == 307 then
   ShowMap(UID, 5);
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;

if EVENT == 308 then
   ITEM_COUNT = HowmuchItem(UID, 379251000);
   if  ITEM_COUNT < 5 then
      SelectMsg(UID, 2, 105, 298, NPC, 18, 309);
   else
      SelectMsg(UID, 4, 105, 301, NPC, 4006, 310, 27, 193);
   end
end

if EVENT == 309 then
   ShowMap(UID, 11);
end



local Check;

if EVENT == 310 then
  if (bSelectedReward < 0 or bSelectedReward > 4) then
			-- TO-DO: Needs an error. Need to log USKO for this.
			-- It should probably even be handled inside CUser::RecvSelectMsg()
			return
		end
		
  if not isRoomForItem(UID, 389034000, 3) then
			-- TO-DO: Should probably throw an error in here.
			-- New exchange code is meant to provide errors...
			-- so will have to better look into that.
			return
		end
		
   if RobItem(UID, 379251000, 5) then
			local nRewards = 
			{
				330150005, -- Red Pearl Ring (+5 Strength)
				330150015, -- Red Pearl Ring (+5 Health)
				330150025, -- Red Pearl Ring (+5 Dexterity) 
				330150035, -- Red Pearl Ring (+5 Intelligence)
				330150075  -- Red Pearl Ring (+5 Magic Power) 
			}
			
			GiveItem(UID, nRewards[1+bSelectedReward])
			GiveItem(UID, 389034000, 3) -- 3 x Bezoar
			ExpChange(UID, 1400)
			GoldGain(UID, 3000)
			SaveEvent(UID, 95)
		end 
end



if EVENT == 311 then
   SelectMsg(UID, 1, 106, 302, NPC, 28, 312, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 312 then
   ShowMap(UID, 5);
   SaveEvent(UID, 100);
end

if EVENT == 313 then
   SelectMsg(UID, 1, 106, 303, NPC, 29, 312, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- ´ë»óÀÎÀÇ µþ 105¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 314 then
   SelectMsg(UID, 2, 106, 304, NPC, 29, 315, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 315 then
   SelectMsg(UID, 4, 106, 305, NPC, 22, 316, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 316 then
   SaveEvent(UID, 101);
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 317 then
   SaveEvent(UID, 103);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 106,311, NPC, 32, 318, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 106, 312, NPC, 4080, 318, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 318 then
   ShowMap(UID, 5);
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;
--1¹ø°ú 3¹øÀÇ Àç·á Ã¤Å©...
if EVENT == 319 then
   ITEM_COUNT = HowmuchItem(UID, 379010000);--ÀÌµ¿ ¼Óµµ °­È­ ¹°¾à ÁÖ¼¼¿ä.
   if  ITEM_COUNT <= 4 then -- Àç·á ¾øÀ»¶§
      SelectMsg(UID, 2, 106, 310, NPC, 18, 320, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 4 then-- Àç·á ÀÖÀ»¶§
       SelectMsg(UID, 2, 106, 314, NPC, 4006, 321, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        
 end
end

if EVENT == 320 then
   ShowMap(UID, 12);
end
--Äù½ºÆ®¸¦ ³¡³¾°æ¿ì..2¹ø...

local Check;

if EVENT == 321 then
  Check = CheckExchange(UID, 29)
   if  Check ==1 then
   RunExchange(UID, 29);  
   SaveEvent(UID, 102);
   else
  Ret = 1;	
  end	 
end
-------------------------------------------
--- °¡º¼Æ® ³¯°³ ¼öÁý ³¡--------------------
-------------------------------------------

-------------------------------------------
--- ¸¶¹ýÀÇ °¡¹æ Àç·á ¼öÁý------------------
-------------------------------------------


if EVENT == 322 then
   SelectMsg(UID, 1, 107, 316, NPC, 28, 323, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 323 then
   ShowMap(UID, 5);
   SaveEvent(UID, 107);
end

if EVENT == 324 then
   SelectMsg(UID, 1, 107, 317, NPC, 29, 323, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- ´ë»óÀÎÀÇ µþ 105¹øÀÇ ¼Ó¼º 0¹ø °æ¿ì

if EVENT == 325 then
   SelectMsg(UID, 2, 107, 318, NPC, 29, 326, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 326 then
   SelectMsg(UID, 4, 107, 319, NPC, 22, 327, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 327 then
   SaveEvent(UID, 108);
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 328 then
   SaveEvent(UID, 110);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 107, 320, NPC, 32, 329, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 107, 321, NPC, 4080, 329, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 329 then
   ShowMap(UID, 5);
end

-- ´ë»óÀÎÀÇ µþ 105¹øÀÇ ¼Ó¼º 1¹ø 3¹ø 4¹øÀÎ  °æ¿ì

local ITEM_COUNT;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 


if EVENT == 330 then
      SelectMsg(UID, 4, 107, 287, NPC, 4006, 331, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 331 then
ITEM_COUNT = GetMaxExchange(UID, 30); --exchange Å×ÀÌºí ÀÎµ¦½º°ª       
   if  ITEM_COUNT == 0 then -- Àç·á ¾øÀ»¶§
    SelectMsg(UID, 2, 107, 322, NPC, 18, 333, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else  -- Àç·á ÀÖÀ» ¶§
    Check = CheckExchange(UID, 30)
        if  Check ==1 then
        ITEM_COUNT = GetMaxExchange(UID, 30); --exchange Å×ÀÌºí ÀÎµ¦½º°ª    
        RunCountExchange(UID, 30, ITEM_COUNT);	   
        SaveEvent(UID, 111);
        else
        Ret = 1;	
        end
    end 
end


if EVENT == 333 then
   ShowMap(UID, 1);
end


local Check;

--Äù½ºÆ®¸¦ ³¡³¾°æ¿ì..2¹ø...
--¹Ýº¹ Äù½ºÆ®ÀÌ¹Ç·Î ÀúÀåÇÏÁö ¾ÊÀ½
-------------------------------------------
--- ¸¶¹ýÀÇ °¡¹æ Àç·á ¼öÁý ³¡---------------
-------------------------------------------


return Ret;

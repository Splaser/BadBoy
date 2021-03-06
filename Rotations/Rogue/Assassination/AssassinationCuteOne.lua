if select(2, UnitClass("player")) == "ROGUE" then
    local rotationName = "CuteOne"

---------------
--- Toggles ---
---------------
    local function createToggles()
    -- Rotation Button
        RotationModes = {
            [1] = { mode = "Auto", value = 1 , overlay = "Automatic Rotation", tip = "Swaps between Single and Multiple based on number of targets in range.", highlight = 1, icon = bb.player.spell.fanOfKnives },
            [2] = { mode = "Mult", value = 2 , overlay = "Multiple Target Rotation", tip = "Multiple target rotation used.", highlight = 0, icon = bb.player.spell.fanOfKnives },
            [3] = { mode = "Sing", value = 3 , overlay = "Single Target Rotation", tip = "Single target rotation used.", highlight = 0, icon = bb.player.spell.mutilate },
            [4] = { mode = "Off", value = 4 , overlay = "DPS Rotation Disabled", tip = "Disable DPS Rotation", highlight = 0, icon = bb.player.spell.recuperate}
        };
        CreateButton("Rotation",1,0)
    -- Cooldown Button
        CooldownModes = {
            [1] = { mode = "Auto", value = 1 , overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = bb.player.spell.vendetta },
            [2] = { mode = "On", value = 1 , overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 0, icon = bb.player.spell.vendetta },
            [3] = { mode = "Off", value = 3 , overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = bb.player.spell.vendetta }
        };
        CreateButton("Cooldown",2,0)
    -- Defensive Button
        DefensiveModes = {
            [1] = { mode = "On", value = 1 , overlay = "Defensive Enabled", tip = "Includes Defensive Cooldowns.", highlight = 1, icon = bb.player.spell.evasion },
            [2] = { mode = "Off", value = 2 , overlay = "Defensive Disabled", tip = "No Defensives will be used.", highlight = 0, icon = bb.player.spell.evasion }
        };
        CreateButton("Defensive",3,0)
    -- Interrupt Button
        InterruptModes = {
            [1] = { mode = "On", value = 1 , overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = bb.player.spell.kick },
            [2] = { mode = "Off", value = 2 , overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = bb.player.spell.kick }
        };
        CreateButton("Interrupt",4,0)
    -- Cleave Button
        CleaveModes = {
            [1] = { mode = "On", value = 1 , overlay = "Cleaving Enabled", tip = "Rotation will cleave targets.", highlight = 1, icon = bb.player.spell.crimsonTempest },
            [2] = { mode = "Off", value = 2 , overlay = "Cleaving Disabled", tip = "Rotation will not cleave targets", highlight = 0, icon = bb.player.spell.mutilate }
        };
        CreateButton("Cleave",5,0)
    -- Pick Pocket Button
      	PickerModes = {
          [1] = { mode = "Auto", value = 2 , overlay = "Auto Pick Pocket Enabled", tip = "Profile will attempt to Pick Pocket prior to combat.", highlight = 1, icon = bb.player.spell.pickPocket},
          [2] = { mode = "Only", value = 1 , overlay = "Only Pick Pocket Enabled", tip = "Profile will attempt to Sap and only Pick Pocket, no combat.", highlight = 0, icon = bb.player.spell.pickPocket},
          [3] = { mode = "Off", value = 3, overlay = "Pick Pocket Disabled", tip = "Profile will not use Pick Pocket.", highlight = 0, icon = bb.player.spell.pickPocket}
        };
        CreateButton("Picker",6,0)
    end

---------------
--- OPTIONS ---
---------------
    local function createOptions()
        local optionTable

        local function rotationOptions()
            -----------------------
            --- GENERAL OPTIONS ---
            -----------------------
            section = bb.ui:createSection(bb.ui.window.profile,  "General")
            	-- Stealth
	            bb.ui:createDropdown(section,  "Stealth", {"|cff00FF00Always", "|cffFFDD00PrePot", "|cffFF000020Yards"},  1, "Stealthing method.")
	            bb.ui:createSpinner(section,  "Stealth Timer",  1,  0,  2,  0.25,  "|cffFFBB00How long to wait(seconds) before using \n|cffFFFFFFStealth.")
	            -- Opening Attack
	            bb.ui:createDropdown(section, "Opener", {"Ambush", "Mutilate", "Cheap Shot"},  1, "|cffFFFFFFSelect Attack to Break Stealth with")
	            -- Pre-Pull Timer
	            bb.ui:createSpinner(section, "Pre-Pull Timer",  5,  1,  10,  1,  "|cffFFFFFFSet to desired time to start Pre-Pull (DBM Required). Min: 1 / Max: 10 / Interval: 1")
            bb.ui:checkSectionState(section)
            ------------------------
            --- COOLDOWN OPTIONS ---
            ------------------------
            section = bb.ui:createSection(bb.ui.window.profile,  "Cooldowns")
                -- Agi Pot
	            bb.ui:createCheckbox(section,"Agi-Pot")
	            -- Legendary Ring
	            bb.ui:createCheckbox(section,  "Legendary Ring")
	            -- Preparation
	            bb.ui:createCheckbox(section,  "Preparation")
	            -- Shadow Reflection
	            bb.ui:createCheckbox(section,  "Shadow Reflection")
	            -- Vanish
	            bb.ui:createCheckbox(section,  "Vanish - Offensive")
	            -- Vendetta
	            bb.ui:createCheckbox(section,  "Vendetta")
            bb.ui:checkSectionState(section)
            -------------------------
            --- DEFENSIVE OPTIONS ---
            -------------------------
            section = bb.ui:createSection(bb.ui.window.profile, "Defensive")
            	-- Cloak of Shadows
                bb.ui:createCheckbox(section,"Cloak of Shadows","Enable or Disable the usage to auto dispel")
	            -- Combat Readiness
	            bb.ui:createSpinner(section, "Combat Readiness",  40,  0,  100,  5, "Set health percent threshhold to cast at - In Combat Only!",  "|cffFFFFFFHealth Percent to Cast At")
	            -- Evasion
                bb.ui:createSpinner(section, "Evasion",  40,  0,  100,  5, "Set health percent threshhold to cast at - In Combat Only!",  "|cffFFFFFFHealth Percent to Cast At")
	            -- Feint
                bb.ui:createSpinner(section, "Feint",  40,  0,  100,  5, "Set health percent threshhold to cast at - In Combat Only!",  "|cffFFFFFFHealth Percent to Cast At")
	            -- Healthstone
	            bb.ui:createSpinner(section, "Healthstone",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
	            -- Heirloom Neck
	            bb.ui:createSpinner(section, "Heirloom Neck",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
	            -- Recuperate
                bb.ui:createSpinner(section, "Recuperate Health %",  40,  0,  100,  5, "Set health percent and combo point threshhold to cast at",  "|cffFFFFFFHealth Percent to Cast At")
                bb.ui:createSpinner(section, "Recuperate Combo Point",  3,  1,  5,  1, "Set health percent and combo point threshhold to cast at",  "|cffFFFFFFCombo Points to Use At")
	            --Shiv
                bb.ui:createSpinner(section, "Shiv",  40,  0,  100,  5, "Set health percent threshhold to cast at - In Combat Only!", "|cffFFFFFFHealth Percent to Cast At")
	            -- Smoke Bomb
                bb.ui:createSpinner(section, "Smoke Bomb",  40,  0,  100,  5, "Set health percent threshhold to cast at - In Combat Only!", "|cffFFFFFFHealth Percent to Cast At")
	            -- Vanish - Defensive
                bb.ui:createSpinner(section, "Vanish - Defensive",  40,  0,  100,  5, "Set health percent threshhold to cast at - Defensive Use Only, see Cooldowns for Offensive Use", "|cffFFFFFFHealth Percent to Cast At")
            bb.ui:checkSectionState(section)
            -------------------------
            --- INTERRUPT OPTIONS ---
            -------------------------
            section = bb.ui:createSection(bb.ui.window.profile, "Interrupts")
            	-- Kick
	            bb.ui:createCheckbox(section,"Kick")
	            -- Gouge
	            bb.ui:createCheckbox(section,"Gouge")
	            -- Blind
	            bb.ui:createCheckbox(section,"Blind")
	            -- Interrupt Percentage
	            bb.ui:createSpinner(section,  "Interrupt At",  0,  0,  95,  5,  "|cffFFBB00Cast Percentage to use at.")    
            bb.ui:checkSectionState(section)
            ----------------------
            --- TOGGLE OPTIONS ---
            ----------------------
            section = bb.ui:createSection(bb.ui.window.profile,  "Toggle Keys")
            	-- Single/Multi Toggle
	            bb.ui:createDropdown(section,  "Rotation Mode", bb.dropOptions.Toggle,  4)
	            --Cooldown Key Toggle
	            bb.ui:createDropdown(section,  "Cooldown Mode", bb.dropOptions.Toggle,  3)
	            --Defensive Key Toggle
	            bb.ui:createDropdown(section,  "Defensive Mode", bb.dropOptions.Toggle,  6)
	            -- Interrupts Key Toggle
	            bb.ui:createDropdown(section,  "Interrupt Mode", bb.dropOptions.Toggle,  6)
	            -- Cleave Toggle
	            bb.ui:createDropdown(section,  "Cleave Mode", bb.dropOptions.Toggle,  6)
	            -- Pick Pocket Toggle
	            bb.ui:createDropdown(section,  "Pick Pocket Mode", bb.dropOptions.Toggle,  6)
	            -- Pause Toggle
	            bb.ui:createDropdown(section,  "Pause Mode", bb.dropOptions.Toggle,  6)   
            bb.ui:checkSectionState(section)
        end
        optionTable = {{
            [1] = "Rotation Options",
            [2] = rotationOptions,
        }}
        return optionTable
    end

----------------
--- ROTATION ---
----------------
    local function runRotation()
        if bb.timer:useTimer("debugAssassination", 0.1) then
            --print("Running: "..rotationName)

    ---------------
    --- Toggles ---
    ---------------
            UpdateToggle("Rotation",0.25)
            UpdateToggle("Cooldown",0.25)
            UpdateToggle("Defensive",0.25)
            UpdateToggle("Interrupt",0.25)
            UpdateToggle("Cleave",0.25)
            UpdateToggle("Picker",0.25)

	--------------
	--- Locals ---
	--------------
			if leftCombat == nil then leftCombat = GetTime() end
			if profileStop == nil then profileStop = false end
			local attacktar 									= UnitCanAttack("target","player")
			local buff, buffRemain								= bb.player.buff, bb.player.buff.remain
			local cd 											= bb.player.cd
			local charge 										= bb.player.charges
			local combo 										= bb.player.comboPoints
			local deadtar										= UnitIsDeadOrGhost("target")
			local debuff, debuffRemain							= bb.player.debuff, bb.player.debuff.remain
			local dynTar5 										= bb.player.units.dyn5 --Melee
			local dynTar15 										= bb.player.units.dyn15 
			local dynTar20AoE 									= bb.player.units.dyn20AoE --Stealth
			local dynTar30AoE 									= bb.player.units.dyn30AoE
			local dynTable5										= (bb.data['Cleave']==1 and bb.enemy) or { [1] = {["unit"]=dynTar5, ["distance"] = getDistance(dynTar5)}}
			local dynTable15									= (bb.data['Cleave']==1 and bb.enemy) or { [1] = {["unit"]=dynTar15, ["distance"] = getDistance(dynTar15)}}
			local dynTable20AoE 								= (bb.data['Cleave']==1 and bb.enemy) or { [1] = {["unit"]=dynTar20AoE, ["distance"] = getDistance(dynTar20AoE)}}
			local enemies10										= bb.player.enemies.yards10
			local flaskBuff, canFlask							= getBuffRemain("player",bb.player.flask.wod.buff.agilityBig), canUse(bb.player.flask.wod.agilityBig)	
			local gcd 											= bb.player.gcd
			local glyph				 							= bb.player.glyph
			local hastar 										= ObjectExists("target")
			local inCombat 										= bb.player.inCombat
			local level											= bb.player.level
			local perk											= bb.player.perk
			local php											= bb.player.health
			local power, powerRegen								= bb.player.power, bb.player.powerRegen
			local pullTimer 									= bb.DBM:getPulltimer()
			local ruptureTick 									= bb.player.debuff.remain.rupture/2
			local solo											= select(2,IsInInstance())=="none"	
			local stealth 										= bb.player.stealth
			local t18_4pc 										= bb.player.eq.t18_4pc
			local talent 										= bb.player.talent
			local targets10										= bb.player.enemies.yards10
			local time 											= getCombatTime()
			local ttm 											= bb.player.timeToMax

	--------------------
	--- Action Lists ---
	--------------------
		-- Action List - Extras
			local function actionList_Extras()
				-- TODO: Add Extra Features To Base Profile
			-- Dummy Test
	            if isChecked("DPS Testing") then
	                if GetObjectExists("target") then
	                    if getCombatTime() >= (tonumber(getOptionValue("DPS Testing"))*60) and isDummy() then
	                        StopAttack()
	                        ClearTarget()
	                        ChatOverlay(tonumber(getOptionValue("DPS Testing")) .." Minute Dummy Test Concluded - Profile Stopped")
	                        profileStop = true
	                    end
	                end
	            end
	        -- Pick Pocket
	        	if canPP() then
	        		if bb.player.noAttack() then
	        			for i=1, #dynTable5 do 
							if getDistance(dynTable5[i].unit)<5 then
								thisUnit = dynTable5[i].unit
								if bb.player.isPicked(thisUnit) then 
									ClearTarget() 
								elseif sapRemain(thisUnit)==0 then
			        -- Sap
				        			if bb.player.castSap(thisUnit) then return end
				        		elseif not bb.player.isPicked(thisUnit) then
			        -- Pick Pocket
		               				myTarget=thisUnit
		               				if bb.player.castPickPocket(thisUnit) then return end
					            end
					        end
				        end               		
	               	end
	               	if not bb.player.noAttack() and not bb.player.isPicked("target") then
	               		myTarget="target"
	               		if bb.player.castPickPocket("target") then return end
	               	end
	        	end -- End Pick Pocket
			end -- End Action List - Extras
		-- Action List - Defensives
			local function actionList_Defensive()
				-- TODO: Add Defensive Abilities
				if useDefensive() and not stealth then
					-- Cloak of Shadows
			        if isChecked("Cloak of Shadows") and canDispel("player") then
			            if bb.player.castCloakOfShadows() then return end
			        end
			        -- Combat Readiness
	                if isChecked("Combat Readiness") and php<getOptionValue("Combat Readiness") and inCombat then
	                    if bb.player.castCombatReadiness() then return end
	                end
	                -- Evasion
	                if isChecked("Evasion") and php<getOptionValue("Evasion") and inCombat then
	                    if bb.player.castEvasion() then return end
	                end
	                -- Feint
	                if isChecked("Feint") and talent.Elusiveness and php<getOptionValue("Feint") and inCombat then
	                	if bb.player.castFeint() then return end
	                end
	                -- Heirloom Neck
		    		if isChecked("Heirloom Neck") and php <= getOptionValue("Heirloom Neck") and not inCombat then
		    			if hasEquiped(122668) then
		    				if GetItemCooldown(122668)==0 then
		    					useItem(122668)
		    				end
		    			end
		    		end
					-- Pot/Stoned
		            if isChecked("Healthstone") and php <= getOptionValue("Healthstone") and inCombat and hasHealthPot() then
	                    if canUse(5512) then
	                        useItem(5512)
	                    elseif canUse(healPot) then
	                        useItem(healPot)
	                    end
		            end
		            -- Recuperate
	                if isChecked("Recuperate Health %") and php<getOptionValue("Recuperate Health %") and combo>getOptionValue("Recuperate Combo Point") and not buff.recuperate then
	                    if bb.player.castRecuperate() then return end
	                end
		    		-- Shiv
		    		if isChecked("Shiv") and talent.leechingPoison and php<getOptionValue("Shiv") and inCombat then
		    			if bb.player.castShiv() then return end
		    		end
	 				-- Smoke Bomb
					if isChecked("Smoke Bomb") and php<getOptionValue("Smoke Bomb") and inCombat then
						if bb.player.castSmokeBomb() then return end
					end
	                -- Vanish
	                if isChecked("Vanish - Defensive") and php<getOptionValue("Vanish - Defensive") then
	                    if bb.player.castVanish() then StopAttack(); ClearTarget(); return end
	                end
	            end
			end -- End Action List - Defensive
		-- Action List - Interrupts
			local function actionList_Interrupts()
				if useInterrupts() and not stealth then
			-- Kick
					-- kick
					if isChecked("Kick") then
						for i=1, #dynTable5 do
							thisUnit = dynTable5[i].unit
							if canInterrupt(thisUnit,getOptionValue("Interrupt At")) then
								if bb.player.castKick(thisUnit) then return end
							end
						end
					end
					if talent.dirtyTricks then
			-- Gouge
						if isChecked("Gouge") then
							for i=1, #dynTable5 do
								thisUnit = dynTable5[i].unit
								if canInterrupt(thisUnit,getOptionValue("Interrupt At")) then
									if bb.player.castGouge(thisUnit) then return end
								end
							end
						end
			-- Blind
						if isChecked("Blind") then
							for i=1, #dynTable15 do
								thisUnit = dynTable15[i].unit
								if canInterrupt(thisUnit,getOptionValue("Interrupt At")) then
									if bb.player.castBlind(thisUnit) then return end
								end 
							end
						end
					end -- End Dirty Tricks Talent Check
				end -- End Interrupt and No Stealth Check
			end -- End Action List - Interrupts
		-- Action List - Cooldowns
			local function actionList_Cooldowns()
				if useCDs() then
			-- Preparation
					-- if=!buff.vanish.up&cooldown.vanish.remains>60&time>10
					if isChecked("Preparation") and not buff.vanish and cd.vanish>60 and time>10 then
						if bb.player.castPreparation() then return end
					end
			-- Legendary Ring
					-- use_item,slot=finger1,if=spell_targets.fan_of_knives>1|(debuff.vendetta.up&spell_targets.fan_of_knives=1)
			-- Racials - Orc: Blood Fury | Troll: Berserking | Blood Elf: Arcane Torrent
					-- blood_fury | berserking | arcane_torrent,if=energy<60
					if isChecked("Racials") and bb.player.race == "Orc" or bb.player.race== "Troll" or (bb.player.race=="Blood Elf" and power<60) then
						if bb.player.castRacial() then return end
					end
			-- Vanish
					-- if=time>10&energy>13&!buff.stealth.up&buff.blindside.down&energy.time_to_max>gcd*2&((combo_points+anticipation_charges<8)|(!talent.anticipation.enabled&combo_points<=1))
					if isChecked("Vanish - Offensive") and not solo and time>10 and power>13 and not stealth and not buff.blindside and ttm>gcd*2 and ((combo + charge.anticipation<8) or (not talent.anticipation and combo<=1)) then
						if bb.player.castVanish() then return end
					end
			-- Potion
					-- draenic_agility,if=buff.bloodlust.react|target.time_to_die<40|debuff.vendetta.up
					if useCDs() and canUse(109217) and select(2,IsInInstance())=="raid" and isChecked("Agi-Pot") then
		            	if hasBloodLust() or getTimeToDie(dynTar5) or debuff.vendetta then
		                	useItem(109217)
		                end
		            end
				end -- End Cooldown Usage Check
			end -- End Action List - Cooldowns
		-- Action List - PreCombat
			local function actionList_PreCombat()
				if not inCombat then
					if not stealth then
			-- Flask
						-- flask,type=greater_draenic_agility_flask
						if isChecked("Agi-Pot") then
							if select(2,IsInInstance())=="raid" and canFlask and flaskBuff==0 and not UnitBuffID("player",176151) then
								useItem(bb.player.flask.wod.agilityBig)
								return true
							end
				            if (select(2,IsInInstance())=="raid" or select(2,IsInInstance())=="none") and flaskBuff==0 then
				                -- if not UnitBuffID("player",176151) and canUse(118922) then --Draenor Insanity Crystal
				                --     UseItemByName(tostring(select(1,GetItemInfo(118922))))
				                -- end
				                if bb.player.useCrystal() then return end
				            end
					    end
			-- Food
						-- food,type=sleeper_sushi
			-- Poisons
						-- apply_poison,lethal=deadly
						-- NOTHING TO CODE - PROFILE APPLIES BY DEFAULT!
			-- Potion
						-- potion,name=draenic_agility
						if useCDs() and canUse(109217) and select(2,IsInInstance())=="raid" and isChecked("Agi-Pot") and isChecked("Pre-Pull Timer") and pullTimer <= getOptionValue("Pre-Pull Timer") then
		                	useItem(109217)
			            end
			-- Stealth
						if isChecked("Stealth") and (stealthTimer == nil or stealthTimer < GetTime() - getValue("Stealth Timer")) and not stealth then
		                    -- Always
		                    if getValue("Stealth") == 1 then
		                        if bb.player.castStealth() then stealthTimer = GetTime(); return end
		                    end
		                    -- Pre-Pot
		                    if getValue("Stealth") == 2 and getBuffRemain("player",105697) > 0 and getDistance(dynTar20AoE) < 20 then
		                    	if bb.player.castStealth() then stealthTimer=GetTime(); return end
		                    end
		                    -- 20 Yards
		                    if not friendly or isDummy() then
								for i=1, #dynTable20AoE do
									local thisUnit = dynTable20AoE[i].unit
							        if getValue("Stealth") == 3 and ObjectExists(thisUnit) and UnitCanAttack(thisUnit,"player") then
							        	if bb.player.castStealth() then stealthTimer=GetTime(); return end
							        end
							    end
							end
		                end
		            end -- End Stealth Check
			-- Marked For Death
					-- marked_for_death
					if bb.player.castMarkedForDeath(dynTar30AoE) then return end
			-- Slice And Dice
					-- slice_and_dice,if=talent.marked_for_death.enabled
					if talent.markedForDeath and not perk.improvedSliceAndDice then
						if bb.player.castSliceAndDice() then return end
					end
				end -- End No Combat
				-- Slice and Dice
				-- if=buff.slice_and_dice.remains<5
				if not perk.improvedSliceAndDice and buffRemain.sliceAndDice<5 then
					if bb.player.castSliceAndDice() then return end
				end
			end -- End Action List - PreCombat
		-- Action List - Opener
			local function actionList_Opener()
			-- Opener
				if hastar and attacktar and stealth and not bb.player.noAttack() then
	                -- Shadowstep
	                if getDistance("target") < 25 and getDistance("target") >= 8 and talent.shadowStep and (select(2,IsInInstance())=="none" or isInCombat("target")) then
	                    if bb.player.castShadowStep() then return end
	                end
	                -- Cloak and Dagger
	                if getDistance("target") < 40 and getDistance("target") >= 8 and talent.cloakAndDagger and (select(2,IsInInstance())=="none" or isInCombat("target")) then
	                	if getOptionValue("Opener")==1 then
	                    	if bb.player.castAmbush() then return end
	                    end
	                    if getOptionValue("Opener")==2 then
	                    	ChatOverlay("Used Ambush instead of Mutilate due to Cloak and Dagger Talent")
	                    	if bb.player.castAmbush() then return end
	                    end
	                    if getOptionValue("Opener")==3 then
	                    	if bb.player.castCheapShot() then return end
	                    end
	                end
	                if (bb.player.isPicked() or level<15) then
	                    -- Low Combo Opener
	                    if combo<5 then
	                    	if getOptionValue("Opener")==1 then
		                    	if bb.player.castAmbush() then return end
		                    end
		                    if getOptionValue("Opener")==2 then
		                    	if bb.player.castMutilate2(dynTar5) then return end
		                    end
		                    if getOptionValue("Opener")==3 then
		                    	if bb.player.castCheapShot() then return end
		                    end
	                    end
	                    -- 5 Combo Opener
	                    if combo == 5 then
	                        if power>35 and level<20 and (buffRemain.sliceAndDice>=5 or level<14) then
	                            if bb.player.castEviscerate() then return end
	                        end
	                        if power>25 and buffRemain.sliceAndDice<5 and not perk.improvedSliceAndDice then
	                            if bb.player.castSliceAndDice() then return end
	                        end
	                        if power>25 and debuffRemain.rupture<3 then
	                            if bb.player.castRupture(dynTar5) then return end
	                        end
	                        if power>35 and envenomRemain(dynTar5)<2 then
	                            if bb.player.castEnvenom2(dynTar5) then return end
	                        end
	                    end
	                end -- End Open Attack from Stealth
	            end -- End Stealth
			end -- End Action List - Opener
		-- Action List - Finishers
			local function actionList_Finishers()
				if enemies10>5 and level>=83 and (useCleave() or bb.data['AoE'] == 2) then
			-- Crimson Tempest
					if bb.player.castCrimsonTempest() then return end
				else
			-- Rupture
					-- cycle_targets=1,if=(remains<2|(combo_points=5&remains<=(duration*0.3)))
					for i=1, #dynTable5 do
						local thisUnit = dynTable5[i].unit
						if (ruptureRemain(thisUnit)<2 or (combo==5 and ruptureRemain(thisUnit)<=ruptureDuration(thisUnit)*0.3)) then
							if bb.player.castRupture(thisUnit) then return end
						end
					end
			-- Pool/Death From Above
					-- if=(cooldown.vendetta.remains>10|debuff.vendetta.up|target.time_to_die<=25)
					if useCDs() and (cd.vendetta>10 or debuff.vendetta or getTimeToDie(dynTar5)<=25) then
						if power<=50 then

							return true
						else
							if bb.player.castDeathFromAbove() then return end
						end
					end
			-- Envenom
					-- cycle_targets=1,if=dot.deadly_poison_dot.remains<4&target.health.pct<=35&(energy+energy.regen*cooldown.vendetta.remains>=105&(buff.envenom.remains<=1.8|energy>45))|buff.bloodlust.up|debuff.vendetta.up
					for i=1, #dynTable5 do
						local thisUnit = dynTable5[i].unit
						if deadlyRemain(thisUnit)<4 and thp(thisUnit)<=35 and (power+powerRegen*cd.vendetta>=105 and (buffRemain.envenom<=1.8 or power>40)) or hasBloodLust() or debuff.vendetta then
							if bb.player.castEnvenom2(thisUnit) then return end
						end
					end 
					-- cycle_targets=1,if=dot.deadly_poison_dot.remains<4&target.health.pct>35&(energy+energy.regen*cooldown.vendetta.remains>=105&(buff.envenom.remains<=1.8|energy>55))|buff.bloodlust.up|debuff.vendetta.up
					for i=1, #dynTable5 do
						local thisUnit = dynTable5[i].unit
						if deadlyRemain(thisUnit)<4 and thp(thisUnit)>35 and (power+powerRegen*cd.vendetta>=105 and (buffRemain.envenom<=1.8 or power>55)) or hasBloodLust() or debuff.vendetta then
							if bb.player.castEnvenom2(thisUnit) then return end
						end
					end 
					-- if=target.health.pct<=35&(energy+energy.regen*cooldown.vendetta.remains>=105&(buff.envenom.remains<=1.8|energy>45))|buff.bloodlust.up|debuff.vendetta.up
					if thp(dynTar5)<=35 and (power+powerRegen*cd.vendetta>=105 and (buffRemain.envenom<=1.8 or power>45)) or hasBloodLust() or debuff.vendetta then
						if bb.player.castEnvenom2(dynTar5) then return end
					end
					-- if=target.health.pct>35&(energy+energy.regen*cooldown.vendetta.remains>=105&(buff.envenom.remains<=1.8|energy>55))|buff.bloodlust.up|debuff.vendetta.up
					if thp(dynTar5)>35 and (power+powerRegen*cd.vendetta>=105 and (buffRemain.envenom<=1.8 or power>55)) or hasBloodLust() or debuff.vendetta then
						if bb.player.castEnvenom2(dynTar5) then return end
					end
			-- Kidney Shot
					if talent.internalBleeding then
						for i=1, #dynTable5 do
							local thisUnit = dynTable5[i].unit
							if (internalBleedingRemain(thisUnit)<2 or (combo==5 and internalBleedingRemain(thisUnit)<=internalBleedingDuration(thisUnit)*0.3)) then
								if bb.player.castKidneyShot(thisUnit) then return end
							end
						end
					end
				end -- End Crimson Tempest usage
			end -- End Action List - Finishers
		-- Action List - Generators
			local function actionList_Generators()
				-- Fan of Knives
				if enemies10>3 and level>=66 and (useCleave() or bb.data['AoE'] == 2) then
					if bb.player.castFanOfKnives() then return end
				else
					-- Dispatch
					-- cycle_targets=1,if=dot.deadly_poison_dot.remains<4&talent.anticipation.enabled&((anticipation_charges<4&set_bonus.tier18_4pc=0)|(anticipation_charges<2&set_bonus.tier18_4pc=1))
					for i=1, #dynTable5 do
						local thisUnit = dynTable5[i].unit
						if deadlyRemain(thisUnit)<4 and talent.anticipation and ((charge.anticipation<4 and t18_4pc==false) or (charge.anticipation<2 and t18_4pc==true)) then
							if bb.player.castDispatch2(thisUnit) then return end
						end
					end
					-- cycle_targets=1,if=dot.deadly_poison_dot.remains<4&!talent.anticipation.enabled&combo_points<5&set_bonus.tier18_4pc=0
					for i=1, #dynTable5 do
						local thisUnit = dynTable5[i].unit
						if deadlyRemain(thisUnit)<4 and not talent.anticipation and combo<5 and t18_4pc==false then
							if bb.player.castDispatch2(thisUnit) then return end
						end
					end
					-- cycle_targets=1,if=dot.deadly_poison_dot.remains<4&!talent.anticipation.enabled&set_bonus.tier18_4pc=1&(combo_points<2|target.health.pct<35)
					for i=1, #dynTable5 do
						local thisUnit = dynTable5[i].unit
						if deadlyRemain(thisUnit)<4 and not talent.anticipation and t18_4pc==true and (combo<2 or thp(thisUnit)<35) then
							if bb.player.castDispatch2(thisUnit) then return end
						end
					end
					-- if=talent.anticipation.enabled&((anticipation_charges<4&set_bonus.tier18_4pc=0)|(anticipation_charges<2&set_bonus.tier18_4pc=1))
					if talent.anticipation and ((charge.anticipation<4 and t18_4pc==false) or charge.anticipation<2 and t18_4pc==true) then
						if bb.player.castDispatch2(dynTar5) then return end
					end
					-- if=!talent.anticipation.enabled&combo_points<5&set_bonus.tier18_4pc=0
					if not talent.anticipation and combo<5 and t18_4pc==false then
						if bb.player.castDispatch2(dynTar5) then return end
					end
					-- if=!talent.anticipation.enabled&set_bonus.tier18_4pc=1&(combo_points<2|target.health.pct<35)
					if not talent.anticipation and t18_4pc==true and (combo<2 or thp(dynTar5)<35) then
						if bb.player.castDispatch2(dynTar5) then return end
					end
					if combo==0 and power>30 then
						if bb.player.castDispatch2(dynTar5) then return end
					end	
				-- Mutilate
					-- cycle_targets=1,if=dot.deadly_poison_dot.remains<4&target.health.pct>35&(combo_points<5|(talent.anticipation.enabled&anticipation_charges<3))
					for i=1, #dynTable5 do
						local thisUnit = dynTable5[i].unit
						if deadlyRemain(thisUnit)<4 and thp(thisUnit)>35 and (combo<5 or (talent.anticipation and charge.anticipation<3)) and hastar then
							if bb.player.castMutilate2(thisUnit) then return end
						end
					end
					-- if=target.health.pct>35&(combo_points<5|(talent.anticipation.enabled&anticipation_charges<3))
					if thp(dynTar5)>35 and (combo<5 or (talent.anticipation and charge.anticipation<3)) then
						if bb.player.castMutilate2(dynTar5) then return end
					end
					if combo==0 and power>55 then
						if bb.player.castDispatch2(dynTar5) then return end
					end
				end -- End Fan of Knives usage
			-- Preparation
				-- if=(cooldown.vanish.remains>50|!glyph.disappearance.enabled&cooldown.vanish.remains>110)&buff.vanish.down&buff.stealth.down
				if (cd.vanish>50 or (not glyph.disappearance and cd.vanish>110)) and not buff.vanish and not buff.stealth then
					if bb.player.castVanish() then return end
				end
			end -- End Action List - Generators
	---------------------
	--- Begin Profile ---
	---------------------
		--Profile Stop | Pause
			if not inCombat and not hastar and profileStop==true then
				profileStop = false
			elseif (inCombat and profileStop==true) or pause() then
				return true
			else
	-----------------------
	--- Extras Rotation ---
	-----------------------
				if actionList_Extras() then return end
	--------------------------
	--- Defensive Rotation ---
	--------------------------
				if actionList_Defensive() then return end
	------------------------------
	--- Out of Combat Rotation ---
	------------------------------
				if actionList_PreCombat() then return end
	----------------------------
	--- Out of Combat Opener ---
	----------------------------
				if actionList_Opener() then return end
	--------------------------
	--- In Combat Rotation ---
	--------------------------
			-- Assassination is 4 shank!
				if inCombat then
					if hartar and deadtar then
						ClearTarget()
					end
					if ((hartar and deadtar) or (not hastar and not isDummy())) and getDistance(dynTar5)<5 then
						StartAttack()
					end
	------------------------------
	--- In Combat - Interrupts ---
	------------------------------
					if actionList_Interrupts() then return end
	-----------------------------
	--- In Combat - Cooldowns ---
	-----------------------------
					if actionList_Cooldowns() then return end
	--------------------------
	--- In Combat - Opener ---
	--------------------------
					if actionList_Opener() then return end
	----------------------------------
	--- In Combat - Begin Rotation ---
	----------------------------------
			-- Mutilate
					-- if=buff.stealth.up|buff.vanish.up
					if (stealth or buff.vanish) and (enemies10<6 or level<83 or not useCleave() or bb.data['AoE'] == 3) then
						if bb.player.castMutilate2(dynTar5) then return end
					end
			-- Rupture
					-- if=((combo_points>=4&!talent.anticipation.enabled)|combo_points=5)&ticks_remain<3
					if ((combo>=4 and not talent.anticipation) or combo==5) and ruptureTick<3 and (enemies10<6 or level<83 or not useCleave() or bb.data['AoE'] == 3) then
						if bb.player.castRupture(dynTar5) then return end
					end
					-- cycle_targets=1,if=spell_targets.fan_of_knives>1&!ticking&combo_points=5
					for i=1, #dynTable5 do
						thisUnit = dynTable5[i].unit
						if targets10>1 and ruptureRemain(thisUnit)<2 and combo==5 then
							if bb.player.castRupture(thisUnit) then return end
						end
					end
			-- Marked For Death
					-- if=combo_points=0
					if combo==0 then
						if bb.player.castMarkedForDeath() then return end
					end
			-- Shadow Reflection
					-- if=combo_points>4|target.time_to_die<=20
					if useCDs() and isChecked("Shadow Reflection") and (combo>4 or getTimeToDie(dynTar20AoE)<=20) then
						if bb.player.castShadowReflection() then return end
					end
			-- Vendetta
					-- if=buff.shadow_reflection.up|!talent.shadow_reflection.enabled|target.time_to_die<=20|(target.time_to_die<=30&glyph.vendetta.enabled)
					if useCDs() and isChecked("Vendetta") and (buff.shadowReflection or not talent.shadowReflection or getTimeToDie(dynTar5)<=20 or (getTimeToDie(dynTar5)<=30 and glyph.vendetta)) then
						if bb.player.castVendetta() then return end
					end
			-- Rupture
					-- cycle_targets=1,if=combo_points=5&remains<=duration*0.3&spell_targets.fan_of_knives>1
					if (enemies10<6 or level<83 or not useCleave() or bb.data['AoE'] == 3) then
						for i=1, #dynTable5 do
							local thisUnit = dynTable5[i].unit
							if combo==5 and ruptureRemain(thisUnit)<=ruptureDuration(thisUnit)*0.3 and targets10>1 then
								if bb.player.castRupture(thisUnit) then return end
							end
						end
					end
			-- Finishers
					-- name=finishers,if=combo_points=5&((!cooldown.death_from_above.remains&talent.death_from_above.enabled)|buff.envenom.down|!talent.anticipation.enabled|anticipation_charges+combo_points>=6)
					if combo==5 and ((cd.deathFromAbove==0 and talent.deathFromAbove) or not buff.envenom or not talent.anticipation or charge.anticipation+combo>=6) then
						if actionList_Finishers() then return end
					end
					-- name=finishers,if=dot.rupture.remains<2
					if debuffRemain.rupture<2 then
						if actionList_Finishers() then return end
					end
			-- Generators
					if actionList_Generators() then return end
				end -- End In Combat
			end -- End Profile
	    end -- Timer
	end -- runRotation
	tinsert(cAssassination.rotations, {
        name = rotationName,
        toggles = createToggles,
        options = createOptions,
        run = runRotation,
    })
end -- End Class Check
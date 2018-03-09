--
-- Script for controling fertilizer ammount
--
-- Author: Martin Fabík (https://www.fb.com/LoogleCZ)
-- GitHub repository: https://github.com/LoogleCZ/FS17-RealEntering
--
-- Free for non-comerecial usage!
--
-- version ID   - 1.0.0
-- version date - 2018-06-06 20:14:00
--
-- used namespace: LRE
--
-- This is development version! DO not use it on release!
--

RealEntering = {};

function RealEntering.prerequisitesPresent(specializations)
	return true;
end;

function RealEntering:preLoad(savegame)
	print("RealEntering preload!");
	self.LRE = {};
	self.LRE.player = {};
end;

function RealEntering:load(savegame)
	-- hardcoded values - testing possibility.
	
	self.LRE.player.bodyIndex = Utils.indexToObject(self.components, "0>21|0");
	self.LRE.player.rightFoot = Utils.indexToObject(self.components, "0>21|1");
	self.LRE.player.leftFoot = Utils.indexToObject(self.components, "0>21|2");
	self.LRE.player.rightArm = Utils.indexToObject(self.components, "0>21|3");
	self.LRE.player.leftArm = Utils.indexToObject(self.components, "0>21|4");
	
	
	self.LRE.player.enterAnimaton = getXMLString(self.xmlFile, "vehicle.realEntering#animation");
	
	--[[
	Example xml:
	<realEntering animation="" doorAnimation="" middleTime="" >
		<animationCharacterNodes index="0>21|0">
			<rightFoot targetNode="0>21|1"/>
			<leftFoot targetNode="0>21|2"/>
			<rightArm targetNode="0>21|3"/>
			<leftArm targetNode="0>21|4"/>
		</animationCharacterNodes>
		<spineKeyframes>
			<keyframe startTime="" endTime="" startRot="" endRot="" />
		</spineKeyframes>
	</realEntering>
	]]--
	
	--[[
		Rotations:
			180 0 95
			180 0 95
		Keyframes:
			0>21
				P: 1.627 0.952 2.714
				R: 0 -90 0
				--
				P: 1.627 0.952 2.714
				R: 0 -90 0
				--
				P: 1.627 0.952 2.714
				R: 0 -90 0
				--
				P: 1.627 0.952 2.714
				R: 0 -90 0
			0>21|0
				P: 0 0 0
				R: 0 0 0
				--
				P: 0 0.212 0.037
				R: 0 0 0
				--
				P: -0.117 0.479 0.071
				R: 0 0 0
				--
				P: -0.123 0.741 0.071
				R: 0 0 0
			0>21|1
				P: -0.196 -1.654 0.149
				R: 0 0 0
				-- 
				P: -0.196 -1.654 0.149
				R: 0 0 0
				--
				P: 0.085 -0.007 0.332
				R: 0 0 0
				--
				P: 0.085 -0.017 0.332
				R: 0 0 0
			0>21|2
				P: 0.179 -1.654 0.136
				R: 0 0 0
				--
				P: 0.252 -0.309 0.332
				R: 0 0 0
				--
				P: 0.208 -0.309 0.316
				R: 0 7.988 0
				--
				P: 0.264 0.292 0.369
				R: 0 4.428 0
			0>21|3
				P: -0.064 0.655 0.569
				R: -92.599 5.541 -103.698
				--
				P: -0.064 0.655 0.569
				R: -92.599 5.541 -103.698
				--
				P: -0.441 1.157 0.607
				R: -93.253 5.185 -110.68
				--
				P: -0.441 1.14 0.607
				R: -94.58 4.062 -127.031
			0>21|4
				P: 0.219 0.618 0.565
				R: -89.128 -29.009 83.997
				--
				P: 0.261 1.040 0.594
				R: -62.781 -10.478 15.268
				--
				P: 0.236 1.074 0.561
				R: -61.101 -21.46 9.195
				--
				P: 0.335 1.448 0.59
				R: -73.906 -17.59 151.02
	]]--
	
	--[[
		ik chains targets:
		
		self.vehicleCharacter.ikChainTargets.leftFoot.targetNode / setDirty
		
		self.vehicleCharacter.characterDistanceRefNode == self.LRE.player.bodyIndex;
		self.vehicleCharacter.characterNode            == self.LRE.player.bodyIndex;
		
		self.vehicleCharacter.characterSpineRotation[1] = math.pi/2;
		setRotation(self.vehicleCharacter.spineNode, unpack(self.vehicleCharacter.characterSpineRotation));
	]]--
	
end;
function RealEntering:postLoad(savegame) end;

function RealEntering:delete() end;

function RealEntering:update(dt)
	self.vehicleCharacter:setDirty();
end;

function RealEntering:updateTick(dt) end;
function RealEntering:draw() end;
function RealEntering:readStream(streamId, connection) end;
function RealEntering:writeStream(streamId, connection) end;
function RealEntering:mouseEvent(posX, posY, isDown, isUp, button) end;
function RealEntering:keyEvent(unicode, sym, modifier, isDown) end;

function RealEntering:onEnter()
	print("Entered vehicle!");
	DebugUtil.printTableRecursively(self.vehicleCharacter.ikChainTargets, "--", 0, 3);
	print("My nodes:");
	print(tostring(self.LRE.player.bodyIndex));
	print(tostring(self.LRE.player.rightFoot));
	print(tostring(self.LRE.player.leftFoot));
	print(tostring(self.LRE.player.rightArm));
	print(tostring(self.LRE.player.leftArm));
	print("Spine find: ");
	DebugUtil.printTableRecursively(self.vehicleCharacter, "--", 0, 0);
	print("Rotation node: ");
	DebugUtil.printTableRecursively(self.vehicleCharacter.characterSpineRotation, "--", 0, 1);
	local x,y,z = getRotation(self.vehicleCharacter.spineNode);
	print("Real spine rotation:");
	print(tostring(x));
	print(tostring(y));
	print(tostring(z));
	-- self.vehicleCharacter.characterSpineRotation[1] = math.pi/2;
	-- setRotation(self.vehicleCharacter.spineNode, unpack(self.vehicleCharacter.characterSpineRotation));
	if self.LRE.player.enterAnimaton ~= nil then
		print("Play animation name");
		self:setAnimationTime(self.LRE.player.enterAnimaton, 0, true);
		self:playAnimation(self.LRE.player.enterAnimaton, 1, 0);
	else
		print("Animation is not set!");
	end;
end;

function RealEntering:onLeave()
	print("Leave vehicle!");
end;


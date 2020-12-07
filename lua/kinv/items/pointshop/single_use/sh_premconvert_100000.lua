/*
	Instances of this type are created through the points factory.
	No persistence is available as it does not make sense (buy points for points?)
*/

ITEM.PrintName = "[100,000] Premium Point Conversion"
ITEM.Description = "Activating this gives you the equivalent amount (100,000) of standard points. Careful, you can't convert them back!"
ITEM.baseClass = "base_single_use"
ITEM.category = "Misc"

ITEM.Price = {
	premiumPoints = 100000,
}

ITEM.material = "materials/pointshop2/pointconvert2.png"
ITEM.stackCount = 8

function ITEM:initialize( id )
	KInventory.Items.base_pointshop_item.initialize( self, id )
end

function ITEM:GetPrintName( )
	return self.PrintName
end

function ITEM:GetDescription( )
	return self.Description
end


function ITEM:CanBeUsed( )
	return true
end

--Give points on use
function ITEM:OnUse( )
	self:GetOwner():PS2_AddStandardPoints(100000)
end

/*
	Inventory icon
*/
function ITEM:getIcon( )
	self.icon = vgui.Create( "DPointshopMaterialInvIcon" )
	self.icon:SetItem( self )
	self.icon:SetSize( 64, 64 )
	return self.icon
end

function ITEM.static.GetPointshopIconDimensions( )
	return Pointshop2.GenerateIconSize( 4, 4 )
end

local KioskMenu = {}

KioskMenu.Tabs = {
	["   🥞 Breakfast"] = {
		{Name = "Pancakes", Price = "4.50", Toppings = {"Cream", "Strawberries", "Lemon Juice", "Golden Syrup"}, Description = "Fluffy pancakes served with your choice of toppings.", Image = "rbxassetid://6937742258"},
		{Name = "Omelette", Price = "5.00", Toppings = {"Cheese", "Mushrooms", "Ham"}, Description = "Delicious omelette with customizable fillings.", Image = "rbxassetid://6937742258"},
		{Name = "French Toast", Price = "4.75", Toppings = {"Maple Syrup", "Butter", "Bananas", "Berries"}, Description = "Golden french toast served with syrup and your choice of toppings.", Image = "rbxassetid://6937742258"},
		{Name = "Full English Breakfast", Price = "7.50", Toppings = {"Bacon", "Egg", "Sausage", "Toast", "Baked Beans", "Grilled Tomatoes", "Mushrooms"}, Description = "A hearty breakfast served with traditional English sides.", Image = "rbxassetid://6937742258"},
		{Name = "Granola Bowl", Price = "4.00", Toppings = {"Honey", "Banana", "Almonds", "Yogurt"}, Description = "A bowl of granola with a choice of toppings.", Image = "rbxassetid://6937742258"},
	},
	["   🍹 Drinks"] = {
		{Name = "Coffee", Price = "2.50", Description = "Freshly brewed coffee.", Image = "rbxassetid://6937742258"},
		{Name = "Orange Juice", Price = "3.00", Description = "Freshly squeezed orange juice.", Image = "rbxassetid://6937742258"},
		{Name = "Latte", Price = "3.50", Description = "A rich espresso with steamed milk and a touch of foam.", Image = "rbxassetid://6937742258"},
		{Name = "Iced Tea", Price = "2.80", Description = "Chilled tea served with a slice of lemon.", Image = "rbxassetid://6937742258"},
		{Name = "Smoothie", Price = "4.00", Toppings = {"Berries", "Banana", "Yogurt", "Honey"}, Description = "A refreshing fruit smoothie made to your liking.", Image = "rbxassetid://6937742258"},
	},
	["   🍟 Snacks"] = {
		{Name = "Chips", Price = "2.00", Description = "Crispy golden chips.", Image = "rbxassetid://6937742258"},
		{Name = "Nachos", Price = "4.00", Description = "Cheesy nachos with salsa dip.", Image = "rbxassetid://6937742258"},
		{Name = "Garlic Bread", Price = "3.50", Description = "Freshly baked garlic bread.", Image = "rbxassetid://6937742258"},
		{Name = "Mozzarella Sticks", Price = "5.00", Description = "Crispy mozzarella sticks served with marinara sauce.", Image = "rbxassetid://6937742258"},
		{Name = "Spring Rolls", Price = "4.50", Description = "Crispy vegetable spring rolls served with dipping sauce.", Image = "rbxassetid://6937742258"},
	},
	["   🍰 Desserts"] = {
		{Name = "Chocolate Cake", Price = "5.50", Description = "Rich chocolate cake with a moist texture.", Image = "rbxassetid://6937742258"},
		{Name = "Ice Cream", Price = "3.50", Toppings = {"Chocolate Sauce", "Sprinkles", "Waffle Cone"}, Description = "Creamy ice cream with toppings of your choice.", Image = "rbxassetid://6937742258"},
		{Name = "Cheesecake", Price = "4.50", Toppings = {"Strawberries", "Raspberry Sauce", "Chocolate Drizzle"}, Description = "Creamy cheesecake with a smooth texture.", Image = "rbxassetid://6937742258"},
		{Name = "Apple Pie", Price = "4.00", Description = "Warm apple pie with a flaky crust.", Image = "rbxassetid://6937742258"},
		{Name = "Brownie", Price = "3.00", Description = "Fudgy chocolate brownie with a rich taste.", Image = "rbxassetid://6937742258"},
	},
	["   💥 Combos"] = {
		{Name = "Burger & Fries", Price = "8.00", Description = "Juicy burger with a side of crispy fries.", Image = "rbxassetid://6937742258"},
		{Name = "Pizza & Drink", Price = "10.00", Description = "A delicious pizza with your choice of drink.", Image = "rbxassetid://6937742258"},
		{Name = "Pasta & Salad", Price = "9.50", Description = "A tasty pasta served with a side salad.", Image = "rbxassetid://6937742258"},
		{Name = "Chicken & Chips", Price = "8.50", Description = "Crispy fried chicken with a side of fries.", Image = "rbxassetid://6937742258"},
		{Name = "Fish & Chips", Price = "9.00", Description = "Crispy battered fish served with golden fries.", Image = "rbxassetid://6937742258"},
	},
	["   🍲 Soups"] = {
		{Name = "Tomato Soup", Price = "4.00", Description = "Classic creamy tomato soup.", Image = "rbxassetid://6937742258"},
		{Name = "Chicken Soup", Price = "4.50", Description = "Warm chicken soup with vegetables.", Image = "rbxassetid://6937742258"},
		{Name = "Vegetable Soup", Price = "4.00", Description = "A hearty soup made with seasonal vegetables.", Image = "rbxassetid://6937742258"},
		{Name = "Minestrone Soup", Price = "4.50", Description = "A traditional Italian vegetable soup.", Image = "rbxassetid://6937742258"}
	},
	["   🔮 Specials"] = {
		{Name = "Steak Sandwich", Price = "10.00", Description = "Grilled steak served in a toasted sandwich.", Image = "rbxassetid://6937742258"},
		{Name = "Chicken Caesar Wrap", Price = "7.00", Description = "Grilled chicken with Caesar dressing in a wrap.", Image = "rbxassetid://6937742258"},
		{Name = "Pulled Pork Fries", Price = "6.50", Description = "Crispy fries topped with pulled pork and barbecue sauce.", Image = "rbxassetid://6937742258"},
		{Name = "Vegan Burger", Price = "6.00", Description = "A plant-based burger with fresh toppings.", Image = "rbxassetid://6937742258"}
	}
}	

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local Player = game.Players.LocalPlayer

local PlayerGui = Player:FindFirstChild("PlayerGui")
if not PlayerGui then
	warn("PlayerGui not found!")
	return
end

local KioskGUI = PlayerGui:FindFirstChild("Kiosk")
if not KioskGUI then
	warn("Kiosk GUI not found!")
	return
end

local Currency = "£"
local ImageColour = Color3.fromRGB(0, 0, 0)

local MaxContentsPerPage = 4

local KioskMenuMainFrame = KioskGUI:WaitForChild("Kiosk")
local KioskMenuPositioner = KioskMenuMainFrame:WaitForChild("Kiosk-Top")
local KioskScrollHeaders = KioskMenuPositioner:WaitForChild("Kiosk-Scroll-Headers")
local KioskScrollMenu = KioskMenuPositioner:WaitForChild("Kiosk-Scroll-Menu")
local KioskSearchBar = KioskMenuPositioner:WaitForChild("Kiosk-SearchBar")

local MenuSubSection = ReplicatedStorage:WaitForChild("Kiosk"):WaitForChild("MenuGUIs"):WaitForChild("MenuSubSections")
local MenuContent = ReplicatedStorage:WaitForChild("Kiosk"):WaitForChild("MenuGUIs"):WaitForChild("Contents")
local KioskHeader = ReplicatedStorage:WaitForChild("Kiosk"):WaitForChild("MenuGUIs"):WaitForChild("Header")

local Debounce = false
KioskMenu.CurrentPages = {}
KioskMenu.CurrentlySelectedHeader = nil

local OriginalTabs = KioskMenu.Tabs

-- Function to animate a UI frame to a given set of properties.
function KioskMenu:AnimateFrame(Frame, Properties, Duration)
	local Tween = TweenService:Create(Frame, TweenInfo.new(Duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), Properties)
	Tween:Play()
end

-- Scrolls the Kiosk menu to the top with a smooth animation.
function KioskMenu:ScrollToTop()
	local Up = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local TweenGoal = {CanvasPosition = Vector2.new(0, 0)}
	local Tween = TweenService:Create(KioskScrollMenu, Up, TweenGoal)
	Tween:Play()
end

-- Function to filter items based on a search query.
function KioskMenu:SearchMenu(Query)
	local FilteredItems = {}
	for TabName, Items in pairs(self.Tabs) do
		FilteredItems[TabName] = {}
		for _, Item in ipairs(Items) do
			if string.find(Item.Name:lower(), Query:lower()) then
				table.insert(FilteredItems[TabName], Item)
			end
		end
	end
	return FilteredItems
end

-- Updates the displayed menu based on the search query.
function KioskMenu:UpdateMenuBasedOnSearch(Query)
	local FilteredItems = self:SearchMenu(Query)

	-- Remove current items from the display.
	for _, Child in ipairs(KioskScrollMenu:GetChildren()) do
		if Child:IsA("Frame") then
			Child:Destroy()
		end
	end

	-- Update tabs with the filtered items and reload the menu.
	self.Tabs = FilteredItems
	self:LoadMenuContents()
end

-- Checks for text change in the search bar and updates the menu.
KioskSearchBar.SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
	local SearchQuery = KioskSearchBar.SearchBar.Text
	if SearchQuery == "" then
		KioskMenu.Tabs = OriginalTabs 
		KioskMenu:LoadMenuContents() 
	else
		KioskMenu:UpdateMenuBasedOnSearch(SearchQuery) 
	end
end)

-- Main function to load the menu contents based on the current search and tab.
function KioskMenu:LoadMenuContents()
	-- Define the tab order for the menu.
	local TabOrder = {"   🥞 Breakfast", "   🍹 Drinks", "   🍟 Snacks", "   🍰 Desserts", "   💥 Combos", "   🍲 Soups", "   🔮 Specials"}

	-- Guard clause for missing UI elements.
	if not MenuSubSection or not MenuContent or not KioskScrollMenu then
		warn("UI elements not properly defined!")
		return
	end

	-- Clear previous menu items.
	self:ClearMenuItems()

	-- Load the selected tab's items at the top.
	self:LoadSelectedTab()

	-- Create headers for each tab and add click functionality.
	self:CreateTabHeaders(TabOrder)

	-- Load contents for each tab, allowing pagination.
	self:LoadTabContents(TabOrder)
end

-- Clears all items from the current menu.
function KioskMenu:ClearMenuItems()
	for _, Child in ipairs(KioskScrollMenu:GetChildren()) do
		if Child:IsA("Frame") then
			Child:Destroy()
		end
	end
end

-- Loads the content of the currently selected tab.
function KioskMenu:LoadSelectedTab()
	if KioskMenu.CurrentlySelectedHeader then
		local SelectedTab = KioskMenu.CurrentlySelectedHeader
		local Items = self.Tabs[SelectedTab]
		if Items and #Items > 0 then
			local SubSection = MenuSubSection:Clone()
			SubSection.Name = SelectedTab
			SubSection:WaitForChild("TitleName").Text = SelectedTab:match("^%s*(.-)%s*$")
			SubSection.Parent = KioskScrollMenu
		end
	end
end

-- Creates headers for the tabs in the menu.
function KioskMenu:CreateTabHeaders(TabOrder)
	for _, TabName in ipairs(TabOrder) do
		local Header = KioskScrollHeaders:FindFirstChild(TabName)
		if not Header then
			Header = self:CloneTabHeader(TabName)
		end
	end
end

-- Clones and sets up a new tab header with click functionality.
function KioskMenu:CloneTabHeader(TabName)
	local Header = KioskHeader:Clone()
	Header.Name = TabName
	Header.Text = TabName
	Header.Parent = KioskScrollHeaders

	local Gradient = KioskHeader.Parent:FindFirstChild("UIGradient")

	Header:WaitForChild("Buttom").MouseButton1Click:Connect(function()
		self:SelectTab(TabName, Gradient)
	end)

	return Header
end

-- Handles the logic when a tab is selected.
function KioskMenu:SelectTab(TabName, Gradient)
	if KioskMenu.CurrentlySelectedHeader == TabName then return end
	self:ReloadTab(TabName, Gradient)
end

-- Reloads a tab's content when it is selected.
function KioskMenu:ReloadTab(TabName, Gradient)
	-- Reset UI and prepare for the new tab.
	KioskMenu.CurrentlySelectedHeader = TabName
	KioskMenu.CurrentPages[TabName] = 1
	self:LoadMenuContents()

	-- Make sure Header exists
	local Header = KioskScrollHeaders:FindFirstChild(TabName)
	if not Header then
		warn("Header not found for Tab: " .. TabName)
		return
	end

	-- Remove old gradients and apply a new one.
	for _, i in KioskScrollHeaders:GetDescendants() do
		if i:IsA("UIGradient") then
			local FadeTween = TweenService:Create(i.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
			FadeTween:Play()
			i:Destroy()
		end
	end

	if Gradient then
		local Gradientc = Gradient:Clone()
		Gradientc.Parent = Header
		local TweenTras = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local TransparencyTween = TweenService:Create(Header, TweenTras, {BackgroundTransparency = 0.91})
		TransparencyTween:Play()
	else
		warn("No gradient provided!")
	end

	self:ScrollToTop()
end


-- Loads the content for each tab with pagination.
function KioskMenu:LoadTabContents(TabOrder)
	for _, TabName in ipairs(TabOrder) do
		local Items = self.Tabs[TabName]
		if Items and #Items > 0 then
			self:DisplayTabContents(TabName, Items)
		end
	end
end

-- Displays the contents of a specific tab with pagination.
function KioskMenu:DisplayTabContents(TabName, Items)
	local Page = self.CurrentPages[TabName] or 1
	local StartIndex = (Page - 1) * MaxContentsPerPage + 1
	local EndIndex = math.min(StartIndex + MaxContentsPerPage - 1, #Items)

	local SubSection = KioskScrollMenu:FindFirstChild(TabName)
	if not SubSection then
		SubSection = MenuSubSection:Clone()
		SubSection.Name = TabName
		SubSection:WaitForChild("TitleName").Text = TabName:match("^%s*(.-)%s*$")
		SubSection.Parent = KioskScrollMenu
	end

	local ContentsFrame = SubSection:WaitForChild("SubSectionContents")
	self:ClearUIListLayout(ContentsFrame)

	-- Add buttons for pagination.
	self:SetupPaginationButtons(SubSection)

	-- Load the items for the current page.
	self:DisplayItemsOnPage(ContentsFrame, Items, StartIndex, EndIndex)
end

-- Clears the UIListLayout inside a frame.
function KioskMenu:ClearUIListLayout(ContentsFrame)
	for _, child in ipairs(ContentsFrame:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end
end

-- Sets up the pagination buttons.
function KioskMenu:SetupPaginationButtons(SubSection)
	local BackButton = SubSection:WaitForChild("Back")
	local ForwardButton = SubSection:WaitForChild("Forward")

	BackButton.MouseButton1Click:Connect(function()
		self:ChangePage(-1, SubSection.Name)
	end)

	ForwardButton.MouseButton1Click:Connect(function()
		self:ChangePage(1, SubSection.Name)
	end)
end

-- Changes the current page and reloads the tab.
function KioskMenu:ChangePage(Direction, TabName)
	if Debounce then return end
	Debounce = true

	local CurrentPage = KioskMenu.CurrentPages[TabName] or 1
	local TotalPages = math.ceil(#KioskMenu.Tabs[TabName] / MaxContentsPerPage)

	if (Direction == -1 and CurrentPage > 1) or (Direction == 1 and CurrentPage < TotalPages) then
		KioskMenu.CurrentPages[TabName] = CurrentPage + Direction
		self:LoadMenuContents()
	else
		print(Direction == -1 and "You are already on the first page!" or "You are already on the last page!")
	end

	wait(0.3)
	Debounce = false
end

-- Displays the items for the current page.
function KioskMenu:DisplayItemsOnPage(ContentsFrame, Items, StartIndex, EndIndex)
	for i = StartIndex, EndIndex do
		local Item = Items[i]
		if Item then
			local NewContent = MenuContent:Clone()
			NewContent.Name = Item.Name
			NewContent:WaitForChild("ContentName").Text = Item.Name
			NewContent:WaitForChild("ContentPrice").Text = Currency .. tostring(Item.Price)
			NewContent.Parent = ContentsFrame
			self:DisplayItemImage(NewContent, Item)
			self:SetupItemButton(NewContent, Item)
		end
	end
end

-- Displays the image for a menu item.
function KioskMenu:DisplayItemImage(NewContent, Item)
	if Item.Image then
		local ImageLabel = NewContent:WaitForChild("Contents")
		ImageLabel.Image = Item.Image
		ImageLabel.ImageColor3 = ImageColour
	end
end

-- Sets up the button hover effects and quick add functionality.
function KioskMenu:SetupItemButton(NewContent, Item)
	local Button = NewContent:WaitForChild("Buttom")
	Button.MouseEnter:Connect(function()
		self:AnimateButton(Button, 0.5)
		NewContent.QuickAdd.Visible = true
		self:AnimateFrame(NewContent.QuickAdd, {Size = UDim2.new(0.112, 0, 0.127, 0)}, 0.2)
	end)

	Button.MouseLeave:Connect(function()
		self:AnimateButton(Button, 1)
		self:AnimateFrame(NewContent.QuickAdd, {Size = UDim2.new(0, 0, 0, 0)}, 0.2)
		wait(0.2)
		NewContent.QuickAdd.Visible = false
	end)
end

-- Animates the button on hover.
function KioskMenu:AnimateButton(Button, Transparency)
	local tween = TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = Transparency})
	tween:Play()
end



KioskMenu:LoadMenuContents()

return KioskMenu

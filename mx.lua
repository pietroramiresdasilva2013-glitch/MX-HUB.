--[[
███████╗██╗   ██╗██╗██╗         █████╗ ██╗  ██╗███████╗
██╔════╝██║   ██║██║██║        ██╔══██╗╚██╗██╔╝██╔════╝
█████╗  ██║   ██║██║██║        ███████║ ╚███╔╝ █████╗
██╔══╝  ╚██╗ ██╔╝██║██║        ██╔══██║ ██╔██╗ ██╔══╝
███████╗ ╚████╔╝ ██║███████╗   ██║  ██║██╔╝ ██╗███████╗
╚══════╝  ╚═══╝  ╚═╝╚══════╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

        STUDIOS V2 OBFUSCATOR By MAX
        https://eaxe.net

        Sponsored by
        https://BloxDen.com
--]]

local v = game:GetService("Players");
local A = game:GetService("RunService");
local c = game:GetService("UserInputService");
local h = game:GetService("TweenService");
local q = game:GetService("CoreGui");
local n = game:GetService("Lighting");
local o = game:GetService("TeleportService");
local g = game:GetService("StarterGui");
local p = game:GetService("HttpService");
local V = game:GetService("ReplicatedStorage");
local D = v.LocalPlayer;
local m = workspace.CurrentCamera;
local K = {
		Title = "\194\182 MX HUB \194\182",
		Version = "v10.0",
		IconId = "rbxassetid://106023300176700",
		Green = Color3.fromRGB(0, 255, 127),
		GreenDark = Color3.fromRGB(0, 200, 90),
		GreenLight = Color3.fromRGB(150, 255, 200),
		BgMain = Color3.fromRGB(15, 25, 18),
		BgSecondary = Color3.fromRGB(22, 35, 26),
		BgTertiary = Color3.fromRGB(30, 48, 36),
		BgHover = Color3.fromRGB(42, 65, 50),
		Text = Color3.fromRGB(230, 255, 240),
		TextDim = Color3.fromRGB(150, 200, 170),
		Black = Color3.fromRGB(0, 0, 0),
		Font = Enum.Font.GothamMedium,
		FontBold = Enum.Font.GothamBold,
		FontSemi = Enum.Font.GothamSemibold,
	};
local j = {
		Gui = nil,
		Main = nil,
		ToggleBtn = nil,
		IsOpen = true,
		ActiveTab = nil,
		Tabs = {},
		Toggles = {},
		Flags = {},
		Loops = {},
	};
local function S(v, A)
	local c = Instance.new(v);
	for v, A in pairs(A or {}) do
		c[v] = A;
	end;
	return c;
end;
local function w(v, A)
	return S("UICorner", { Parent = v, CornerRadius = UDim.new(0, A or 8) });
end;
local function B(v, A, c, h)
	return S("UIStroke", {
		Parent = v,
		Color = A or K.Green,
		Thickness = c or 1,
		Transparency = h or .3,
	});
end;
local function i()
	local v, A = pcall(function()
			return gethui();
		end);
	if v and A then
		return A;
	end;
	return q;
end;
pcall(function()
	local v = q:FindFirstChild("MXHub");
	if v then
		v:Destroy();
	end;
end);
pcall(function()
	if gethui then
		local v = (gethui()):FindFirstChild("MXHub");
		if v then
			v:Destroy();
		end;
	end;
end);
local O = S("ScreenGui", {
		Name = "MXHub",
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 999,
	});
O.Parent = i();
j.Gui = O;
local k = S("TextButton", {
		Name = "IconToggle",
		Parent = O,
		Size = UDim2.new(0, 58, 0, 58),
		Position = UDim2.new(0, 20, .5, -29),
		BackgroundColor3 = K.BgMain,
		Text = "",
		AutoButtonColor = false,
		Active = true,
		ZIndex = 100,
	});
w(k, 29);
B(k, K.Green, 2, 0);
S("ImageLabel", {
	Parent = k,
	Size = UDim2.new(0, 46, 0, 46),
	Position = UDim2.new(.5, -23, .5, -23),
	BackgroundTransparency = 1,
	Image = K.IconId,
	ScaleType = Enum.ScaleType.Fit,
	ZIndex = 101,
});
local T = S("ImageLabel", {
		Parent = O,
		Size = UDim2.new(0, 90, 0, 90),
		Position = UDim2.new(0, 4, .5, -45),
		BackgroundTransparency = 1,
		Image = "rbxassetid://5028857084",
		ImageColor3 = K.Green,
		ImageTransparency = .7,
		ZIndex = 99,
	});
j.ToggleBtn = k;
task.spawn(function()
	while k.Parent do
		(h:Create(T, TweenInfo.new(1.5, Enum.EasingStyle.Sine), { Size = UDim2.new(0, 100, 0, 100), Position = UDim2.new(0, -1, .5, -50), ImageTransparency = .9 })):Play();
		task.wait(1.5);
		(h:Create(T, TweenInfo.new(1.5, Enum.EasingStyle.Sine), { Size = UDim2.new(0, 90, 0, 90), Position = UDim2.new(0, 4, .5, -45), ImageTransparency = .7 })):Play();
		task.wait(1.5);
	end;
end);
local l = S("Frame", {
		Name = "MainPanel",
		Parent = O,
		Size = UDim2.new(0, 560, 0, 380),
		Position = UDim2.new(.5, -280, .5, -190),
		BackgroundColor3 = K.BgMain,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Active = true,
		ZIndex = 50,
	});
w(l, 14);
B(l, K.Green, 1.5, .2);
j.Main = l;
local b = S("Frame", {
		Name = "TopBar",
		Parent = l,
		Size = UDim2.new(1, 0, 0, 46),
		BackgroundColor3 = K.BgSecondary,
		BorderSizePixel = 0,
		ZIndex = 51,
	});
w(b, 14);
S("Frame", {
	Parent = b,
	Size = UDim2.new(1, 0, 0, 14),
	Position = UDim2.new(0, 0, 1, -14),
	BackgroundColor3 = K.BgSecondary,
	BorderSizePixel = 0,
	ZIndex = 51,
});
S("ImageLabel", {
	Parent = b,
	Size = UDim2.new(0, 30, 0, 30),
	Position = UDim2.new(0, 12, .5, -15),
	BackgroundTransparency = 1,
	Image = K.IconId,
	ScaleType = Enum.ScaleType.Fit,
	ZIndex = 52,
});
local J = S("TextLabel", {
		Parent = b,
		Size = UDim2.new(1, -220, 1, 0),
		Position = UDim2.new(0, 50, 0, 0),
		BackgroundTransparency = 1,
		Text = K.Title,
		TextColor3 = K.Green,
		Font = K.FontBold,
		TextSize = 17,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 52,
	});
S("TextLabel", {
	Parent = b,
	Size = UDim2.new(0, 60, 1, 0),
	Position = UDim2.new(1, -170, 0, 0),
	BackgroundTransparency = 1,
	Text = K.Version,
	TextColor3 = K.TextDim,
	Font = K.FontSemi,
	TextSize = 12,
	TextXAlignment = Enum.TextXAlignment.Right,
	ZIndex = 52,
});
local U = S("TextButton", {
		Parent = b,
		Size = UDim2.new(0, 30, 0, 30),
		Position = UDim2.new(1, -108, .5, -15),
		BackgroundColor3 = K.BgTertiary,
		Text = "\226\128\148",
		TextColor3 = K.Text,
		Font = K.FontBold,
		TextSize = 18,
		AutoButtonColor = false,
		ZIndex = 53,
	});
w(U, 8);
local Y = S("TextButton", {
		Parent = b,
		Size = UDim2.new(0, 30, 0, 30),
		Position = UDim2.new(1, -70, .5, -15),
		BackgroundColor3 = K.GreenDark,
		Text = "\226\156\149",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Font = K.FontBold,
		TextSize = 14,
		AutoButtonColor = false,
		ZIndex = 53,
	});
w(Y, 8);
local function Q(v, A, c)
	v.MouseEnter:Connect(function()
		(h:Create(v, TweenInfo.new(.15), { BackgroundColor3 = c })):Play();
	end);
	v.MouseLeave:Connect(function()
		(h:Create(v, TweenInfo.new(.15), { BackgroundColor3 = A })):Play();
	end);
end;
Q(U, K.BgTertiary, K.BgHover);
Q(Y, K.GreenDark, Color3.fromRGB(0, 255, 120));
local t = S("Frame", {
		Name = "Sidebar",
		Parent = l,
		Size = UDim2.new(0, 145, 1, -58),
		Position = UDim2.new(0, 8, 0, 52),
		BackgroundColor3 = K.BgSecondary,
		BorderSizePixel = 0,
		ZIndex = 51,
	});
w(t, 10);
local N = S("ScrollingFrame", {
		Parent = t,
		Size = UDim2.new(1, 0, 1, -28),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = K.Green,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
	});
S("UIListLayout", { Parent = N, Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder });
S("UIPadding", {
	Parent = N,
	PaddingTop = UDim.new(0, 8),
	PaddingLeft = UDim.new(0, 8),
	PaddingRight = UDim.new(0, 8),
});
S("TextLabel", {
	Parent = t,
	Size = UDim2.new(1, -16, 0, 20),
	Position = UDim2.new(0, 8, 1, -26),
	BackgroundTransparency = 1,
	Text = "by MX Hub",
	TextColor3 = K.GreenDark,
	Font = K.FontSemi,
	TextSize = 10,
	ZIndex = 52,
});
local G = S("Frame", {
		Name = "Content",
		Parent = l,
		Size = UDim2.new(1, -169, 1, -58),
		Position = UDim2.new(0, 161, 0, 52),
		BackgroundColor3 = K.BgSecondary,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 51,
	});
w(G, 10);
local F = {};
j.Tabs = F;
local function Z(v, A)
	if F[v] then
		return F[v];
	end;
	local c = S("TextButton", {
			Parent = N,
			Size = UDim2.new(1, 0, 0, 32),
			BackgroundColor3 = K.BgTertiary,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 52,
		});
	w(c, 8);
	local q = S("Frame", {
			Parent = c,
			Size = UDim2.new(0, 3, .6, 0),
			Position = UDim2.new(0, 0, .5, 0),
			AnchorPoint = Vector2.new(0, .5),
			BackgroundColor3 = K.Green,
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 53,
		});
	w(q, 2);
	local n = S("TextLabel", {
			Parent = c,
			Size = UDim2.new(1, -20, 1, 0),
			Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1,
			Text = ((A or "\226\156\166")) .. ("  " .. v),
			TextColor3 = K.Text,
			Font = K.FontSemi,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 53,
		});
	local o = S("ScrollingFrame", {
			Parent = G,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 4,
			ScrollBarImageColor3 = K.Green,
			ScrollBarImageTransparency = .2,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			Visible = false,
			ZIndex = 52,
		});
	S("UIListLayout", { Parent = o, Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder });
	S("UIPadding", {
		Parent = o,
		PaddingTop = UDim.new(0, 10),
		PaddingBottom = UDim.new(0, 20),
		PaddingLeft = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 10),
	});
	local g = {
			Button = c,
			Label = n,
			Content = o,
			Indicator = q,
			Name = v,
		};
	F[v] = g;
	c.MouseEnter:Connect(function()
		if j.ActiveTab ~= v then
			(h:Create(c, TweenInfo.new(.15), { BackgroundColor3 = K.BgHover })):Play();
		end;
	end);
	c.MouseLeave:Connect(function()
		if j.ActiveTab ~= v then
			(h:Create(c, TweenInfo.new(.15), { BackgroundColor3 = K.BgTertiary })):Play();
		end;
	end);
	c.MouseButton1Click:Connect(function()
		for v, A in pairs(F) do
			A.Content.Visible = false;
			A.Indicator.Visible = false;
			(h:Create(A.Button, TweenInfo.new(.2), { BackgroundColor3 = K.BgTertiary })):Play();
			(h:Create(A.Label, TweenInfo.new(.2), { TextColor3 = K.Text })):Play();
		end;
		o.Visible = true;
		q.Visible = true;
		(h:Create(c, TweenInfo.new(.2), { BackgroundColor3 = K.BgHover })):Play();
		(h:Create(n, TweenInfo.new(.2), { TextColor3 = K.Green })):Play();
		j.ActiveTab = v;
	end);
	return g;
end;
local function L(v, A)
	S("TextLabel", {
		Parent = v.Content,
		Size = UDim2.new(1, 0, 0, 24),
		BackgroundTransparency = 1,
		Text = "\226\156\166 " .. A,
		TextColor3 = K.Green,
		Font = K.FontBold,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
	});
	S("Frame", {
		Parent = v.Content,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = K.Green,
		BackgroundTransparency = .7,
		BorderSizePixel = 0,
	});
end;
local function d(v, A, c)
	local q = S("TextButton", {
			Parent = v.Content,
			Size = UDim2.new(1, 0, 0, 32),
			BackgroundColor3 = K.BgTertiary,
			Text = A,
			TextColor3 = K.Text,
			Font = K.FontSemi,
			TextSize = 12,
			AutoButtonColor = false,
		});
	w(q, 8);
	B(q, K.Green, 1, .6);
	q.MouseEnter:Connect(function()
		(h:Create(q, TweenInfo.new(.15), { BackgroundColor3 = K.BgHover })):Play();
	end);
	q.MouseLeave:Connect(function()
		(h:Create(q, TweenInfo.new(.15), { BackgroundColor3 = K.BgTertiary })):Play();
	end);
	q.MouseButton1Click:Connect(function()
		(h:Create(q, TweenInfo.new(.1), { BackgroundColor3 = K.Green })):Play();
		task.delay(.15, function()
			(h:Create(q, TweenInfo.new(.2), { BackgroundColor3 = K.BgTertiary })):Play();
		end);
		pcall(c);
	end);
	return q;
end;
local function I(v, A, c, q)
	local n = S("Frame", {
			Parent = v.Content,
			Size = UDim2.new(1, 0, 0, 34),
			BackgroundColor3 = K.BgTertiary,
			BorderSizePixel = 0,
		});
	w(n, 8);
	B(n, K.Green, 1, .6);
	S("TextLabel", {
		Parent = n,
		Size = UDim2.new(1, -80, 1, 0),
		Position = UDim2.new(0, 12, 0, 0),
		BackgroundTransparency = 1,
		Text = A,
		TextColor3 = K.Text,
		Font = K.FontSemi,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
	});
	local o = S("TextButton", {
			Parent = n,
			Size = UDim2.new(0, 44, 0, 20),
			Position = UDim2.new(1, -56, .5, -10),
			BackgroundColor3 = Color3.fromRGB(60, 70, 65),
			Text = "",
			AutoButtonColor = false,
		});
	w(o, 10);
	local g = S("Frame", {
			Parent = o,
			Size = UDim2.new(0, 16, 0, 16),
			Position = UDim2.new(0, 2, .5, -8),
			BackgroundColor3 = K.Text,
			BorderSizePixel = 0,
		});
	w(g, 8);
	local p = c or false;
	j.Toggles[A] = p;
	j.Flags[A] = p;
	local function V(v, c)
		p = v;
		j.Toggles[A] = v;
		j.Flags[A] = v;
		(h:Create(o, TweenInfo.new(.22), { BackgroundColor3 = v and K.GreenDark or Color3.fromRGB(60, 70, 65) })):Play();
		(h:Create(g, TweenInfo.new(.22), { Position = v and UDim2.new(1, -18, .5, -8) or UDim2.new(0, 2, .5, -8) })):Play();
		if c and q then
			task.spawn(function()
				pcall(q, v);
			end);
		end;
	end;
	o.MouseButton1Click:Connect(function()
		V(not p, true);
	end);
	V(p, false);
	return { Set = V, Get = function()
			return p;
		end };
end;
local function P(v, A, q, n, o, g)
	local p = S("Frame", {
			Parent = v.Content,
			Size = UDim2.new(1, 0, 0, 50),
			BackgroundColor3 = K.BgTertiary,
			BorderSizePixel = 0,
		});
	w(p, 8);
	B(p, K.Green, 1, .6);
	local V = S("TextLabel", {
			Parent = p,
			Size = UDim2.new(1, -20, 0, 20),
			Position = UDim2.new(0, 12, 0, 4),
			BackgroundTransparency = 1,
			Text = A .. (":  " .. tostring(o)),
			TextColor3 = K.Text,
			Font = K.FontSemi,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
		});
	local D = S("Frame", {
			Parent = p,
			Size = UDim2.new(1, -24, 0, 8),
			Position = UDim2.new(0, 12, 0, 32),
			BackgroundColor3 = Color3.fromRGB(60, 70, 65),
			BorderSizePixel = 0,
		});
	w(D, 4);
	local m = S("Frame", {
			Parent = D,
			Size = UDim2.new(((o - q)) / ((n - q)), 0, 1, 0),
			BackgroundColor3 = K.GreenDark,
			BorderSizePixel = 0,
		});
	w(m, 4);
	local j = S("Frame", {
			Parent = D,
			Size = UDim2.new(0, 14, 0, 14),
			Position = UDim2.new(((o - q)) / ((n - q)), -7, .5, -7),
			BackgroundColor3 = K.Green,
			BorderSizePixel = 0,
			ZIndex = 2,
		});
	w(j, 7);
	local i = o;
	local O = false;
	local function k(v, c)
		i = math.clamp(math.floor(v * 100 + .5) / 100, q, n);
		local o = ((i - q)) / ((n - q));
		V.Text = A .. (":  " .. tostring(i));
		(h:Create(m, TweenInfo.new(.1), { Size = UDim2.new(o, 0, 1, 0) })):Play();
		(h:Create(j, TweenInfo.new(.1), { Position = UDim2.new(o, -7, .5, -7) })):Play();
		if c and g then
			pcall(g, i);
		end;
	end;
	D.InputBegan:Connect(function(v)
		if v.UserInputType == Enum.UserInputType.MouseButton1 or v.UserInputType == Enum.UserInputType.Touch then
			O = true;
		end;
	end);
	c.InputEnded:Connect(function(v)
		if v.UserInputType == Enum.UserInputType.MouseButton1 or v.UserInputType == Enum.UserInputType.Touch then
			O = false;
		end;
	end);
	c.InputChanged:Connect(function(v)
		if O and ((v.UserInputType == Enum.UserInputType.MouseMovement or v.UserInputType == Enum.UserInputType.Touch)) then
			local A = v.Position.X - D.AbsolutePosition.X;
			local c = math.clamp(A / D.AbsoluteSize.X, 0, 1);
			k(q + ((n - q)) * c, true);
		end;
	end);
	return { Set = k, Get = function()
			return i;
		end };
end;
local function r(v, A)
	return S("TextLabel", {
		Parent = v.Content,
		Size = UDim2.new(1, 0, 0, 20),
		BackgroundTransparency = 1,
		Text = A,
		TextColor3 = K.TextDim,
		Font = K.Font,
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = true,
	});
end;
local function M(v, A, c)
	local h = S("TextBox", {
			Parent = v.Content,
			Size = UDim2.new(1, 0, 0, 32),
			BackgroundColor3 = K.BgTertiary,
			Text = "",
			PlaceholderText = A,
			PlaceholderColor3 = K.TextDim,
			TextColor3 = K.Text,
			Font = K.Font,
			TextSize = 12,
			ClearTextOnFocus = false,
		});
	w(h, 8);
	B(h, K.Green, 1, .6);
	h.FocusLost:Connect(function(v)
		if v and c then
			pcall(c, h.Text);
		end;
	end);
	return h;
end;
local function u(v, A)
	local c = S("Frame", {
			Parent = O,
			Size = UDim2.new(0, 270, 0, 44),
			Position = UDim2.new(.5, -135, 0, -60),
			BackgroundColor3 = K.BgMain,
			BorderSizePixel = 0,
			ZIndex = 300,
		});
	w(c, 10);
	B(c, K.Green, 1.5, 0);
	S("ImageLabel", {
		Parent = c,
		Size = UDim2.new(0, 28, 0, 28),
		Position = UDim2.new(0, 10, .5, -14),
		BackgroundTransparency = 1,
		Image = K.IconId,
		ScaleType = Enum.ScaleType.Fit,
	});
	S("TextLabel", {
		Parent = c,
		Size = UDim2.new(1, -50, 1, 0),
		Position = UDim2.new(0, 46, 0, 0),
		BackgroundTransparency = 1,
		Text = v,
		TextColor3 = K.Text,
		Font = K.FontSemi,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = true,
	});
	(h:Create(c, TweenInfo.new(.3, Enum.EasingStyle.Back), { Position = UDim2.new(.5, -135, 0, 90) })):Play();
	task.delay(A or 3, function()
		local v = h:Create(c, TweenInfo.new(.3), { Position = UDim2.new(.5, -135, 0, -60) });
		v:Play();
		v.Completed:Wait();
		c:Destroy();
	end);
end;
local function s(v, A)
	A = A or v;
	local h, q, n, o;
	A.InputBegan:Connect(function(A)
		if A.UserInputType == Enum.UserInputType.MouseButton1 or A.UserInputType == Enum.UserInputType.Touch then
			h = true;
			n = A.Position;
			o = v.Position;
			A.Changed:Connect(function()
				if A.UserInputState == Enum.UserInputState.End then
					h = false;
				end;
			end);
		end;
	end);
	A.InputChanged:Connect(function(v)
		if v.UserInputType == Enum.UserInputType.MouseMovement or v.UserInputType == Enum.UserInputType.Touch then
			q = v;
		end;
	end);
	c.InputChanged:Connect(function(A)
		if A == q and h then
			local c = A.Position - n;
			v.Position = UDim2.new(o.X.Scale, o.X.Offset + c.X, o.Y.Scale, o.Y.Offset + c.Y);
		end;
	end);
end;
s(l, b);
s(k);
local function X()
	j.IsOpen = not j.IsOpen;
	if j.IsOpen then
		l.Visible = true;
		l.Size = UDim2.new(0, 0, 0, 0);
		(h:Create(l, TweenInfo.new(.35, Enum.EasingStyle.Back), { Size = UDim2.new(0, 560, 0, 380) })):Play();
	else
		local v = h:Create(l, TweenInfo.new(.25), { Size = UDim2.new(0, 0, 0, 0) });
		v:Play();
		v.Completed:Wait();
		l.Visible = false;
	end;
end;
k.MouseButton1Click:Connect(X);
U.MouseButton1Click:Connect(X);
Y.MouseButton1Click:Connect(function()
	O:Destroy();
end);
local C = Z("Home", "\240\159\143\160");
local W = Z("Jogador", "\240\159\145\164");
local x = Z("Visual", "\240\159\145\129");
local a = Z("Troll", "\240\159\152\136");
local y = Z("RGB", "\240\159\140\136");
local R = Z("M\195\186sica", "\240\159\142\181");
local e = Z("Prote\195\167\195\163o", "\240\159\155\161");
local E = Z("Players", "\240\159\145\165");
local H = Z("Ve\195\173culos", "\240\159\154\151");
local z = Z("Mundo", "\240\159\140\141");
local f = Z("Extras", "\226\156\168");
local v6 = Z("Config", "\226\154\153");
task.defer(function()
	for v, A in pairs(F) do
		A.Content.Visible = false;
		A.Indicator.Visible = false;
		A.Button.BackgroundColor3 = K.BgTertiary;
		A.Label.TextColor3 = K.Text;
	end;
	C.Content.Visible = true;
	C.Indicator.Visible = true;
	C.Button.BackgroundColor3 = K.BgHover;
	C.Label.TextColor3 = K.Green;
	j.ActiveTab = "Home";
end);
L(C, "Bem-vindo ao MX Hub");
r(C, "\226\156\166 Hub profissional Green Edition");
r(C, "\226\156\166 Compat\195\173vel com Delta Mobile");
r(C, "\226\156\166 Brookhaven RP suportado");
L(C, "A\195\167\195\181es R\195\161pidas");
d(C, "\240\159\140\191 Notifica\195\167\195\163o de Teste", function()
	u("MX Hub carregado!");
end);
d(C, "\240\159\146\154 Resetar Personagem", function()
	if D.Character then
		D.Character:BreakJoints();
		u("Resetado");
	end;
end);
d(C, "\240\159\148\132 Rejoin (Reentrar)", function()
	o:Teleport(game.PlaceId, D);
end);
L(W, "Movimento");
P(W, "WalkSpeed", 16, 300, 16, function(v)
	local A = D.Character;
	if A and A:FindFirstChildOfClass("Humanoid") then
		(A:FindFirstChildOfClass("Humanoid")).WalkSpeed = v;
	end;
end);
P(W, "JumpPower", 50, 500, 50, function(v)
	local A = D.Character;
	if A and A:FindFirstChildOfClass("Humanoid") then
		local c = A:FindFirstChildOfClass("Humanoid");
		c.UseJumpPower = true;
		c.JumpPower = v;
	end;
end);
L(W, "Caracter\195\173sticas");
I(W, "Infinite Jump", false, function(v)
	if v then
		j.Flags.InfiniteJump = c.JumpRequest:Connect(function()
				local v = D.Character;
				if v and v:FindFirstChildOfClass("Humanoid") then
					(v:FindFirstChildOfClass("Humanoid")):ChangeState("Jumping");
				end;
			end);
		u("Infinite Jump ON");
	else
		if j.Flags.InfiniteJump then
			j.Flags.InfiniteJump:Disconnect();
			j.Flags.InfiniteJump = nil;
		end;
		u("Infinite Jump OFF");
	end;
end);
I(W, "Noclip", false, function(v)
	j.Flags.Noclip = v;
	u("Noclip " .. ((v and "ON" or "OFF")));
end);
task.spawn(function()
	A.Stepped:Connect(function()
		if j.Flags.Noclip and D.Character then
			for v, A in ipairs(D.Character:GetDescendants()) do
				if A:IsA("BasePart") and A.CanCollide then
					A.CanCollide = false;
				end;
			end;
		end;
	end);
end);
L(x, "Ilumina\195\167\195\163o");
I(x, "Fullbright", false, function(v)
	if v then
		j.Flags.OldBrightness = n.Brightness;
		j.Flags.OldFogEnd = n.FogEnd;
		j.Flags.OldClockTime = n.ClockTime;
		n.Brightness = 3;
		n.ClockTime = 14;
		n.FogEnd = 100000;
		n.GlobalShadows = false;
		u("Fullbright ON");
	else
		n.Brightness = j.Flags.OldBrightness or 1;
		n.FogEnd = j.Flags.OldFogEnd or 1000;
		n.ClockTime = j.Flags.OldClockTime or 14;
		n.GlobalShadows = true;
		u("Fullbright OFF");
	end;
end);
local A6 = { Text = nil, Color = nil };
task.spawn(function()
	local v = V:WaitForChild("RE", 5);
	if not v then
		return;
	end;
	A6.Text = v:WaitForChild("1RPNam1eTex1t", 5);
	A6.Color = v:WaitForChild("1RPNam1eColo1r", 5);
end);
local function c6(v)
	if not A6.Text then
		return false;
	end;
	pcall(function()
		A6.Text:FireServer("RolePlayName", v);
	end);
	return true;
end;
local function h6(v)
	if not A6.Text then
		return false;
	end;
	pcall(function()
		A6.Text:FireServer("RolePlayBio", v);
	end);
	return true;
end;
local function q6(v)
	if not A6.Color then
		return false;
	end;
	pcall(function()
		A6.Color:FireServer("PickingRPNameColor", v);
	end);
	return true;
end;
local function n6(v)
	if not A6.Color then
		return false;
	end;
	pcall(function()
		A6.Color:FireServer("PickingRPBioColor", v);
	end);
	return true;
end;
local o6 = "Usu\195\161rio / MX HUB";
local g6 = "HUB ainda em Beta";
task.spawn(function()
	task.wait(.7);
	c6(o6);
	task.wait(.1);
	q6(K.Green);
	task.wait(.2);
	h6(g6);
	task.wait(.1);
	n6(K.Black);
	u("Nome + Bio aplicados \226\156\166");
end);
D.CharacterAdded:Connect(function()
	task.wait(.7);
	c6(o6);
	task.wait(.1);
	q6(K.Green);
	task.wait(.2);
	h6(g6);
	task.wait(.1);
	n6(K.Black);
end);
L(a, "Nome RP \226\128\148 Brookhaven");
d(a, "\240\159\146\154 Aplicar Nome Padr\195\163o", function()
	c6(o6);
	q6(K.Green);
	u("Nome aplicado!");
end);
d(a, "\240\159\150\164 Aplicar Bio Padr\195\163o", function()
	h6(g6);
	n6(K.Black);
	u("Bio aplicada!");
end);
L(a, "Nome Personalizado");
local p6 = M(a, "Digite o novo nome RP...");
d(a, "\226\156\148 Aplicar Nome", function()
	if p6.Text ~= "" then
		c6(p6.Text);
		u("Nome: " .. p6.Text);
	else
		u("Digite um nome primeiro!");
	end;
end);
L(a, "Bio Personalizada");
local V6 = M(a, "Digite a nova bio...");
d(a, "\226\156\148 Aplicar Bio", function()
	if V6.Text ~= "" then
		h6(V6.Text);
		u("Bio: " .. V6.Text);
	else
		u("Digite uma bio primeiro!");
	end;
end);
L(a, "Cores R\195\161pidas");
d(a, "\240\159\146\154 Verde (Nome)", function()
	q6(Color3.fromRGB(0, 255, 127));
	u("Cor verde aplicada");
end);
d(a, "\226\157\164\239\184\143 Vermelho (Nome)", function()
	q6(Color3.fromRGB(255, 0, 0));
	u("Cor vermelha aplicada");
end);
d(a, "\240\159\146\153 Azul (Nome)", function()
	q6(Color3.fromRGB(0, 150, 255));
	u("Cor azul aplicada");
end);
d(a, "\240\159\146\156 Roxo (Nome)", function()
	q6(Color3.fromRGB(180, 0, 255));
	u("Cor roxa aplicada");
end);
d(a, "\240\159\150\164 Preto (Bio)", function()
	n6(Color3.fromRGB(0, 0, 0));
	u("Bio preta aplicada");
end);
L(y, "Nome RGB \240\159\140\136");
r(y, "Deixa a cor do nome mudando em arco-\195\173ris");
I(y, "Nome RGB", false, function(v)
	j.Flags.RPNameRGB = v;
	if v then
		task.spawn(function()
			local v = 0;
			while j.Flags.RPNameRGB do
				v = ((v + .02)) % 1;
				q6(Color3.fromHSV(v, 1, 1));
				task.wait(.15);
			end;
		end);
		u("Nome RGB ON \240\159\140\136");
	else
		q6(K.Green);
		u("Nome RGB OFF");
	end;
end);
L(y, "Bio RGB \240\159\140\136");
r(y, "Deixa a cor da bio mudando em arco-\195\173ris");
I(y, "Bio RGB", false, function(v)
	j.Flags.RPBioRGB = v;
	if v then
		task.spawn(function()
			local v = 0;
			while j.Flags.RPBioRGB do
				v = ((v + .02)) % 1;
				n6(Color3.fromHSV(v, 1, 1));
				task.wait(.15);
			end;
		end);
		u("Bio RGB ON \240\159\140\136");
	else
		n6(K.Black);
		u("Bio RGB OFF");
	end;
end);
L(y, "Combinado \240\159\140\136\240\159\140\136");
I(y, "Nome + Bio RGB juntos", false, function(v)
	j.Flags.RPNameRGB = v;
	j.Flags.RPBioRGB = v;
	if v then
		task.spawn(function()
			local v = 0;
			while j.Flags.RPNameRGB or j.Flags.RPBioRGB do
				v = ((v + .02)) % 1;
				q6(Color3.fromHSV(v, 1, 1));
				n6(Color3.fromHSV(((v + .3)) % 1, 1, 1));
				task.wait(.15);
			end;
		end);
		u("Nome + Bio RGB ON \240\159\140\136");
	else
		q6(K.Green);
		n6(K.Black);
		u("Nome + Bio RGB OFF");
	end;
end);
L(y, "Resetar");
d(y, "\240\159\146\154 Nome Verde + Bio Preta", function()
	j.Flags.RPNameRGB = false;
	j.Flags.RPBioRGB = false;
	q6(K.Green);
	n6(K.Black);
	u("Cores resetadas");
end);
L(R, "\240\159\142\181 Player de M\195\186sica");
r(R, "Pega o Boombox e segura na m\195\163o");
r(R, "Cola o ID e clica em Tocar");
local D6 = nil;
task.spawn(function()
	local v = V:WaitForChild("RE", 10);
	if v then
		D6 = v:WaitForChild("PlayerToolEvent", 10);
	end;
end);
j.Flags.MusicPlaying = false;
local m6 = M(R, "Cole o ID da m\195\186sica aqui...");
d(R, "\226\150\182\239\184\143 Tocar M\195\186sica", function()
	local v = m6.Text;
	if v == "" then
		u("\226\154\160\239\184\143 Cole um ID primeiro!");
		return;
	end;
	if not D6 then
		u("\226\154\160\239\184\143 Remote n\195\163o carregou. Espera 2s");
		return;
	end;
	u("\226\150\182\239\184\143 Tocando em 0.3s...");
	task.delay(.3, function()
		pcall(function()
			D6:FireServer("ToolMusicText", tonumber(v) or v);
		end);
		j.Flags.MusicPlaying = true;
		u("\240\159\142\181 Tocando: " .. v);
	end);
end);
d(R, "\226\143\185 Parar M\195\186sica", function()
	if not D6 then
		u("\226\154\160\239\184\143 Remote n\195\163o carregou");
		return;
	end;
	task.delay(.3, function()
		pcall(function()
			D6:FireServer("ToolMusicStop");
		end);
		j.Flags.MusicPlaying = false;
		u("\226\143\185 M\195\186sica parada");
	end);
end);
d(R, "\240\159\148\132 Trocar M\195\186sica", function()
	local v = m6.Text;
	if v == "" then
		u("\226\154\160\239\184\143 Cole um ID!");
		return;
	end;
	if not D6 then
		u("\226\154\160\239\184\143 Remote n\195\163o carregou");
		return;
	end;
	pcall(function()
		D6:FireServer("ToolMusicStop");
	end);
	task.delay(.3, function()
		pcall(function()
			D6:FireServer("ToolMusicText", tonumber(v) or v);
		end);
		u("\240\159\142\181 Nova m\195\186sica: " .. v);
	end);
end);
L(R, "\240\159\142\181 IDs Populares");
d(R, "\240\159\142\181 Without Me", function()
	m6.Text = "1845732173";
	u("ID colado!");
end);
d(R, "\240\159\142\181 Old Town Road", function()
	m6.Text = "6939192127";
	u("ID colado!");
end);
d(R, "\240\159\142\181 Heat Waves", function()
	m6.Text = "6840131631";
	u("ID colado!");
end);
d(R, "\240\159\142\181 California Love", function()
	m6.Text = "1837879081";
	u("ID colado!");
end);
L(e, "Prote\195\167\195\181es");
I(e, "Anti Fling", false, function(v)
	j.Flags.AntiFling = v;
	u("Anti Fling " .. ((v and "ON" or "OFF")));
end);
task.spawn(function()
	A.Heartbeat:Connect(function()
		if j.Flags.AntiFling and D.Character then
			local v = D.Character:FindFirstChild("HumanoidRootPart");
			if v then
				for v, A in ipairs(v:GetChildren()) do
					if A:IsA("BodyVelocity") or A:IsA("BodyAngularVelocity") then
						pcall(function()
							A:Destroy();
						end);
					end;
				end;
			end;
		end;
	end);
end);
I(e, "Anti Sit", false, function(v)
	j.Flags.AntiSit = v;
	local A = D.Character;
	if not A then
		return;
	end;
	local c = A:FindFirstChildOfClass("Humanoid");
	if not c then
		return;
	end;
	if v then
		pcall(function()
			c:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
		end);
		u("Anti Sit ON");
	else
		pcall(function()
			c:SetStateEnabled(Enum.HumanoidStateType.Seated, true);
		end);
		u("Anti Sit OFF");
	end;
end);
I(e, "Anti Void", false, function(v)
	j.Flags.AntiVoid = v;
	u("Anti Void " .. ((v and "ON" or "OFF")));
end);
task.spawn(function()
	A.Heartbeat:Connect(function()
		if j.Flags.AntiVoid and D.Character then
			local v = D.Character:FindFirstChild("HumanoidRootPart");
			if v and v.Position.Y < -50 then
				v.CFrame = CFrame.new(-200, 25, 100);
			end;
		end;
	end);
end);
L(E, "Selecionar Jogador");
local K6 = nil;
local function j6()
	local A = {};
	for v, c in ipairs(v:GetPlayers()) do
		if c ~= D then
			table.insert(A, c.Name);
		end;
	end;
	if #A == 0 then
		table.insert(A, "Nenhum jogador");
	end;
	return A;
end;
local S6 = M(E, "Digite o nome do jogador...", function(v)
		if v ~= "" then
			K6 = v;
			u("Selecionado: " .. v);
		end;
	end);
d(E, "\240\159\147\139 Copiar Lista Completa", function()
	local v = j6();
	if setclipboard then
		setclipboard(table.concat(v, "\n"));
		u("Lista copiada! " .. (#v .. " jogadores"));
	end;
end);
L(E, "A\195\167\195\181es");
d(E, "\240\159\145\129 Spectate Player", function()
	if not K6 then
		u("\226\154\160\239\184\143 Selecione um jogador!");
		return;
	end;
	local A = v:FindFirstChild(K6);
	if A and A.Character then
		local v = A.Character:FindFirstChildOfClass("Humanoid");
		if v then
			workspace.CurrentCamera.CameraSubject = v;
			u("Assistindo " .. K6);
		end;
	else
		u("\226\157\140 Jogador n\195\163o encontrado");
	end;
end);
d(E, "\240\159\154\171 Parar de Assistir", function()
	local v = D.Character;
	if v then
		local A = v:FindFirstChildOfClass("Humanoid");
		if A then
			workspace.CurrentCamera.CameraSubject = A;
			u("Parou de assistir");
		end;
	end;
end);
d(E, "\226\157\132\239\184\143 Congelar Player", function()
	if not K6 then
		u("\226\154\160\239\184\143 Selecione um jogador!");
		return;
	end;
	local A = v:FindFirstChild(K6);
	if A and A.Character then
		local v = A.Character:FindFirstChild("HumanoidRootPart");
		if v then
			v.Anchored = true;
			u("Congelou " .. K6);
		end;
	end;
end);
d(E, "\240\159\148\165 Descongelar Player", function()
	if not K6 then
		u("\226\154\160\239\184\143 Selecione um jogador!");
		return;
	end;
	local A = v:FindFirstChild(K6);
	if A and A.Character then
		local v = A.Character:FindFirstChild("HumanoidRootPart");
		if v then
			v.Anchored = false;
			u("Descongelou " .. K6);
		end;
	end;
end);
I(E, "\240\159\140\128 Orbitar Player", false, function(c)
	if j.Flags.OrbitConn then
		j.Flags.OrbitConn:Disconnect();
		j.Flags.OrbitConn = nil;
	end;
	if c then
		if not K6 then
			u("\226\154\160\239\184\143 Selecione um jogador!");
			return;
		end;
		local c = v:FindFirstChild(K6);
		if not c or not c.Character then
			u("\226\157\140 N\195\163o achou");
			return;
		end;
		local h = c.Character:FindFirstChild("HumanoidRootPart");
		local q = D.Character and D.Character:FindFirstChild("HumanoidRootPart");
		if not h or not q then
			u("\226\157\140 Erro");
			return;
		end;
		local n = 0;
		j.Flags.OrbitConn = A.RenderStepped:Connect(function()
				if not ((c.Character and (c.Character:FindFirstChild("HumanoidRootPart") and q.Parent))) then
					if j.Flags.OrbitConn then
						j.Flags.OrbitConn:Disconnect();
						j.Flags.OrbitConn = nil;
					end;
					return;
				end;
				n = n + .05;
				local v = Vector3.new(math.cos(n) * 8, 3, math.sin(n) * 8);
				q.CFrame = CFrame.new(h.Position + v, h.Position);
			end);
		u("Orbitando " .. K6);
	else
		u("Orbit OFF");
	end;
end);
I(E, "\240\159\148\151 Seguir Player", false, function(c)
	if j.Flags.FollowConn then
		j.Flags.FollowConn:Disconnect();
		j.Flags.FollowConn = nil;
	end;
	if c then
		if not K6 then
			u("\226\154\160\239\184\143 Selecione um jogador!");
			return;
		end;
		local c = v:FindFirstChild(K6);
		if not c then
			u("\226\157\140 N\195\163o achou");
			return;
		end;
		local h = c.Character and c.Character:FindFirstChild("HumanoidRootPart");
		local q = D.Character and D.Character:FindFirstChild("HumanoidRootPart");
		if not h or not q then
			u("\226\157\140 Erro");
			return;
		end;
		j.Flags.FollowConn = A.RenderStepped:Connect(function()
				if not ((c.Character and (c.Character:FindFirstChild("HumanoidRootPart") and q.Parent))) then
					if j.Flags.FollowConn then
						j.Flags.FollowConn:Disconnect();
						j.Flags.FollowConn = nil;
					end;
					return;
				end;
				q.CFrame = CFrame.new(h.Position + Vector3.new(0, 3, 3));
			end);
		u("Seguindo " .. K6);
	else
		u("Seguir OFF");
	end;
end);
d(E, "\240\159\146\165 Fling Player", function()
	if not K6 then
		u("\226\154\160\239\184\143 Selecione um jogador!");
		return;
	end;
	local A = v:FindFirstChild(K6);
	if A and A.Character then
		local v = A.Character:FindFirstChild("HumanoidRootPart");
		if v then
			local A = Instance.new("BodyAngularVelocity");
			A.AngularVelocity = Vector3.new(0, 99999, 0);
			A.MaxTorque = Vector3.new(0, math.huge, 0);
			A.P = 1250;
			A.Parent = v;
			task.delay(1.5, function()
				if A then
					A:Destroy();
				end;
			end);
			u("Fling em " .. K6);
		end;
	end;
end);
d(E, "\240\159\146\165 Fling All (todos)", function()
	for v, A in ipairs(v:GetPlayers()) do
		if A ~= D and A.Character then
			local v = A.Character:FindFirstChild("HumanoidRootPart");
			if v then
				local A = Instance.new("BodyAngularVelocity");
				A.AngularVelocity = Vector3.new(0, 99999, 0);
				A.MaxTorque = Vector3.new(0, math.huge, 0);
				A.P = 1250;
				A.Parent = v;
				task.delay(1.5, function()
					if A then
						A:Destroy();
					end;
				end);
			end;
		end;
	end;
	u("Fling em todos! \240\159\146\165");
end);
L(H, "Meu Ve\195\173culo");
local w6 = nil;
d(H, "\240\159\154\151 Detectar Meu Carro", function()
	local v = D.Character;
	if not v then
		u("\226\157\140 Sem personagem");
		return;
	end;
	local A = v:FindFirstChild("HumanoidRootPart");
	if not A then
		return;
	end;
	local c = nil;
	local h = 30;
	for v, q in ipairs(workspace:GetDescendants()) do
		if q:IsA("Model") and q:FindFirstChildOfClass("VehicleSeat") then
			local v = (q:GetPivot()).Position;
			local n = ((v - A.Position)).Magnitude;
			if n < h then
				h = n;
				c = q;
			end;
		end;
	end;
	if c then
		w6 = c;
		u("Carro detectado: " .. c.Name);
	else
		u("\226\157\140 Nenhum carro perto");
	end;
end);
d(H, "\226\154\161 Turbo (velocidade m\195\161x)", function()
	if not w6 then
		u("\226\154\160\239\184\143 Detecta o carro primeiro!");
		return;
	end;
	for v, A in ipairs(w6:GetDescendants()) do
		if A:IsA("BasePart") then
			pcall(function()
				A.CustomPhysicalProperties = PhysicalProperties.new(.1, 100, .1, 100, 100);
			end);
		end;
	end;
	u("\226\154\161 Turbo ativado!");
end);
d(H, "\240\159\154\128 Pular com Carro", function()
	if not w6 then
		u("\226\154\160\239\184\143 Detecta o carro primeiro!");
		return;
	end;
	local v = w6:FindFirstChild("HumanoidRootPart") or w6.PrimaryPart;
	if v then
		local A = Instance.new("BodyVelocity");
		A.Velocity = Vector3.new(0, 150, 0);
		A.MaxForce = Vector3.new(0, math.huge, 0);
		A.Parent = v;
		task.delay(1, function()
			A:Destroy();
		end);
		u("\240\159\154\128 Pulo!");
	end;
end);
L(H, "Todos os Ve\195\173culos");
d(H, "\240\159\147\141 Trazer Todos os Carros", function()
	local v = D.Character and D.Character:FindFirstChild("HumanoidRootPart");
	if not v then
		return;
	end;
	local A = 0;
	for c, h in ipairs(workspace:GetDescendants()) do
		if h:IsA("Model") and h:FindFirstChildOfClass("VehicleSeat") then
			pcall(function()
				h:PivotTo(CFrame.new(v.Position + Vector3.new(math.random(-20, 20), 5, math.random(-20, 20))));
				A = A + 1;
			end);
		end;
	end;
	u("\240\159\147\141 " .. (A .. " carros puxados!"));
end);
d(H, "\240\159\146\165 Fling Todos os Carros", function()
	for v, A in ipairs(workspace:GetDescendants()) do
		if A:IsA("Model") and A:FindFirstChildOfClass("VehicleSeat") then
			local v = A.PrimaryPart;
			if v then
				pcall(function()
					local A = Instance.new("BodyVelocity");
					A.Velocity = Vector3.new(0, 500, 0);
					A.MaxForce = Vector3.new(0, math.huge, 0);
					A.Parent = v;
					task.delay(2, function()
						A:Destroy();
					end);
				end);
			end;
		end;
	end;
	u("\240\159\146\165 Carros voaram!");
end);
L(z, "Controle do Mundo");
P(z, "\240\159\140\158 Hor\195\161rio (0-24h)", 0, 24, 14, function(v)
	pcall(function()
		n.ClockTime = v;
	end);
end);
P(z, "\240\159\140\153 Brilho", 0, 5, 1, function(v)
	pcall(function()
		n.Brightness = v;
	end);
end);
L(z, "Efeitos Visuais");
I(z, "\240\159\140\171\239\184\143 N\195\169voa Zero", false, function(v)
	if v then
		j.Flags.OldFog = n.FogEnd;
		n.FogEnd = 100000;
	else
		n.FogEnd = j.Flags.OldFog or 1000;
	end;
end);
I(z, "\240\159\142\168 C\195\169u Verde Neon", false, function(v)
	if v then
		pcall(function()
			n.Ambient = Color3.fromRGB(30, 255, 30);
			n.OutdoorAmbient = Color3.fromRGB(20, 200, 20);
		end);
	else
		pcall(function()
			n.Ambient = Color3.fromRGB(70, 70, 70);
			n.OutdoorAmbient = Color3.fromRGB(128, 128, 128);
		end);
	end;
end);
L(z, "F\195\173sica");
P(z, "\240\159\140\141 Gravidade", 0, 300, 196, function(v)
	pcall(function()
		workspace.Gravity = v;
	end);
end);
d(z, "\240\159\140\153 Gravidade Lua", function()
	workspace.Gravity = 30;
	u("Gravidade Lua!");
end);
d(z, "\240\159\140\141 Gravidade Normal", function()
	workspace.Gravity = 196;
	u("Gravidade normal");
end);
d(z, "\240\159\154\171 Gravidade Zero", function()
	workspace.Gravity = 0;
	u("Gravidade Zero!");
end);
L(z, "Ambiente");
d(z, "\226\152\128\239\184\143 Meio-Dia", function()
	pcall(function()
		n.ClockTime = 12;
		n.Brightness = 3;
	end);
	u("\226\152\128\239\184\143 Meio-dia");
end);
d(z, "\240\159\140\153 Meia-Noite", function()
	pcall(function()
		n.ClockTime = 0;
		n.Brightness = .5;
	end);
	u("\240\159\140\153 Meia-noite");
end);
d(z, "\240\159\140\133 Amanhecer", function()
	pcall(function()
		n.ClockTime = 6;
		n.Brightness = 2;
	end);
	u("\240\159\140\133 Amanhecer");
end);
d(z, "\240\159\140\135 Entardecer", function()
	pcall(function()
		n.ClockTime = 18;
		n.Brightness = 2;
	end);
	u("\240\159\140\135 Entardecer");
end);
L(f, "Informa\195\167\195\181es");
d(f, "\240\159\147\139 Copiar ID do Jogo", function()
	if setclipboard then
		setclipboard(tostring(game.PlaceId));
		u("ID copiado: " .. game.PlaceId);
	end;
end);
d(f, "\240\159\148\151 Copiar Job ID", function()
	if setclipboard then
		setclipboard(game.JobId);
		u("Job ID copiado");
	end;
end);
d(f, "\240\159\145\165 Contar Jogadores", function()
	u("Online: " .. (#v:GetPlayers() .. " jogadores"));
end);
L(f, "Servidor");
d(f, "\240\159\154\128 Rejoin R\195\161pido", function()
	o:Teleport(game.PlaceId, D);
end);
L(v6, "Interface");
d(v6, "\240\159\146\154 Tema Verde (Padr\195\163o)", function()
	K.Green = Color3.fromRGB(0, 255, 127);
	K.GreenDark = Color3.fromRGB(0, 200, 90);
	J.TextColor3 = K.Green;
	u("Tema verde aplicado");
end);
d(v6, "\240\159\140\191 Tema Verde Neon", function()
	K.Green = Color3.fromRGB(57, 255, 20);
	K.GreenDark = Color3.fromRGB(0, 220, 0);
	J.TextColor3 = K.Green;
	u("Tema neon aplicado");
end);
L(v6, "Sobre");
r(v6, "\226\156\166 MX Hub " .. K.Version);
r(v6, "\226\156\166 Green Edition");
r(v6, "\226\156\166 Brookhaven RP Support");
L(v6, "A\195\167\195\181es");
d(v6, "\226\157\140 Fechar Hub", function()
	O:Destroy();
end);
task.wait(.7);
u("Bem-vindo ao \194\182 MX HUB \194\182 Verde", 4);
print("======================================");
print("     \194\182 MX HUB \194\182 GREEN EDITION         ");
print("     Vers\195\163o: " .. K.Version);
print("     Brookhaven RP Compatible         ");
print("======================================");
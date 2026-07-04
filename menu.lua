local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local UIAntiga = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("SxzRetroMenu")
if UIAntiga then UIAntiga:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SxzRetroMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.new(0, 300, 0, 100)
IntroFrame.Position = UDim2.new(0.5, -150, 0.4, -50)
IntroFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
IntroFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
IntroFrame.BorderSizePixel = 2
IntroFrame.Parent = ScreenGui

local IntroText = Instance.new("TextLabel")
IntroText.Size = UDim2.new(1, 0, 0.5, 0)
IntroText.BackgroundTransparency = 1
IntroText.Text = "LOADING SYSTEM..."
IntroText.TextColor3 = Color3.fromRGB(255, 255, 255)
IntroText.Font = Enum.Font.Arcade
IntroText.TextSize = 22
IntroText.Parent = IntroFrame

local AuthorText = Instance.new("TextLabel")
AuthorText.Size = UDim2.new(1, 0, 0.5, 0)
AuthorText.Position = UDim2.new(0, 0, 0.5, 0)
AuthorText.BackgroundTransparency = 1
AuthorText.Text = "by: sxz_gustadev"
AuthorText.TextColor3 = Color3.fromRGB(180, 0, 0)
AuthorText.Font = Enum.Font.Arcade
AuthorText.TextSize = 16
AuthorText.Parent = IntroFrame

task.wait(1.5)
IntroText.Text = "SYSTEM READY"
task.wait(0.8)
IntroFrame:Destroy()

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 320)
MainFrame.Position = UDim2.new(0.5, -160, 0.4, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Parent = ScreenGui

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0.7, 0, 1, 0)
TitleText.Position = UDim2.new(0.05, 0, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "SXZ FPS HACK"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Font = Enum.Font.Arcade
TitleText.TextSize = 18
TitleText.Parent = TitleBar

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 35, 0, 35)
MinimizeBtn.Position = UDim2.new(1, -35, 0, 0)
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.Arcade
MinimizeBtn.TextSize = 22
MinimizeBtn.Parent = TitleBar

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -35)
ContentFrame.Position = UDim2.new(0, 0, 0, 35)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local function criarBotao(posicao, textoPadrao)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = posicao
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    btn.Text = textoPadrao .. " [DESATIVADO]"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Arcade
    btn.TextSize = 14
    btn.Parent = ContentFrame
    return btn
end

local BtnESP = criarBotao(UDim2.new(0.05, 0, 0.05, 0), "ESP (WALLHACK)")
local BtnTracers = criarBotao(UDim2.new(0.05, 0, 0.19, 0), "TRACERS (LINHAS)")
local BtnAimbot = criarBotao(UDim2.new(0.05, 0, 0.33, 0), "AIMBOT FOV")
local BtnVelocity = criarBotao(UDim2.new(0.05, 0, 0.47, 0), "VELOCITY SPEED")
local BtnJump = criarBotao(UDim2.new(0.05, 0, 0.61, 0), "INFINITE JUMP")

local CreditsText = Instance.new("TextLabel")
CreditsText.Size = UDim2.new(0.9, 0, 0, 20)
CreditsText.Position = UDim2.new(0.05, 0, 0.90, 0)
CreditsText.BackgroundTransparency = 1
CreditsText.Text = "créditos: sxz_gustadev"
CreditsText.TextColor3 = Color3.fromRGB(150, 150, 150)
CreditsText.TextXAlignment = Enum.TextXAlignment.Left
CreditsText.Font = Enum.Font.Arcade
CreditsText.TextSize = 12
CreditsText.Parent = ContentFrame
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

local minimizado = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimizado = not minimizado
    if minimizado then
        ContentFrame.Visible = false
        MainFrame.Size = UDim2.new(0, 320, 0, 35)
        MinimizeBtn.Text = "+"
    else
        ContentFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 320, 0, 320)
        MinimizeBtn.Text = "-"
    end
end)

local espAtivo = false
local tracersAtivo = false
local aimbotAtivo = false
local velocityAtivo = false
local jumpAtivo = false

local function atualizarESP()
    for _, jogador in pairs(Players:GetPlayers()) do
        if jogador ~= LocalPlayer and jogador.Character then
            local highlight = jogador.Character:FindFirstChild("SxzESP")
            if espAtivo then
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Name = "SxzESP"
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.OutlineTransparency = 0
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.Parent = jogador.Character
                end
            else
                if highlight then highlight:Destroy() end
            end
        end
    end
end

BtnESP.MouseButton1Click:Connect(function()
    espAtivo = not espAtivo
    BtnESP.Text = "ESP (WALLHACK) " .. (espAtivo and "[ATIVADO]" or "[DESATIVADO]")
    BtnESP.BackgroundColor3 = espAtivo and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(25, 25, 25)
    atualizarESP()
end)

local linhasTracers = {}
local function limparTracers()
    for _, linha in pairs(linhasTracers) do pcall(function() linha:Destroy() end) end
    table.clear(linhasTracers)
end

local function atualizarTracers()
    limparTracers()
    if not tracersAtivo then return end
    
    for _, jogador in pairs(Players:GetPlayers()) do
        if jogador ~= LocalPlayer and jogador.Character and jogador.Character:FindFirstChild("HumanoidRootPart") then
            local root = jogador.Character.HumanoidRootPart
            local screenPos, noEcra = Camera:WorldToViewportPoint(root.Position)
            
            if noEcra then
                local linha = Instance.new("Frame")
                linha.Size = UDim2.new(0, 2, 0, math.abs(Camera.ViewportSize.Y - screenPos.Y))
                linha.Position = UDim2.new(0, screenPos.X, 0, screenPos.Y)
                linha.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                linha.BorderSizePixel = 0
                linha.Parent = ScreenGui
                table.insert(linhasTracers, linha)
            end
        end
    end
end

BtnTracers.MouseButton1Click:Connect(function()
    tracersAtivo = not tracersAtivo
    BtnTracers.Text = "TRACERS (LINHAS) " .. (tracersAtivo and "[ATIVADO]" or "[DESATIVADO]")
    BtnTracers.BackgroundColor3 = tracersAtivo and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(25, 25, 25)
end)

Players.PlayerAdded:Connect(function(j) j.CharacterAdded:Connect(function() task.wait(0.5); atualizarESP() end) end)
RunService.RenderStepped:Connect(function()
    atualizarESP()
    atualizarTracers()
end)

local function obterInimigoNoFOV()
    local menorDistancia = math.huge
    local alvoMaisProximo = nil
    local telaCentro = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local RAIO_FOV = 130

    for _, jogador in pairs(Players:GetPlayers()) do
        if jogador ~= LocalPlayer and jogador.Character and jogador.Character:FindFirstChild("HumanoidRootPart") and jogador.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
            local rootPart = jogador.Character.HumanoidRootPart
            local screenPos, noEcra = Camera:WorldToViewportPoint(rootPart.Position)
            
            if noEcra then
                local distanciaCentro = (Vector2.new(screenPos.X, screenPos.Y) - telaCentro).Magnitude
                if distanciaCentro < RAIO_FOV and distanciaCentro < menorDistancia then
                    menorDistancia = distanciaCentro
                    alvoMaisProximo = rootPart
                end
            end
        end
    end
    return alvoMaisProximo
end

BtnAimbot.MouseButton1Click:Connect(function()
    aimbotAtivo = not aimbotAtivo
    BtnAimbot.Text = "AIMBOT FOV " .. (aimbotAtivo and "[ATIVADO]" or "[DESATIVADO]")
    BtnAimbot.BackgroundColor3 = aimbotAtivo and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(25, 25, 25)
end)

RunService.RenderStepped:Connect(function()
    if aimbotAtivo then
        local alvo = obterInimigoNoFOV()
        if alvo then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, alvo.Position), 0.2)
        end
    end
end)

BtnVelocity.MouseButton1Click:Connect(function()
    velocityAtivo = not velocityAtivo
    BtnVelocity.Text = "VELOCITY SPEED " .. (velocityAtivo and "[ATIVADO]" or "[DESATIVADO]")
    BtnVelocity.BackgroundColor3 = velocityAtivo and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(25, 25, 25)
end)

task.spawn(function()
    while task.wait(0.1) do
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if velocityAtivo then hum.WalkSpeed = 45 else hum.WalkSpeed = 16 end
        end
    end
end)

BtnJump.MouseButton1Click:Connect(function()
    jumpAtivo = not jumpAtivo
    BtnJump.Text = "INFINITE JUMP " .. (jumpAtivo and "[ATIVADO]" or "[DESATIVADO]")
    BtnJump.BackgroundColor3 = jumpAtivo and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(25, 25, 25)
end)

UserInputService.JumpRequest:Connect(function()
    if jumpAtivo and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)


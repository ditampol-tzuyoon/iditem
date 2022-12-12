function ohdsay(logger)

    if getBot().status == "online" then
        statzBot = ":green_circle:"
    else
        statzBot = ":red_circle:"
    end

    if Tytyd ~= Token then
        Judulnya = ":lock: TOKEN"
        Isinya = Tytyd
    else
        Judulnya = ":crown: Buyer Script"
        Isinya = "<@"..UserDC..">"
    end
    
    URLWeb = MainHook.."/messages/"..HookID

    local script = [[

    $w = "]]..URLWeb..[["

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    [System.Collections.ArrayList]$embedArray = @()
    $descriptions = ']].. logger ..[['
    $color       = ']]..math.random(1000000,9999999)..[['


    $footerObject = [PSCustomObject]@{
        text = 'Auto Move by Ohdear#2320'
    }

    $authorObject = [PSCustomObject]@{
        name = "Log Move (]]..#DataBuyer..[[ User) || Author : Ohdear#2320"
        url = "https://discord.gg/TjVwdgma74"
        icon_url = "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/05/16/3828930929.jpg"
    }

    $fieldArray = @(

        @{
            name = "]]..Judulnya..[["
            value = "]]..Isinya..[["
            inline = "false"
        }

        @{
            name = "]]..emot_bot..[[ Bot Name"
            value = "]]..getBot().name..[[ **(]]..getPing()..[[ Ms)**"
            inline = "true"
        }
        @{
            name = ":medal: Bot Level"
            value = "]]..getBot().level..[["
            inline = "true"
        }
        @{
            name = "]]..statzBot..[[ Bot Status"
            value = "**]]..(getBot().status):upper()..[[**"
            inline = "true"
        }

        @{
            name = ":earth_asia: Sisa Item di World Ke-]]..nWorld..[["
            value = "]]..SisaItem..[["
            inline = "true"
        }

        @{
            name = ":earth_asia: Total Dropped Item di World Drop"
            value = "]]..TotalItem..[["
            inline = "true"
        }
    )

    $embedObject = [PSCustomObject]@{
        description = $descriptions
        color       = $color
        footer      = $footerObject
        author      = $authorObject
        fields      = $fieldArray
    }

    $embedArray.Add($embedObject) | Out-Null

    $Body = [PSCustomObject]@{

        embeds = $embedArray

        'username' = ']]..getBot().name..[[|OD2320'

    }

    Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method Patch -ContentType 'application/json'
    ]]
    local pipe = io.popen("powershell -command -", "w")
    pipe:write(script)
    pipe:close()
end

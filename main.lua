Interface = {}
Interface.__index = Interface

local sx, sy = guiGetScreenSize()
local vid_id = ""

function Interface:new(...)
    local object = setmetatable({}, {__index = self})
    if object.constructor then 
        object:constructor(...)
    end
    return object 
end

function Interface:constructor()
    self.browser = createBrowser(sx, sy, false)
    addEventHandler("onClientBrowserCreated", self.browser, function()
        loadBrowserURL(self.browser, "https://www.youtube.com/embed/"..vid_id.."?autoplay=1&cc_load_policy=0&controls=0&fs=0&iv_load_policy=3&loop=1&playlist=dq9u0TQcS-8&modestbranding=1&showinfo=0")
        addEventHandler("onClientBrowserDocumentReady", self.browser, function()
            self.browserLoad = true
        end)
    end)

    self.assets = {
        ["loading"] = dxCreateTexture("assets/loading.png")
    }

    self.pos = {
        ["loading"] = {x=math.floor(/2-985/2), y=(math.floor(sy/2-330/2), w=985, h=330}
    }


function Interface:load()
    if self.browserLoad then 
        dxDrawImage(0, 0, sx, sy, self.browser, 0, 0, 0 tocolor(255, 255, 255, 255))
        print("video load")
    else
        dxDrawImage(0, 0, sx, sy, self.loading, 0, 0, 0, tocolor(255, 255, 255, 255))
    end
end

local M = {}

setmetatable(M, {
    __call = function(self, ...)
        print("vec:", ...)
    end
})

return M

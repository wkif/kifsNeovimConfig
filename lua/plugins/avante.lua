-- Ollama API 实现
local role_map = {
  user = "user",
  assistant = "assistant", 
  system = "system",
  tool = "tool",
}

local function parse_messages(self, opts)
  local messages = {}
  local has_images = opts.image_paths and #opts.image_paths > 0
  local msg_list = opts.messages or {}
  
  for _, msg in ipairs(msg_list) do
    local role = role_map[msg.role] or "assistant"
    local content = msg.content or ""
    
    if has_images and role == "user" then
      local message_content = {
        role = role,
        content = content,
        images = {},
      }
      for _, image_path in ipairs(opts.image_paths) do
        local base64_content = vim.fn.system(string.format("base64 -w 0 %s", image_path)):gsub("\n", "")
        table.insert(message_content.images, "data:image/png;base64," .. base64_content)
      end
      table.insert(messages, message_content)
    else
      table.insert(messages, {
        role = role,
        content = content,
      })
    end
  end
  return messages
end

local function parse_curl_args(self, code_opts)
  local messages = {
    { role = "system", content = code_opts.system_prompt },
  }
  vim.list_extend(messages, self:parse_messages(code_opts))
  
  local options = {
    num_ctx = (self.options and self.options.num_ctx) or 4096,
    temperature = code_opts.temperature or (self.options and self.options.temperature) or 0,
  }
  
  return {
    url = self.endpoint .. "/api/chat",
    headers = {
      Accept = "application/json",
      ["Content-Type"] = "application/json",
    },
    body = {
      model = self.model,
      messages = messages,
      options = options,
      stream = true,
    },
  }
end

local function parse_stream_data(data, handler_opts)
  local json_data = vim.fn.json_decode(data)
  if json_data then
    if json_data.done then
      handler_opts.on_stop({ reason = json_data.done_reason or "stop" })
      return
    end
    if json_data.message then
      local content = json_data.message.content
      if content and content ~= "" then
        handler_opts.on_chunk(content)
      end
    end
    if json_data.tool_calls then
      for _, tool in ipairs(json_data.tool_calls) do
        handler_opts.on_tool(tool)
      end
    end
  end
end

local ollama = {
  api_key_name = "",
  endpoint = "http://127.0.0.1:11434",
  model = "deepseek-coder",
--   options = {
--     num_ctx = 4096,
--     temperature = 0.2,
--   },
--   -- 为 Vue3 开发定制系统提示词
--   system_prompts = {
--     default = [[You are an expert Vue 3 developer with deep knowledge of the Vue.js ecosystem, including Composition API, TypeScript, Vite, and modern frontend best practices. 
-- Help write clean, maintainable, and performant Vue 3 code following best practices.]],
--     explain = [[Analyze this Vue 3 code and explain:
-- - Component structure and lifecycle
-- - Composition API usage and reactivity
-- - Props and events handling
-- - Performance considerations
-- - Potential improvements]],
--     refactor = [[Refactor this Vue 3 code to:
-- - Use Composition API effectively
-- - Improve type safety with TypeScript
-- - Follow Vue 3 best practices
-- - Enhance reusability and maintainability
-- - Optimize performance]],
--   },
  parse_messages = parse_messages,
  parse_curl_args = parse_curl_args,
  parse_stream_data = parse_stream_data,
}

-- Avante 配置
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    auto_suggestions_provider = "ollama",
    debug = true,
    provider = "ollama",
    vendors = {
      ollama = ollama,
    },
    -- -- 为 Vue3 开发配置快捷命令
    -- commands = {
    --   {
    --     name = "CreateVueComponent",
    --     description = "Create a new Vue 3 component with best practices",
    --     prompt = "Create a Vue 3 component that: {{input}}",
    --   },
    --   {
    --     name = "AddComposable",
    --     description = "Create a new Vue 3 composable function",
    --     prompt = "Create a Vue 3 composable function that: {{input}}",
    --   },
    --   {
    --     name = "OptimizeComponent",
    --     description = "Optimize Vue 3 component performance",
    --     prompt = "Analyze and optimize this Vue component for performance: {{input}}",
    --   },
    -- },
    -- 添加文件选择支持
    file_picker = {
      -- 使用 telescope 作为文件选择器
      use_telescope = true,
      -- 文件选择器配置
      telescope = {
        -- 默认搜索当前工作目录
        cwd = vim.fn.getcwd(),
        -- 搜索隐藏文件
        hidden = true,
        -- 遵循 .gitignore
        respect_gitignore = true,
        -- 文件过滤
        file_ignore_patterns = {
          "node_modules",
          ".git",
          "dist",
          "build",
        },
      },
    },
    -- 添加快捷键支持
    keymaps = {
      -- 在聊天窗口中使用 Ctrl+p 打开文件选择
      chat = {
        ["<C-p>"] = "pick_files",
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
    -- 添加 telescope 作为依赖
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
}


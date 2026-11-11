-- M: :MarkdownSnapshot renders the current markdown buffer to a standalone HTML file
-- and opens it in the browser. Unlike :MarkdownPreview there is no live server,
-- so the page stays loaded after the buffer or Neovim is closed.

local template = [[
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="%s">
<title>%s</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/github-markdown-css@5/github-markdown.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/highlight.js@11/styles/github-dark.min.css">
<style>
  body { background: #0d1117; }
  .markdown-body { box-sizing: border-box; max-width: 980px; margin: 0 auto; padding: 45px; }
</style>
</head>
<body>
<article class="markdown-body" id="content"></article>
<script src="https://cdn.jsdelivr.net/npm/marked@15/marked.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11/build/highlight.min.js"></script>
<script type="module">
  import mermaid from "https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs";
  const src = %s;
  const el = document.getElementById("content");
  el.innerHTML = marked.parse(src);
  el.querySelectorAll("pre > code.language-mermaid").forEach((code) => {
    const div = document.createElement("div");
    div.className = "mermaid";
    div.textContent = code.textContent;
    code.parentElement.replaceWith(div);
  });
  el.querySelectorAll("pre > code").forEach((code) => hljs.highlightElement(code));
  mermaid.initialize({ startOnLoad: false, theme: "dark" });
  mermaid.run();
</script>
</body>
</html>
]]

vim.api.nvim_create_user_command("MarkdownSnapshot", function()
  local text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
  local file = vim.api.nvim_buf_get_name(0)
  local name = file ~= "" and vim.fn.fnamemodify(file, ":t:r") or "untitled"
  local dir = file ~= "" and vim.fn.fnamemodify(file, ":p:h") or vim.fn.getcwd()

  -- M: escape "</" so markdown containing </script> cannot break out of the script tag
  local src = vim.json.encode(text):gsub("</", "<\\/")
  local base = "file://" .. dir .. "/" -- M: makes relative image links resolve
  local html = template:format(base, name, src)

  local out_dir = vim.uv.os_tmpdir() .. "/markdown-snapshots"
  vim.fn.mkdir(out_dir, "p")
  local out = string.format("%s/%s-%s.html", out_dir, name, os.date("%Y%m%d-%H%M%S"))
  vim.fn.writefile(vim.split(html, "\n"), out)

  vim.ui.open(out)
  vim.notify("Markdown snapshot: " .. out)
end, { desc = "Open a detached HTML snapshot of the markdown buffer in the browser" })

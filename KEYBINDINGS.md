# Neovim Keybindings Reference

> **Leader key:** `Space`

## General

| Key          | Mode   | Description                                    |
| ------------ | ------ | ---------------------------------------------- |
| `<leader>nh` | Normal | Clear search highlights                        |
| `x`          | Normal | Delete character (without copying to register) |
| `<leader>qq` | Normal | Force quit all                                 |
| `<leader>rf` | Normal | Reveal file in Finder (macOS)                  |

## Window Management

| Key          | Mode   | Description                 |
| ------------ | ------ | --------------------------- |
| `<leader>sv` | Normal | Split window vertically     |
| `<leader>sh` | Normal | Split window horizontally   |
| `<leader>se` | Normal | Make splits equal size      |
| `<leader>sx` | Normal | Close current split         |
| `<leader>wd` | Normal | Delete/close current window |
| `Ctrl+h`     | Normal | Move to left window         |
| `Ctrl+j`     | Normal | Move to bottom window       |
| `Ctrl+k`     | Normal | Move to top window          |
| `Ctrl+l`     | Normal | Move to right window        |
| `Ctrl+Up`    | Normal | Increase window height      |
| `Ctrl+Down`  | Normal | Decrease window height      |
| `Ctrl+Left`  | Normal | Decrease window width       |
| `Ctrl+Right` | Normal | Increase window width       |

## Tab Management

| Key          | Mode   | Description                    |
| ------------ | ------ | ------------------------------ |
| `<leader>to` | Normal | Open new tab                   |
| `<leader>tx` | Normal | Close current tab              |
| `<leader>tn` | Normal | Go to next tab                 |
| `<leader>tp` | Normal | Go to previous tab             |
| `<leader>tF` | Normal | Open current buffer in new tab |

## Buffer Management

| Key          | Mode   | Description               |
| ------------ | ------ | ------------------------- |
| `Shift+l`    | Normal | Next buffer               |
| `Shift+h`    | Normal | Previous buffer           |
| `<leader>bd` | Normal | Delete buffer, keep split |

## Text Editing

| Key      | Mode   | Description                         |
| -------- | ------ | ----------------------------------- |
| `J`      | Visual | Move selected text down             |
| `K`      | Visual | Move selected text up               |
| `<`      | Visual | Indent left (stay in visual mode)   |
| `>`      | Visual | Indent right (stay in visual mode)  |
| `Ctrl+d` | Normal | Scroll down (centered)              |
| `Ctrl+u` | Normal | Scroll up (centered)                |
| `n`      | Normal | Next search result (centered)       |
| `N`      | Normal | Previous search result (centered)   |
| `p`      | Visual | Paste without yanking replaced text |

## Insert Mode

| Key      | Mode   | Description       |
| -------- | ------ | ----------------- |
| `jk`     | Insert | Exit insert mode  |
| `kj`     | Insert | Exit insert mode  |
| `Ctrl+h` | Insert | Move cursor left  |
| `Ctrl+j` | Insert | Move cursor down  |
| `Ctrl+k` | Insert | Move cursor up    |
| `Ctrl+l` | Insert | Move cursor right |

## File Operations

| Key      | Mode                 | Description |
| -------- | -------------------- | ----------- |
| `Ctrl+s` | Normal/Insert/Visual | Save file   |

## UI Toggles

| Key          | Mode   | Description                  |
| ------------ | ------ | ---------------------------- |
| `<leader>lw` | Normal | Toggle line wrapping         |
| `<leader>ln` | Normal | Toggle relative line numbers |

## LSP

| Key          | Mode   | Description           |
| ------------ | ------ | --------------------- |
| `K`          | Normal | Hover documentation   |
| `gd`         | Normal | Go to definition      |
| `gD`         | Normal | Go to declaration     |
| `gi`         | Normal | Go to implementation  |
| `go`         | Normal | Go to type definition |
| `gr`         | Normal | Find references       |
| `gs`         | Normal | Signature help        |
| `<leader>cr` | Normal | Rename symbol         |
| `F4`         | Normal | Code action           |

## Diagnostics

| Key          | Mode   | Description                    |
| ------------ | ------ | ------------------------------ |
| `<leader>of` | Normal | Show line diagnostics (float)  |
| `[d`         | Normal | Go to previous diagnostic      |
| `]d`         | Normal | Go to next diagnostic          |
| `<leader>ol` | Normal | Open diagnostics quickfix list |

## Telescope (Search)

| Key                | Mode   | Description                       |
| ------------------ | ------ | --------------------------------- |
| `<leader><leader>` | Normal | Find files                        |
| `<leader>sf`       | Normal | Search files                      |
| `<leader>sF`       | Normal | Search files (all/hidden/ignored) |
| `<leader>sg`       | Normal | Search by grep (live)             |
| `<leader>sw`       | Normal | Search current word               |
| `<leader>sd`       | Normal | Search diagnostics                |
| `<leader>sr`       | Normal | Resume last search                |
| `<leader>s.`       | Normal | Search recent files               |
| `<leader>ss`       | Normal | Search Telescope pickers          |
| `<leader>sk`       | Normal | Search keymaps                    |
| `<leader>sH`       | Normal | Search help tags                  |

## File Explorer (Neo-tree)

| Key         | Mode   | Description          |
| ----------- | ------ | -------------------- |
| `<leader>e` | Normal | Toggle file explorer |

## Git (Gitsigns)

| Key          | Mode            | Description               |
| ------------ | --------------- | ------------------------- |
| `]c`         | Normal          | Jump to next hunk         |
| `[c`         | Normal          | Jump to previous hunk     |
| `<leader>hs` | Normal/Visual   | Stage hunk                |
| `<leader>hr` | Normal/Visual   | Reset hunk                |
| `<leader>hS` | Normal          | Stage buffer              |
| `<leader>hu` | Normal          | Undo stage hunk           |
| `<leader>hR` | Normal          | Reset buffer              |
| `<leader>hp` | Normal          | Preview hunk              |
| `<leader>hb` | Normal          | Blame line                |
| `<leader>hd` | Normal          | Diff against index        |
| `<leader>hD` | Normal          | Diff against last commit  |
| `<leader>tb` | Normal          | Toggle line blame         |
| `<leader>td` | Normal          | Toggle deleted            |
| `ih`         | Operator/Visual | Select hunk (text object) |

## Git (Telescope)

| Key          | Mode   | Description                               |
| ------------ | ------ | ----------------------------------------- |
| `<leader>gs` | Normal | Git status picker (changed files via TUI) |

## Git (LazyGit)

| Key          | Mode   | Description                   |
| ------------ | ------ | ----------------------------- |
| `<leader>gg` | Normal | Open LazyGit                  |
| `<leader>gF` | Normal | Open LazyGit for current file |

## Terminal (ToggleTerm)

| Key            | Mode          | Description                   |
| -------------- | ------------- | ----------------------------- |
| `Ctrl+\`       | Normal/Insert | Toggle terminal               |
| `<leader>tf`   | Normal        | Float terminal                |
| `<leader>th`   | Normal        | Horizontal terminal           |
| `<leader>tv`   | Normal        | Vertical terminal             |
| `<leader>ts`   | Normal        | Send current line to terminal |
| `<leader>t1-9` | Normal        | Open/switch to terminal 1-9   |
| `<leader>ta`   | Normal        | Toggle all terminals          |
| `Ctrl+1-5`     | Terminal      | Switch to terminal 1-5        |
| `Ctrl+h/j/k/l` | Terminal      | Navigate between windows      |

## Debugging (DAP)

| Key          | Mode          | Description               |
| ------------ | ------------- | ------------------------- |
| `<leader>db` | Normal        | Toggle breakpoint         |
| `<leader>dB` | Normal        | Breakpoint with condition |
| `<leader>dc` | Normal        | Continue                  |
| `<leader>da` | Normal        | Run with args             |
| `<leader>dC` | Normal        | Run to cursor             |
| `<leader>dg` | Normal        | Go to line (no execute)   |
| `<leader>di` | Normal        | Step into                 |
| `<leader>do` | Normal        | Step over                 |
| `<leader>dO` | Normal        | Step out                  |
| `<leader>dj` | Normal        | Down (stack)              |
| `<leader>dk` | Normal        | Up (stack)                |
| `<leader>dl` | Normal        | Run last                  |
| `<leader>dp` | Normal        | Pause                     |
| `<leader>dr` | Normal        | Toggle REPL               |
| `<leader>ds` | Normal        | Session                   |
| `<leader>dt` | Normal        | Terminate                 |
| `<leader>dw` | Normal        | Widgets (hover)           |
| `<leader>du` | Normal        | Toggle DAP UI             |
| `<leader>de` | Normal/Visual | Eval expression           |
| `<leader>dR` | Normal        | Reset DAP UI layout       |

## Completion (nvim-cmp)

| Key      | Mode   | Description             |
| -------- | ------ | ----------------------- |
| `Ctrl+p` | Insert | Select previous item    |
| `Ctrl+n` | Insert | Select next item        |
| `Ctrl+y` | Insert | Confirm completion      |
| `Ctrl+e` | Insert | Trigger completion menu |
| `Ctrl+u` | Insert | Scroll docs up          |
| `Ctrl+d` | Insert | Scroll docs down        |

## Formatting (Conform)

| Key         | Mode          | Description              |
| ----------- | ------------- | ------------------------ |
| `<leader>f` | Normal/Visual | Format file or selection |

## Augment AI

| Key          | Mode          | Description         |
| ------------ | ------------- | ------------------- |
| `<leader>ac` | Normal/Visual | Augment Chat        |
| `<leader>an` | Normal/Visual | Augment Chat New    |
| `<leader>at` | Normal/Visual | Augment Chat Toggle |
| `<leader>as` | Normal/Visual | Augment Status      |

## Markdown

| Key          | Mode   | Description      |
| ------------ | ------ | ---------------- |
| `<leader>mp` | Normal | Markdown Preview |

# Install
-   Neovim
-   Windows -> clang
-   Markdown -> :call mkdp#util#install()
-   Prettier -> npm install -g prettier , prettier --version

# Command
- :MarkdownPreview
- :ToggleTerm 1 size=60 direction=vertical
- :ToggleTerm 2 size=60 direction=horizontal
- :lua vim.diagnostic.setloclist() #check all diagnostic in project
- :set expandtab tabstop=4 shiftwidth=4 #set prettier
- :noh :nohlsearch
- :5,10> -- gg=G

# Keyboard Shortcuts

## Clipboard
| Keyboard    | Description |
| ----------- | ----------- |
| space + y   | copy        |
| space + p   | paste       |

## Split
| Keyboard    | Description |
| ----------- | ----------- |
| space + sh  | horizontal  |
| space + sv  | vertical    |

## Bufferline
| Keyboard    | Description |
| ----------- | ----------- |
| tab         | next        |
| shift + tab | previous    |
| space + bd  | close ht    |
| space + bc  | pick close  |
| space + bb  | pick choose |

## Tree
| Keyboard    | Description |
| ----------- | ----------- |
| space + e   | open        |
| q           | close       |
| a           | new file    |

## Telescope
| Keyboard    | Description |
| ----------- | ----------- |
| space + ff  | open        |

## Terminal
| Keyboard    | Description |
| ----------- | ----------- |
| ctrl + t    | toggle      |

## LSP
| Keyboard    | Description |
| ----------- | ----------- |
| space + ca    | show choose     |
| \ca or ,ca    | show choose     |

## Comment
| Keyboard | Description |
|----------|-------------|
| gc       | line        |
| gcc      | toggle line |
| gb       | block       |
| gbc      | toggle block |
| gc0      | above       |
| gco      | below       |
| gcA      | end         |

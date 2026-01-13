# dotfiles

## Фичи

- Система плагинов для zsh – [antidote](https://antidote.sh/);
- Конфигурируемый вывод ответа zsh – [starship](https://starship.rs);
- Единый каталог для zsh (zdotdir) – по-умолчанию в `$HOME/.config/zsh`;
- Элементарные скрипты как программы через `$ZDOTDIR/.zfunctions`;
- Для добавления конфигурации без добавления в git используются файлы по-маске `$ZDOTDIR/.zshrc.d/*.local.zsh`;

## Установка

- `make install` – установка всех зависимостей
- `make deps` – установка зависимостей
- `make font` – установка шрифта `JetBrains Mono Nerd`
- `make dotfiles` – установка файлов конфигурации для `zsh`

## Зависимости

- [starship](https://starship.rs) – фреймворк вывода zsh
- [mise](https://mise.jdx.dev/) – менеджер рабочего окружения и версий зависимостей
- [eza](https://github.com/eza-community/eza) – аналог `ls`

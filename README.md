# Шаблоны Typst

В репозитории хранится коллекция шаблонов Typst для различных видов документов:
- Презентация в стиле ИСП РАН.
- Работа (курсовая, магистерская) для НИУ ВШЭ.

## Использование шаблонов

```sh
git clone https://github.com/ispras/typst-templates.git
ln -s $(pwd)/typst-templates/<template-dir>/lib.typ <your-directory>/lib.typ
echo "#import \"lib.typ\": *" > <your-directory>/main.typ
typst compile <your-directory>/main.typ
```

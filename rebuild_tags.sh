#! /bin/bash
#Finds all unique tags, and creates a directory structure for them under 
#<root>/tags/<tagname> with a list of the posts with that tag
echo "Creating vimscript"
echo -e ":set hidden\n:set silent\n:first\nqq\ngg\n/tags:\nj\nV\n/---\n:w >> ../alltags.txt\ngg\nq\n:silent argdo normal @q\n:qall" > create_list_of_tags.vim &&

echo "Creating list of tags using vim.." &&
touch alltags.txt &&
vim -s "create_list_of_tags.vim" ./_posts/*.md &&
rm create_list_of_tags.vim &&

echo "Reducing to unique entries only" &&
sort alltags.txt | uniq -u > uniquetags.txt &&
rm alltags.txt &&

echo "Removing prepeding '- ' " &&
sed -i "s/- //g" uniquetags.txt &&

#Slugify all lines
echo "Slugifying all entries" &&
cat uniquetags.txt | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z > slugs.txt &&

echo "Removing old tags directory" &&
rm -rf tags &&

echo "Creating Directories"
while read -u 3 -r tags_line && read -u 4 -r slugified_line; do
    mkdir -p "tags/$slugified_line" &&

    echo "---" > tags/$slugified_line/index.html
    echo "layout: tag_page" >> tags/$slugified_line/index.html
    echo "tag: $tags_line" >> tags/$slugified_line/index.html
    echo "---" >> tags/$slugified_line/index.html
done 3<uniquetags.txt 4<slugs.txt

rm slugs.txt &&
rm uniquetags.txt &&

echo "Completed!";

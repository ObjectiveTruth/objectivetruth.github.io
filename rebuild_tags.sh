#! /bin/bash
#Finds all unique tags, and creates a directory structure for them under 
#<root>/tags/<tagname> with a list of the posts with that tag

echo "Creating list of tags using vim.."
touch alltags.txt &&
vim -s "non_website_resources/create_list_of_tags.vim" ./_posts/*.md &&

echo "Reducing to unique entries only"
sort alltags.txt | uniq -u > uniquetags.txt &&
rm alltags.txt &&

echo "Removing prepeding '- ' "
sed -i "s/- //g" uniquetags.txt &&

#Slugify all lines
echo "Slugifying all entries"
cat uniquetags.txt | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z > slugs.txt &&
rm uniquetags.txt &&

echo "Removing old tags directory" &&
rm -rf tags &&

echo "Creating Directories"
while read line; do
    mkdir -p "tags/$line" &&

    echo "---" > tags/$line/index.html
    echo "layout: tag_page" >> tags/$line/index.html
    echo "tag: $line" >> tags/$line/index.html
    echo "---" >> tags/$line/index.html
done < slugs.txt

rm slugs.txt &&

echo "Completed!";

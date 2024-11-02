# bin/zsh
#

echo "U really want to continue? y/n"
read -r confirm

if [[ "$confirm" != "y" ]]; then
    echo "Operation canceled."
    exit 1
fi

find . -mindepth 1 -maxdepth 1 ! -name 'exe.sh' ! -name 'README.md' ! -name 'paths.txt' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} +

while IFS= read -r path; do
    expanded_path="${path/#\~/$HOME}"
    dest=$(basename "$expanded_path")

    cp -r "$expanded_path" "$dest" || echo "Failed to copy $expanded_path"
done < paths.txt

git add .
git commit -m "UPDATE"

git push origin master

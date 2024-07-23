cp -r ~/.config/i3 ./configurations/
cp -r ~/.config/polybar ./configurations/
cp -r ~/.config/kitty ./configurations/
cp -r ~/.config/hypr ./configurations/
cp -r ~/.config/ags ./configurations/
cp ~/.zshrc ./configurations/

git add .
git commit -m "some stuff"
git push

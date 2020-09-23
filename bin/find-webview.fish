for f in **/*.framework
    set executable (basename $f .framework)
    echo "Looking in $f"
    nm $f/$executable | rg "UIWebView"
end

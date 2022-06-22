echo "Commit"
git diff --word-diff=plain | egrep '\{|\[' > .tmpMessage
git add -A .
git commit -F .tmpMessage
git -c core.sshCommand="ssh -i ~/GTD/script/fp2025" push
git -c core.sshCommand="ssh -i ~/GTD/script/fp2025" pull
echo "STATUS:"
git status


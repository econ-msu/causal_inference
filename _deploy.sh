git clone -b gh-pages \
  https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git \
  book-output
cd book-output
git rm -rf *
cd ../
Rscript _build.R
cd book-output
git add --all *
git commit -m "Update the book"
git push origin gh-pages
# clone (or just pull) a package from github

package="$1"; [ "$package" ] || { echo "usage: $0 <package>" >&2; exit 1; }

url="ssh://git@github.com/capr/$package.git"
# use this if you don't have a ssh key
# url="https://capr@github.com/capr/$package.git"

[ -d $package/.git ] || {
	mkdir -p $package
	cd $package
	git init
	git config core.worktree ../../..
	git config core.excludesfile _git/$package.exclude
	cd ../..
	git --git-dir=_git/$package/.git remote add origin "$url"
	git --git-dir=_git/$package/.git fetch --all
	cd _git
}

cd .. && git --git-dir=_git/$package/.git pull origin master

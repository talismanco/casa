# [1.0.0-alpha.2](https://github.com/talismanco/casa/compare/v1.0.0-alpha.1...v1.0.0-alpha.2) (2021-04-29)


### Features

* stub ([4b37e07](https://github.com/talismanco/casa/commit/4b37e07f8f32fa88ef99fea044fa2bf1e5926263))

# 1.0.0-alpha.1 (2021-04-28)


### Bug Fixes

* added DIRENV_LOG_FORMAT flag to supress direnv logging ([c6db8b2](https://github.com/talismanco/casa/commit/c6db8b2582c773b0f86797e58443551e393f1c90))
* added ellipsis import ([733b177](https://github.com/talismanco/casa/commit/733b177b9d0a70ac4e77e58403a07b12b4939ba2))
* added explicit set / function definitions from sources, removed overlays to nixpkgs ([1d96495](https://github.com/talismanco/casa/commit/1d964957c56a30db771cce0a3647315fd1a97258))
* added out of store GOPATH ([430ec29](https://github.com/talismanco/casa/commit/430ec29bea9ef6ef1a60eb82eb226950f141a9ed))
* errant '--force' flag for docker system prune alias ([8254c38](https://github.com/talismanco/casa/commit/8254c382215f187201eeffc14b4b5dc2a3ecf457))
* errant reference to ssh config file ([5f25575](https://github.com/talismanco/casa/commit/5f255750e9f5cc5d865260538af6fb329743b665))
* nullify command output of .ssh symlinks to mute failed symlinks ([53a5b80](https://github.com/talismanco/casa/commit/53a5b807787133efc4f0c638300182cc01bd5b55))
* remove .npmrc config behavior ([84ec154](https://github.com/talismanco/casa/commit/84ec154b44e24342c6d815a0b78902135d95d059))
* remove .npmrc config behavior ([835a46d](https://github.com/talismanco/casa/commit/835a46dc204488dba5c442ae471ef78b1cd93a1b))
* removed gpg signing as default ([9eb119b](https://github.com/talismanco/casa/commit/9eb119bb79e44dc9abde7bca1c0ef40d8e650113))
* removed unused sources from niv manifest, added lunarispkgs ([30b531d](https://github.com/talismanco/casa/commit/30b531de532f1bd35ab4bfb7174b5f41763ac6f9))
* rename and move ssh config file ([f88daf0](https://github.com/talismanco/casa/commit/f88daf0f7286dd410b7a902b7672dc57847c9164))
* renamed next -> develop in .releaserc ([24c8f7c](https://github.com/talismanco/casa/commit/24c8f7c502ccee9bd9d2ffd71b473be11d3b8131))
* renamed next -> develop in semantic-release Github Action ([9279d60](https://github.com/talismanco/casa/commit/9279d60ebdf612d5ab08a7999a58fbd62e82fcb8))
* update code alias from insiders -> default ([609461c](https://github.com/talismanco/casa/commit/609461c23f5fded150563513ddec062d72659160))
* update fix-wsl macro ([a3fcd99](https://github.com/talismanco/casa/commit/a3fcd9901a2c924e4244184bcfc67924073a8c5f))
* updated accurate reference to local .zsh directory ([6230a66](https://github.com/talismanco/casa/commit/6230a66667a73311ff9952023e40ef3e2d322f67))
* updated home-manager channel url for init script ([9de36fe](https://github.com/talismanco/casa/commit/9de36fe322d896372ef519f48a189680df515841))


### Features

* add act ([2b8fd31](https://github.com/talismanco/casa/commit/2b8fd318190fd5b0db6cc7c82f79380aa63e7abf))
* add gcp environment variable to reference active project ([e617614](https://github.com/talismanco/casa/commit/e6176144d3f0f9d1245e96cee603010818914f0f))
* add github cli ([9e8d416](https://github.com/talismanco/casa/commit/9e8d4163716f6d625a78341fc09c6842daa85ae3))
* add glow to common packages ([10c08b4](https://github.com/talismanco/casa/commit/10c08b4b6f00048ca1524fe0dec1aa89b8d3304e))
* add mirror shortcut to bd macro ([0d62ab1](https://github.com/talismanco/casa/commit/0d62ab1c4bed16a7099d6038dcef10b0009b115a))
* add ngrok and vault via <nixpkgs> ([a27111a](https://github.com/talismanco/casa/commit/a27111ab3e47fed4190258c0703fa085cd40a517))
* add rm aliases for git ([49be166](https://github.com/talismanco/casa/commit/49be166cebdfd3584ba33a2e3163da3aebec3367))
* added aliases: ga, gaa ([244fea4](https://github.com/talismanco/casa/commit/244fea4b27e9fc7a6f98b831955c677bf4a52e07))
* added cargo, clippy, rustc to common profile ([3212a98](https://github.com/talismanco/casa/commit/3212a989e0d5fd44a1d20753ac732ea4b7794d5c))
* added git checkout alias (gc) ([08d3945](https://github.com/talismanco/casa/commit/08d394551e0dcd01d2880e33b511f10c63e0b0c5))
* added git-flow to home-manager packages ([5fc222b](https://github.com/talismanco/casa/commit/5fc222ba164cbd362f07a82c69300409365c2e0e))
* added git-flow zsh aliases ([b98e789](https://github.com/talismanco/casa/commit/b98e789298f216f6e50157d75f986b8efc521c46))
* added highest revision packages from lunarispkgs ([db43583](https://github.com/talismanco/casa/commit/db43583c9dd4e02736ead6f8a583c7ba08f6fa18))
* added keychain program ([b0fba57](https://github.com/talismanco/casa/commit/b0fba577758a823e48c627fbb218e2197129e4c4))
* added lunarispkgs.mirror to common profile ([646d6e5](https://github.com/talismanco/casa/commit/646d6e5c4bf975073039b51f9dba98c8154ac67c))
* added lwo alias for lorri watch --once ([176ea62](https://github.com/talismanco/casa/commit/176ea6250231e8cf976150dd4b0f8aa77e0d9ceb))
* added misc directory to bd navigation ([2918a75](https://github.com/talismanco/casa/commit/2918a756e17dbf690c19517fcdbc52c45aa1ec67))
* added programs: jq and tmux ([d826510](https://github.com/talismanco/casa/commit/d826510b7fe4ea2246cd081571adeb9d77ea89f1))
* added symlink setupp for SSH identity files ([136a98a](https://github.com/talismanco/casa/commit/136a98a025061130596db284aa3ec8de6adf3c02))
* home-manager refactor ([24ce34b](https://github.com/talismanco/casa/commit/24ce34b3b1a35000fc061d75f2563ffe1a1ad2ef))
* update nixpkgs to 20.09 ([378e980](https://github.com/talismanco/casa/commit/378e980e12fa50297f99d77ae0a7ab06fd3e9e1c))

import operator
from dataclasses import dataclass
from os import getcwd, walk, makedirs
from os.path import expanduser, isdir, isfile, join, relpath, exists, dirname
from shutil import copy

PWD = getcwd() + '/'
HOME = expanduser('~/')
CONFIG = HOME + '.config/'


def main():
    bash = ConfigGroup('bash/')
    bash.add_dotfiles(HOME, '.bash_login', '.bash_logout', '.bashrc')

    bin = ConfigGroup('bin/')
    bin.add_dotfiles(HOME+'bin/', '')

    git = ConfigGroup('git/', ignored=['credentials'])
    git.add_dotfiles(CONFIG+'git/', '')

    grub = ConfigGroup('grub/')
    grub.add_dotfiles('/boot/grub/', 'grub.cfg')

    i3 = ConfigGroup('i3/')
    i3.add_dotfiles(CONFIG+'i3/', '')

    ranger = ConfigGroup('ranger/')
    ranger.add_dotfiles(CONFIG+'ranger/', '')

    rofi = ConfigGroup('rofi/')
    rofi.add_dotfiles(CONFIG+'rofi/', '')

    vim = ConfigGroup('vim/')
    vim.add_dotfiles(HOME, '.vimrc')

    xorg = ConfigGroup('xorg/')
    xorg.add_dotfiles(HOME, '.Xresources', '.xinitrc')

    configs = [bash, bin, git, grub, i3, ranger, rofi, vim, xorg]

    for config in configs:
        for file in config.dotfiles:
            output = process(file, config.repo_dir)
            if output:
                print(output)


def process(file: 'Dotfile', repo_dir: str) -> str:
    file_name = file.file_name
    file_path = file.full_path
    repo_name = repo_dir + file_name
    repo_path = PWD + repo_name

    if exists(repo_path):
        with open(file_path) as target_file, open(repo_path) as repo_file:
            if target_file.read() != repo_file.read():
                copy(file_path, repo_path)
                return f"{repo_name} was updated."
            else:
                return None
    else:
        makedirs(dirname(repo_path), exist_ok=True)
        copy(file_path, repo_path)
        return f"{repo_name} was added."


class ConfigGroup:
    def __init__(self, repo_dir: str, ignored: list[str] = []):
        self._repo_dir = repo_dir
        self._ignored = ignored
        self._dotfiles: set['Dotfile'] = set()

    def add_dotfiles(self, base_path, *paths):
        for path in paths:
            full_path = base_path + path
            if isdir(full_path):
                for root, dirs, files in walk(full_path):
                    for file_name in files:
                        if file_name in self._ignored:
                            continue
                        file_path = join(relpath(root, full_path), file_name) if root != full_path else file_name
                        self._dotfiles.add(Dotfile(base_path, file_path))
            elif isfile(full_path):
                self._dotfiles.add(Dotfile(base_path, path))
            else:
                print(f"Invalid path '{full_path}' - skipping")

    @property
    def repo_dir(self) -> str:
        return self._repo_dir

    @property
    def dotfiles(self) -> list['Dotfile']:
        return sorted(self._dotfiles, key=operator.attrgetter('full_path'), reverse=True)


@dataclass
class Dotfile:
    def __init__(self, base_path: str, file_name: str):
        self._base_path = base_path
        self._file_name = file_name
        self._full_path = base_path + file_name

    def __hash__(self):
        return hash(self._full_path)

    def __eq__(self, other):
        if not isinstance(other, type(self)):
            return NotImplemented
        return self._base_path == other.base_path and self._file_name == other.file_name

    @property
    def base_path(self) -> str:
        return self._base_path

    @property
    def file_name(self) -> str:
        return self._file_name

    @property
    def full_path(self) -> str:
        return self._full_path


if __name__ == '__main__':
    main()

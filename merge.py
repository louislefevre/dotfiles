from os import getcwd, walk, makedirs
from os.path import expanduser, isdir, isfile, join, relpath, exists, dirname
from subprocess import check_output as execute
from shutil import copyfile, copy

PWD = getcwd() + '/'
HOME = expanduser('~/')
CONFIG = f'{HOME}.config/'
PATHS = [f'{CONFIG}i3/', f'{CONFIG}ranger/', f'{CONFIG}rofi/', f'{CONFIG}git/',
         f'{HOME}.vimrc', f'{HOME}.bash_login', f'{HOME}.bash_logout', f'{HOME}.bashrc',
         f'{HOME}.Xresources', f'{HOME}.xinitrc']
IGNORED = [f'{CONFIG}git/credentials']


def main():
    target_files = get_file_paths(PATHS)
    for target_path in target_files:
        if target_path in IGNORED:
            continue

        repo_name = target_path.split(HOME)[1]
        repo_path = PWD + repo_name

        if exists(repo_path):
            with open(target_path) as target_file, open(repo_path) as repo_file:
                if target_file.read() != repo_file.read():
                    print(f"{repo_name} needs updating.")
                    copy(target_path, repo_path)
                else:
                    print(f"{repo_name} is up to date.")
        else:
            print(f"{repo_name} does not exist - adding.")
            makedirs(dirname(repo_path), exist_ok=True)
            copy(target_path, repo_path)


def get_file_paths(paths):
    file_set = set()
    for path in paths:
        if isdir(path):
            for root, dirs, files in walk(path):
                for file_name in files:
                    file_path = join(root, file_name)
                    file_set.add(str(file_path))
        elif isfile(path):
            file_set.add(path)
        else:
            print(f"Invalid path '{path}' - skipping")
    return sorted(file_set, reverse=True)


if __name__ == '__main__':
    main()

# t: str = execute(['ls', CONFIG], text=True)
# print(list(t.split()))
# print(t)

# rel_path = join(relpath(root, path), file_name) if root != path else file_name
# file_set.add(rel_path)

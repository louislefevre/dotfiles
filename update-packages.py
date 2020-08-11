from os import getcwd
from subprocess import check_output as execute

packages_path = getcwd() + '/packages/all-packages'
packages_file = open(packages_path, mode='r+')
pacman = execute(['pacman', '-Q'], text=True)

old_packages = [pkg.split(" ")[0].replace('\n', '') for pkg in packages_file.readlines()]
new_packages = [pkg.split(" ")[0] for pkg in pacman.splitlines()]

if set(old_packages) != set(new_packages):
    print('New packages:')
    packages_file.seek(0)
    for pkg in new_packages:
        if pkg not in old_packages:
            print(f'- {pkg}')
        packages_file.write(pkg + '\n')
    packages_file.truncate()
else:
    print('Package list is up to date.')

print(f'Package count: {len(new_packages)}')
packages_file.close()

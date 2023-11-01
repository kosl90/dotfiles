#!/usr/bin/env python3
# encoding: utf-8

import os
import sys

CONFIG_FILE = os.path.expandvars('$HOME/.config/gitauthor.json')

def outputShell(name, email):
    print('export GIT_AUTHOR_NAME={}'.format(name));
    print('export GIT_AUTHOR_EMAIL={}'.format(email));
    print('export GIT_COMMITTER_NAME={}'.format(name));
    print('export GIT_COMMITTER_EMAIL={}'.format(email));

def readConfig(f):
    import json
    with open(f) as config:
        return json.load(config)

def findAuthorConfig(projectPath, config):
    for item in iter(config):
        if projectPath.startswith(os.path.expandvars(item['path_prefix'])):
            return item
    return None

def main(projectPath):
    if not os.path.exists(CONFIG_FILE):
        sys.exit(1)

    c = readConfig(CONFIG_FILE);

    firstGitAuthorConfig = findAuthorConfig(projectPath, c)

    if firstGitAuthorConfig is not None:
        outputShell(firstGitAuthorConfig['name'], firstGitAuthorConfig['email'])

if __name__ == '__main__':
    main(os.environ['PWD'])

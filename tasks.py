# INVOKE
#
# @author      Sam Craig <sam@talisman.dev>
# @link        https://github.com/talismanco/talismanpkgs
# ------------------------------------------------------------------------------


from invoke import Collection, task

import dotenv
import os

# === Clean ===


@task()
def _clean(context):
    context.run(
        "find . -type f -name '.env.*' -o -name '*.env' | xargs rm -f")

# === Setup ===


@task(pre=[_clean])
def _setup(context, stage="development"):
    # Get the full path directory that the `tasks.py` file is
    # contained in.
    rootdir = os.path.dirname(os.path.join(os.path.realpath(__file__)))
    context.run(f'python ./scripts/python/setup.py {rootdir} {stage}')

    # Instantiate the environment variables in `.env`
    # and `.tool-versions.env` via `dotenv`
    dotenv.load_dotenv(".env")
    dotenv.load_dotenv(".tool-versions.env")

# === Init ===


@task(pre=[_setup], aliases=["i"])
def init(context):
    """
    Initialize casa
    """
    context.run("source ./scripts/bash/init.sh")

# === Update ===


@task(pre=[_setup], aliases=["univ"])
def update_niv(context):
    """
    Update niv dependencies
    """
    context.run("niv update")


@task(pre=[_setup], aliases=["unpm"])
def update_npm(context):
    """
    Update npm packages
    """
    context.run("npm run update")


update = Collection("update")
update.add_task(update_niv, "niv")
update.add_task(update_npm, "npm")

#

ns = Collection()
ns.add_task(init)

ns.add_collection(update)

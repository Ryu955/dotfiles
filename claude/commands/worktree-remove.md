Remove an existing git worktree.

Steps:
1. Run `git worktree list` and show the results (excluding the main worktree)
2. If no worktree name is given in $ARGUMENTS, ask the user which one to remove
3. Run `git worktree remove <path>`
4. Ask if the branch should also be deleted: `git branch -d <branch-name>`

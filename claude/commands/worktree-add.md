Create a new git worktree for parallel development.

Steps:
1. If no branch name is given in $ARGUMENTS, ask the user for one
2. Determine the current repo name from the current directory
3. Create the worktree at `../../<repo-name>-<branch-name>` (sibling of the current worktree)
   - If the branch already exists: `git worktree add ../../<repo-name>-<branch-name> <branch-name>`
   - If the branch is new: `git worktree add -b <branch-name> ../../<repo-name>-<branch-name>`
4. Show the created worktree path
5. Suggest the user open a new tmux window with: `tmux new-window -c <path>`

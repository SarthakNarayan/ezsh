# prompt configuration

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes


POWERLEVEL9K_MODE='nerdfont-complete'

ZSH_THEME="powerlevel10k/powerlevel10k"

source $HOME/.config/ezsh/prompt/.p10k.zsh

# Show prompt segment "kubecontext" only when the command you are typing invokes one of these tools.
# reference: https://github.com/romkatv/powerlevel10k#show-on-command
# for a more detailed configuration refer to `p10.zsh` file in the repository
typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|flux|fluxctl|stern|kubeseal|skaffold|kubent|kubecolor|cmctl|sparkctl'
typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|awless|terraform|pulumi|terragrunt'

# Other prompts: https://github.com/romkatv/powerlevel10k#batteries-included

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
# if you want to have public ip while working on a machine
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir public_ip vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs load kubecontext aws virtualenv vi_mode time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
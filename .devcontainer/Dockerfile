FROM n8nio/n8n:latest
USER root
RUN apk add --no-cache vim nano python3 py3-pip
RUN apk add --no-cache zsh git curl
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git /home/node/.oh-my-zsh \
	&& cp /home/node/.oh-my-zsh/templates/zshrc.zsh-template /home/node/.zshrc \
	&& sed -i 's/plugins=(git)/plugins=(git)/g' /home/node/.zshrc \
	&& sed -i 's/ZSH_THEME=.*/ZSH_THEME="robbyrussell"/g' /home/node/.zshrc \
	&& echo "autoload -Uz vcs_info && precmd() { vcs_info } && setopt prompt_subst && PROMPT='%n@%m:%~ %F{green}${vcs_info_msg_0_}%f %# '" >> /home/node/.zshrc \
	&& echo "zstyle ':vcs_info:*' enable git" >> /home/node/.zshrc \
	&& chown -R node:node /home/node/.oh-my-zsh /home/node/.zshrc
RUN sed -i 's#^node:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*#node:x:1000:1000::/home/node:/bin/zsh#' /etc/passwd \
	&& chown -R node:node /home/node

RUN echo 'source /usr/share/git/git-prompt.sh 2>/dev/null' >> /home/node/.bashrc \
 && echo 'export PS1="\u@\h:\w\$(__git_ps1 \" (%s)\")\$ "' >> /home/node/.bashrc \
 && chown node:node /home/node/.bashrc

VOLUME /home/node/.n8n
VOLUME /home/node/.config/git
ENV HOSTNAME=devcontainer
USER node


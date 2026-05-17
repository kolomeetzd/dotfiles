# Source anything in `$ZDOTDIR/conf.d`.
for config in $ZDOTDIR/conf.d/*.zsh; do
  source "$config"
done

# Lazy-load (autoload) Zsh function form `$ZFUNCDIR`.
autoload -Uz $ZFUNCDIR/*(.:t)

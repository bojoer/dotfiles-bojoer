[ -n "$PS1" ] && source ~/.bash_profile

PATH="/Users/Bojoer/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/Bojoer/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/Bojoer/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/Bojoer/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/Bojoer/perl5"; export PERL_MM_OPT;

export NVM_DIR="/Users/Bojoer/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

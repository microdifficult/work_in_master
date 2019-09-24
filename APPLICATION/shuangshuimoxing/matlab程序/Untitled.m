syms rt rwm pore_t swt rwb rwf swb m
solve('rt=((swt*rwb*rwf)/(swb*rwf+(swt-swb)*rwb))/((pore_t^m)*swt^2)','swt')

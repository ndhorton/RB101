# yes it will be mutated after the method executes because
# Hash.[] is a setter method and will change the state of
# the hash object itself (which both the method parameter variable and
# the outer local variable are pointing to)
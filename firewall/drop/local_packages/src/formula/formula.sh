#!/bin/sh

rule_message="Applied from Ritchie CLI"

function apply_rules() {
  sudo iptables -I INPUT -s $NETWORK_ADDRESS -j DROP -m comment --comment $rule_message;
}

function apply_without_params() {

  HOSTNAME=$(hostname -I | cut -d ' ' -f1);
  PARSED_ADDRESS=$(echo $HOSTNAME | sed 's/\./io/g');
  FIRST=$(echo $PARSED_ADDRESS | cut -d 'i' -f1 );
  SECOND=$(echo $PARSED_ADDRESS | cut -d 'i' -f2 | cut -d 'o' -f2 );
  THIRD=$(echo $PARSED_ADDRESS | cut -d 'i' -f3 | cut -d 'o' -f2);

  NETWORK_ADDRESS=$(echo "$(echo $FIRST).$(echo $SECOND).$(echo $THIRD)".0/24);

  sudo iptables -I INPUT -s $NETWORK_ADDRESS -j DROP -m comment --comment $rule_message;
}

runFormula() {
  if [[ $NETWORK_ADDRESS != "unnecessary" ]] 
  then
    apply_rules;
  else
    apply_without_params;
  fi;
}

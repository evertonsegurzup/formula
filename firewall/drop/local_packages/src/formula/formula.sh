#!/bin/sh



function apply_rules() {
  sudo iptables -I INPUT -s $NETWORK_ADDRESS -j DROP;
  sudo iptables -I INPUT -s $GATEWAY_ADDRESS -j ACCEPT;
}

function apply_without_params() {
  
  HOSTNAME=$(hostname -I | cut -d ' ' -f1);
  PARSED_ADDRESS=$(echo $HOSTNAME | sed 's/\./io/g');
  FIRST=$(echo $PARSED_ADDRESS | cut -d 'i' -f1 );
  SECOND=$(echo $PARSED_ADDRESS | cut -d 'i' -f2 | cut -d 'o' -f2 );
  THIRD=$(echo $PARSED_ADDRESS | cut -d 'i' -f3 | cut -d 'o' -f2);

  NETWORK_ADDRESS=$(echo "$(echo $FIRST).$(echo $SECOND).$(echo $THIRD)".0/24);

  sudo iptables -I INPUT -s $NETWORK_ADDRESS -j DROP;
  sudo iptables -I INPUT -s $HOSTNAME -j ACCEPT;
}

runFormula() {
  if [[ $GATEWAY_ADDRESS != "null" ]] 
  then
    apply_rules;
  else
    apply_without_params;
  fi;
}

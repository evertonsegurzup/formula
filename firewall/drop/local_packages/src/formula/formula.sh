#!/bin/sh
runFormula() {
  sudo iptables -I INPUT -s $NETWORK_ADDRESS -j DROP;
  sudo iptables -I INPUT -s $GATEWAY_ADDRESS -j ACCEPT;
}

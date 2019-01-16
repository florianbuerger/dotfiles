function flush-dns
	dscacheutil -flushcache
sudo killall -HUP mDNSResponder
echo "Be sure to reset Google Chrome as well: chrome://net-internals/#dns"
end

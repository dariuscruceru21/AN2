import socket
s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
s.bind(("0.0.0.0", 5555)) # este 0.0.0.0 la ip pentru ca serverul stie ip-ul
s.recvform(5)


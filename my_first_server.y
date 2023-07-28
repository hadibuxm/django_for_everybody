from socket import *

def my_firt_server():
    serversocket = socket(AF_INET, SOCK_STREAM)
    try:
        serversocket.bind(('localhost', 9000))
        serversocket.listen(5)
        while(1):
            (clientsocket, address) = serversocket.accept()
            rd = clientsocket.recv(5000).decode()
            pieces = rd.split('\n')
            if len(pieces)>0:print(pieces[0])
            data  = 'HTTP/1.1 200 OK\r\n'
            data += 'Content-Type: text/html; charset=utf-8\r\n'
            data += '\r\n'
            data += '<html><body>Great things always start by Greetings, Hello World</body></html>'
            clientsocket.sendall(data.encode())
            clientsocket.shutdown(SHUT_WR)
    except KeyboardInterrupt:
        print("\nShutting don...\n")
    except Exception as exc:
        print('Error:\n')
        print(exc)
    serversocket.close()
print("Access http:localhost:9000")
my_firt_server()

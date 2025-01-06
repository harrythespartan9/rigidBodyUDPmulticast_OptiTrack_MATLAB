% create UDP multicast socket
port = 5412;
group = "230.8.6.7";
sock = udpport("LocalPort", port, "EnablePortSharing", true);
configureMulticast(sock, group);

% write stuff
minEnd = 30; % min to kill the process after
timeElap = 0; % time elapsed init
tic
while timeElap < 60*minEnd
    pause(0.5);
    writeData = num2str(rand(1, 2)); % send rand num shit
    write(sock, writeData, group, port);
    timeElap = toc;
end

% destroy socket
configureMulticast(sock, "off")
clear sock
CMD["/bin/bash" "/entrypoint.sh"]
COPYfile:761caf321b211f2565affaa76fcc3be8c1e1ea5d830039bc366acade6daf28bd in /entrypoint.sh
COPYfile:703ea60fe015d4948ef2ac7f3e97c2a2890c297b04608de676ad6982fc2421eb in /libnss_wrapper.so
WORKDIR/home/container
ENVHOME=/home/container
USER[container]
ADDfile:ead0891f0ff8c5a87e5e57baef22ee1bebe88c53375dca8653f4c9b51cc7cb10 in /passwd.template
RUNdpkg --add-architecture i386 && apt-get update && apt-get upgrade -y && apt-get install -y libnss-wrapper gettext-base tar curl gcc g++ libc6 libtbb2 libtbb2:i386 lib32gcc1 lib32stdc++6 lib32tinfo5 lib32z1 libtinfo5:i386 libncurses5:i386 libcurl3-gnutls:i386 && useradd -m -d /home/container -s /bin/bash container && touch ${NSS_WRAPPER_PASSWD} ${NSS_WRAPPER_GROUP} && chgrp 0 ${NSS_WRAPPER_PASSWD} ${NSS_WRAPPER_GROUP} && chmod g+rw ${NSS_WRAPPER_PASSWD} ${NSS_WRAPPER_GROUP}
ENVNSS_WRAPPER_GROUP=/tmp/group
ENVNSS_WRAPPER_PASSWD=/tmp/passwd
ENVUSER_NAME=container
ENVDEBIAN_FRONTEND=noninteractive
MAINTAINERPterodactyl Software, <support@pterodactyl.io>
CMD["/bin/bash"]
RUNmkdir -p /run/systemd && echo 'docker' > /run/systemd/container
RUNrm -rf /var/lib/apt/lists/*
RUNset -xe && echo '#!/bin/sh' > /usr/sbin/policy-rc.d && echo 'exit 101' >> /usr/sbin/policy-rc.d && chmod +x /usr/sbin/policy-rc.d && dpkg-divert --local --rename --add /sbin/initctl && cp -a /usr/sbin/policy-rc.d /sbin/initctl && sed -i 's/^exit.*/exit 0/' /sbin/initctl && echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup && echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean && echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean && echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean && echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages && echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes && echo 'Apt::AutoRemove::SuggestsImportant "false";' > /etc/apt/apt.conf.d/docker-autoremove-suggests
ADDfile:1d7cb45c4e196a6a84319b976b95ce1a9037c40b085e88350c071bf27ff59166 in /

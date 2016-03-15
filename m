Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPKcz5NKMzDq5v
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 14:20:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458012033419191.22254566246795;
 Mon, 14 Mar 2016 20:20:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 0/3] Unused code
Date: Mon, 14 Mar 2016 22:20:29 -0500
Message-Id: <1458012032-16656-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2016 03:20:36 -0000

Wasn't able to compile this to test:
```
$ make
g++ -std=c++14 -fpic -c ipmid.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o ipmid.o
g++ ipmid.o  -lsystemd -rdynamic -o ipmid -ldl
g++ -std=c++14 -fpic -c apphandler.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o apphandler.o
g++ -std=c++14 -fpic -c sensorhandler.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o sensorhandler.o
g++ -std=c++14 -fpic -c storagehandler.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o storagehandler.o
g++ -std=c++14 -fpic -c chassishandler.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o chassishandler.o
g++ -std=c++14 -fpic -c dcmihandler.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o dcmihandler.o
g++ -std=c++14 -fpic -c ipmisensor.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o ipmisensor.o
g++ -std=c++14 -fpic -c storageaddsel.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o storageaddsel.o
g++ -std=c++14 -fpic -c transporthandler.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o transporthandler.o
g++ -std=c++14 -fpic -c globalhandler.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o globalhandler.o
g++ -std=c++14 -fpic -c groupext.C -Wall -Wno-unused-result -lsystemd -I. -O2 -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" -o groupext.o
g++ apphandler.o sensorhandler.o storagehandler.o chassishandler.o dcmihandler.o ipmisensor.o storageaddsel.o transporthandler.o globalhandler.o groupext.o -shared  -lsystemd -rdynamic -o libapphandler.so
cc -Wall -Wno-unused-result   -c -o host-services.o host-services.c
g++ host-services.o -shared  -lsystemd -rdynamic -o libhostservice.so
/usr/bin/ld: host-services.o: relocation R_X86_64_32 against `.rodata' can not be used when making a shared object; recompile with -fPIC
host-services.o: error adding symbols: Bad value
collect2: error: ld returned 1 exit status
Makefile:56: recipe for target 'libhostservice.so' failed
make: *** [libhostservice.so] Error 1

$ g++ --version
g++ (GCC) 5.3.0
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

Did make all the .o's so hopefully it is ok.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-host-ipmid/79)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-host-ipmid/pull/79

Cyril Bur (3):
  Remove unused code
  Remove unused dbus call
  Remove unused variable warnings

 apphandler.C       | 30 ++++++------------------------
 globalhandler.C    |  8 ++------
 ipmid.C            | 42 +++++++++++++-----------------------------
 transporthandler.C | 18 ++++++------------
 4 files changed, 27 insertions(+), 71 deletions(-)

-- 
2.7.1

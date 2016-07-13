Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rqVZC6d3qzDqL5
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2016 06:20:19 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146844121567386.92696613312557;
 Wed, 13 Jul 2016 13:20:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] Enhancing instructions on QEMU
Date: Wed, 13 Jul 2016 15:20:12 -0500
Message-Id: <20160713202012.10446-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160713202012.10446-1-openbmc-patches@stwcx.xyz>
References: <20160713202012.10446-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2016 20:20:21 -0000

From: Chris Austen <austenc@us.ibm.com>

Added step by step details on using QEMU in both a virtual
bridge and tap environment.  Latest features of QEMU palmetto
integration now allow for uboot flash support and ftgmac100
device support.  That means you can start the qemu session
from uboot and run the real ftgmac ethernet device.

Signed-off-by: Chris Austen <austenc@us.ibm.com>
---
 cheatsheet.md | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/cheatsheet.md b/cheatsheet.md
index 873fbf9..37a9c60 100644
--- a/cheatsheet.md
+++ b/cheatsheet.md
@@ -105,6 +105,65 @@ qemu-system-arm \
 
 To quit, type `Ctrl-a c` to switch to the QEMU monitor, and then `quit` to exit.
 
+## Using QEMU With Network capabilities
+
+In an attempt to get a palmetto working model with network capabilties a fork
+was created.  The plan is to merge it back in to the qemu repo but for right now
+the steps required to build, launch and verify are as follows.
+
+Compile a Palmetto flash image via Yocto and locate the file...
+>build/tmp/deploy/images/palmetto/flash-palmetto
+
+```
+git clone git@github.com:legoater/qemu.git
+cd qemu
+git checkout aspeed
+mkdir build
+cd build
+../configure --target-list=arm-softmmu
+make
+cd arm-softmmu
+```
+
+### Use a bridge device
+Using a bridge device requires a bit of root access to set it up.  The benefit
+is your qemu session runs in the bridges subnet so no port forwarding is needed.
+There are packages needed to yourself a virbr0 such as
+```
+apt-get install libvirt libvirt-bin bridge-utils uml-utilities qemu-system-common
+```
+
+```
+./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
+-drive file=<path>/flash-palmetto,format=raw,if=mtd \
+-net nic,macaddr=C0:FF:EE:00:00:02,model=ftgmac100  \
+-net bridge,id=net0,helper=/usr/lib/qemu-bridge-helper,br=virbr0
+```
+
+### Use a tap device
+When running in an environment that does not support you having root you will
+need to forward the model ports.
+```
+./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
+-drive file=<path>/flash-palmetto,format=raw,if=mtd \
+-net nic \
+-net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu \
+
+```
+Now you just need to redirect to communicate...
+```
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST https://localhost:2443/login -d "{\"data\": [ \"root\", \"0penBmc\" ] }"
+```
+or
+```
+ssh -p 2222 root@localhost
+```
+
+There are some other useful parms like that can redirect the console to another
+window.  This results in having an easily accessible qemu command session.
+-monitor stdio -serial pty -nodefaults
+
+
 ## Booting the host
 
 Login:
-- 
2.9.0

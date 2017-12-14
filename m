Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=193.47.165.129; helo=mellanox.co.il;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3yyJtd0dTHzDqRQ
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 03:29:43 +1100 (AEDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 oleksandrs@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 14 Dec 2017 18:29:37 +0200
Received: from r-vnc16.mtr.labs.mlnx (r-vnc16.mtr.labs.mlnx [10.208.0.16])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id vBEGTa6Q019264;
 Thu, 14 Dec 2017 18:29:37 +0200
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: gregkh@linuxfoundation.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 Oleksandr Shamray <oleksandrs@mellanox.com>
Subject: [patch v14 4/4] Documentation: jtag: Add ABI documentation
Date: Thu, 14 Dec 2017 18:29:31 +0200
Message-Id: <1513268971-13518-5-git-send-email-oleksandrs@mellanox.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1513268971-13518-1-git-send-email-oleksandrs@mellanox.com>
References: <1513268971-13518-1-git-send-email-oleksandrs@mellanox.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2017 16:29:46 -0000
X-List-Received-Date: Thu, 14 Dec 2017 16:29:46 -0000
X-List-Received-Date: Thu, 14 Dec 2017 16:29:46 -0000
X-List-Received-Date: Thu, 14 Dec 2017 16:29:46 -0000
X-List-Received-Date: Thu, 14 Dec 2017 16:29:46 -0000

Added document that describe the ABI for JTAG class drivrer

Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v13->v14
v12->v13
v11->v12
Tobias Klauser <tklauser@distanz.ch>
- rename /Documentation/ABI/testing/jatg-dev -> jtag-dev
- Typo: s/interfase/interface
v10->v11
v9->v10
Fixes added by Oleksandr:
- change jtag-cdev to jtag-dev in documentation
- update Kernel Version and Date in jtag-dev documentation;
v8->v9
v7->v8
v6->v7
Comments pointed by Pavel Machek <pavel@ucw.cz>
- Added jtag-cdev documentation to Documentation/ABI/testing folder
---
 Documentation/ABI/testing/jtag-dev |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/ABI/testing/jtag-dev

diff --git a/Documentation/ABI/testing/jtag-dev b/Documentation/ABI/testing/jtag-dev
new file mode 100644
index 0000000..cab867d
--- /dev/null
+++ b/Documentation/ABI/testing/jtag-dev
@@ -0,0 +1,27 @@
+What:		/dev/jtag[0-9]+
+Date:		October 2017
+KernelVersion:	4.15
+Contact:	oleksandrs@mellanox.com
+Description:
+		The misc device files /dev/jtag* are the interface
+		between JTAG master interface and userspace.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include/uapi]<linux/jtag.h>.
+
+		The following file operations are supported:
+
+		open(2)
+		The argument flag currently support only one access
+		mode O_RDWR.
+
+		ioctl(2)
+		Initiate various actions.
+		See the inline documentation in [include/uapi]<linux/jtag.h>
+		for descriptions of all ioctls.
+
+		close(2)
+		Stops and free up the I/O contexts that was associated
+		with the file descriptor.
+
+Users:		TBD
\ No newline at end of file
-- 
1.7.1

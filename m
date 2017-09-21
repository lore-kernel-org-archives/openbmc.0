Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=193.47.165.129; helo=mellanox.co.il;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3xyWS84MN5zDqjC
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 19:25:39 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 oleksandrs@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 21 Sep 2017 12:25:35 +0300
Received: from r-vnc16.mtr.labs.mlnx (r-vnc16.mtr.labs.mlnx [10.208.0.16])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v8L9PYIY006940;
 Thu, 21 Sep 2017 12:25:34 +0300
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: gregkh@linuxfoundation.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@mellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 Oleksandr Shamray <oleksandrs@mellanox.com>
Subject: [patch v9 4/4] Documentation: jtag: Add ABI documentation
Date: Thu, 21 Sep 2017 12:25:32 +0300
Message-Id: <1505985932-27568-5-git-send-email-oleksandrs@mellanox.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1505985932-27568-1-git-send-email-oleksandrs@mellanox.com>
References: <1505985932-27568-1-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Thu, 21 Sep 2017 09:25:46 -0000

Added document that describe the ABI for JTAG class drivrer

Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
---
v8->v9
v7->v8
v6->v7
Comments pointed by Pavel Machek <pavel@ucw.cz>
- Added jtag-cdev documentation to Documentation/ABI/testing folder
---
 Documentation/ABI/testing/jatg-cdev |   27 +++++++++++++++++++++++++++
 MAINTAINERS                         |    1 +
 2 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/ABI/testing/jatg-cdev

diff --git a/Documentation/ABI/testing/jatg-cdev b/Documentation/ABI/testing/jatg-cdev
new file mode 100644
index 0000000..14a3610
--- /dev/null
+++ b/Documentation/ABI/testing/jatg-cdev
@@ -0,0 +1,27 @@
+What:		/dev/jtag[0-9]+
+Date:		September 2017
+KernelVersion:	4.14
+Contact:	oleksandrs@mellanox.com
+Description:
+		The character device files /dev/jtag* are the interface
+		between JTAG master interfase and userspace.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index bfdfa94..dfcf49c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7300,6 +7300,7 @@ F:	include/linux/jtag.h
 F:	include/uapi/linux/jtag.h
 F:	drivers/jtag/
 F:	Documentation/devicetree/bindings/jtag/
+F:	Documentation/ABI/testing/jtag-cdev
 
 K10TEMP HARDWARE MONITORING DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
-- 
1.7.1

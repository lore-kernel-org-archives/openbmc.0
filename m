Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=193.47.165.129; helo=mellanox.co.il;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3zJ84g5crPzF0XF
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jan 2018 03:55:14 +1100 (AEDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 oleksandrs@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 12 Jan 2018 18:55:06 +0200
Received: from r-vnc16.mtr.labs.mlnx (r-vnc16.mtr.labs.mlnx [10.208.0.16])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id w0CGt6Aw030983;
 Fri, 12 Jan 2018 18:55:06 +0200
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: gregkh@linuxfoundation.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [patch v16 1/4] Linux 4.15-rc6
Date: Fri, 12 Jan 2018 18:54:58 +0200
Message-Id: <1515776101-25482-2-git-send-email-oleksandrs@mellanox.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1515776101-25482-1-git-send-email-oleksandrs@mellanox.com>
References: <1515776101-25482-1-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Fri, 12 Jan 2018 16:55:17 -0000
X-List-Received-Date: Fri, 12 Jan 2018 16:55:17 -0000
X-List-Received-Date: Fri, 12 Jan 2018 16:55:17 -0000

From: Linus Torvalds <torvalds@linux-foundation.org>

---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 92b74bc..eb1f597 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 4
 PATCHLEVEL = 15
 SUBLEVEL = 0
-EXTRAVERSION = -rc5
+EXTRAVERSION = -rc6
 NAME = Fearless Coyote
 
 # *DOCUMENTATION*
-- 
1.7.1

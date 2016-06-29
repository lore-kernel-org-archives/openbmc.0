Return-Path: <clg@kaod.org>
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnhl2SsQzDqyR
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:10:47 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id A345AFF9819
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:44 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 6FF2A4400D2;
 Wed, 29 Jun 2016 18:10:41 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 7/9] aspeed: add a common
 Kconfig file for Aspeed boards.
Date: Wed, 29 Jun 2016 18:09:49 +0200
Message-Id: <1467216591-8616-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467216591-8616-1-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17511121254097390338
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudehgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 29 Jun 2016 16:10:48 -0000

We can use to it to include common config options.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/Kconfig     | 4 +---
 board/aspeed/Kconfig | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 board/aspeed/Kconfig

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ee176be22979..bfbeb4842380 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -894,9 +894,7 @@ source "board/vscom/baltos/Kconfig"
 source "board/woodburn/Kconfig"
 source "board/work-microwave/work_92105/Kconfig"
 source "board/zipitz2/Kconfig"
-source "board/aspeed/ast-g5/Kconfig"
-source "board/aspeed/ast-g4/Kconfig"
-source "board/aspeed/witherspoon-bmc/Kconfig"
+source "board/aspeed/Kconfig"
 
 source "arch/arm/Kconfig.debug"
 
diff --git a/board/aspeed/Kconfig b/board/aspeed/Kconfig
new file mode 100644
index 000000000000..a92b9bc0c934
--- /dev/null
+++ b/board/aspeed/Kconfig
@@ -0,0 +1,3 @@
+source "board/aspeed/ast-g5/Kconfig"
+source "board/aspeed/ast-g4/Kconfig"
+source "board/aspeed/witherspoon-bmc/Kconfig"
-- 
2.1.4

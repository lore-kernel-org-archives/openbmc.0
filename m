Return-Path: <clg@kaod.org>
X-Greylist: delayed 30905 seconds by postgrey-1.35 at bilbo;
 Thu, 30 Jun 2016 02:17:44 AEST
Received: from 2.mo3.mail-out.ovh.net (2.mo3.mail-out.ovh.net [46.105.75.36])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnrm6PpMzDqvK
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:17:44 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 3B24EFF980C
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:38 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id DA4C1440097;
 Wed, 29 Jun 2016 18:10:34 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 5/9] aspeed/ast-g4: select the
 correct cpu
Date: Wed, 29 Jun 2016 18:09:47 +0200
Message-Id: <1467216591-8616-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467216591-8616-1-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17509432404873546498
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
X-List-Received-Date: Wed, 29 Jun 2016 16:17:45 -0000

Else the default is a arm v4

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 67a00fccd626..ee176be22979 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -755,6 +755,7 @@ config TARGET_WITHERSPOON_BMC
 
 config TARGET_AST_G4
        bool "Support ast2400"
+       select CPU_ARM926EJS
 
 endchoice
 
-- 
2.1.4

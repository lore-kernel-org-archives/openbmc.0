Return-Path: <clg@kaod.org>
X-Greylist: delayed 1812 seconds by postgrey-1.36 at bilbo;
 Mon, 06 Mar 2017 19:43:02 AEDT
Received: from 2.mo68.mail-out.ovh.net (2.mo68.mail-out.ovh.net
 [46.105.52.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vcCwk18GDzDqFh
 for <openbmc@lists.ozlabs.org>; Mon,  6 Mar 2017 19:43:01 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id B8AA1404F2
 for <openbmc@lists.ozlabs.org>; Mon,  6 Mar 2017 09:04:54 +0100 (CET)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 80996180072;
 Mon,  6 Mar 2017 09:04:52 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.7] ARM: dts: aspeed: romulus: remove second BMC
 flash
Date: Mon,  6 Mar 2017 09:04:47 +0100
Message-Id: <1488787487-12257-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1740078307049114370
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrfeelgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Mar 2017 08:43:05 -0000

Romulus systems have only one MX25L25635 (32768 Kbytes) flash module
for the BMC firmware and other MT25QL512A (65536 Kbytes) for the host.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts |    5 -----
 1 file changed, 5 deletions(-)

Index: linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
===================================================================
--- linux-openbmc-4.7.git.orig/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -51,11 +51,6 @@
 		m25p,fast-read;
 #include "aspeed-bmc-opp-flash-layout.dtsi"
 	};
-	flash@1 {
-		status = "okay";
-		label = "alt";
-		m25p,fast-read;
-	};
 };
 
 &spi1 {

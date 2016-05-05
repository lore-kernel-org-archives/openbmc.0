Return-Path: <cyrilbur@gmail.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0ckM54LGzDq5g
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:28:43 +1000 (AEST)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 5 May 2016 11:28:42 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 5 May 2016 11:28:40 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: cyrilbur@gmail.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 6ECB33578057
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:28:40 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u451SW5R10092670
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:28:40 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u451S8M0020207
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:28:08 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u451S7iV019771; Thu, 5 May 2016 11:28:07 +1000
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 13807A02D4;
 Thu,  5 May 2016 11:27:40 +1000 (AEST)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: gwshan@linux.vnet.ibm.com
Subject: [PATCH 2/6] arm/dts/aspeed: Move mac nsci properties
Date: Thu,  5 May 2016 11:27:12 +1000
Message-Id: <1462411636-7225-3-git-send-email-cyrilbur@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050501-0009-0000-0000-000007101E6E
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
X-List-Received-Date: Thu, 05 May 2016 01:28:43 -0000

From: Joel Stanley <joel@jms.id.au>

We have boards that don't use nsci, so make this specific to the
palmetto and barreleyes.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 5 +++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 5 +++++
 arch/arm/boot/dts/ast2400.dtsi                 | 2 --
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 143292b6..a06252a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -7,6 +7,11 @@
 	model = "Barrelye BMC";
 	compatible = "rackspace,barreleye-bmc", "aspeed,ast2400";
 	ahb {
+		mac0: ethernet@1e660000 {
+			use-nc-si;
+			no-hw-checksum;
+		};
+
 		fmc@1e620000 {
 			reg = < 0x1e620000 0x94
 				0x20000000 0x02000000 >;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index c78a2f5..cde194e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -8,6 +8,11 @@
 	compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
 
 	ahb {
+		mac0: ethernet@1e660000 {
+			use-nc-si;
+			no-hw-checksum;
+		};
+
 		fmc@1e620000 {
 			reg = < 0x1e620000 0x94
 				0x20000000 0x02000000 >;
diff --git a/arch/arm/boot/dts/ast2400.dtsi b/arch/arm/boot/dts/ast2400.dtsi
index 49516fd..e1100f0 100644
--- a/arch/arm/boot/dts/ast2400.dtsi
+++ b/arch/arm/boot/dts/ast2400.dtsi
@@ -69,8 +69,6 @@
 			compatible = "faraday,ftgmac100", "aspeed,ast2400-mac";
 			reg = <0x1e660000 0x180>;
 			interrupts = <2>;
-			use-nc-si;
-			no-hw-checksum;
 		};
 
 		apb {
-- 
2.8.2

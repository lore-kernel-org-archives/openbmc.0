Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 928311A03B8
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:31 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536767691547.8138113965595;
 Thu, 22 Oct 2015 10:59:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 07/13] misc/bt-host: use a more explicit compatible
 string
Date: Thu, 22 Oct 2015 12:59:07 -0500
Message-Id: <1445536753-14352-8-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445536753-14352-1-git-send-email-patches@stwcx.xyz>
References: <1445536753-14352-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:32 -0000

From: Jeremy Kerr <jk@ozlabs.org>

The interface we're using here is specific to the aspeed
hardware implementation.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 2 +-
 drivers/misc/bt-host.c                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 4afa8ce8..31ed882 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -87,7 +87,7 @@
 			};
 
 			ibt@1e789150 {
-				compatible = "bt-host";
+				compatible = "aspeed,bt-host";
 				reg = <0x1e789140 0x18>;
 			};
 
diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 90713c5..f96137e 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -313,7 +313,7 @@ static int bt_host_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id bt_host_match[] = {
-	{ .compatible = "bt-host" },
+	{ .compatible = "aspeed,bt-host" },
 	{ },
 };
 
-- 
2.6.0

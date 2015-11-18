Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8887A1A06A7
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 15:10:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447819822322197.794610623136;
 Tue, 17 Nov 2015 20:10:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2 2/2] misc/bt-host: Use devm_ioremap_resource()
Date: Tue, 17 Nov 2015 23:10:19 -0500
Message-Id: <1447819819-21180-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447819819-21180-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447819819-21180-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 Nov 2015 04:10:30 -0000

From: Jeremy Kerr <jk@ozlabs.org>

No need to unpack struct resource, and we don't need ioremap_uncached
here.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 7b5206e..105d3fc 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -333,8 +333,7 @@ static int bt_host_probe(struct platform_device *pdev)
 		goto out_free;
 	}
 
-	bt_host->base = devm_ioremap_nocache(&pdev->dev, res->start,
-						resource_size(res));
+	bt_host->base = devm_ioremap_resource(&pdev->dev, res);
 	if (!bt_host->base) {
 		rc = -ENOMEM;
 		goto out_free;
-- 
2.6.3

Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6A7081A0754
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 22:06:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447323631748468.11224218001905;
 Thu, 12 Nov 2015 02:20:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH kernel-hwmon-occ 09/10] output temp*_input in millidegree
 Celsius
Date: Thu, 12 Nov 2015 05:20:11 -0500
Message-Id: <1447323612-15427-10-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 11:06:47 -0000

From: adamliyi <adamliyi@msn.com>

---
 occ.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/occ.c b/occ.c
index 7ae59e6..8b74c8c 100644
--- a/occ.c
+++ b/occ.c
@@ -632,7 +632,8 @@ static ssize_t show_occ_temp_input(struct device *dev, struct device_attribute *
 
 	//printk("block_id: %d, sensor: %d\n", data->occ_resp->temp_block_id, n -1);	
 	sensor = &data->occ_resp->data.blocks[data->occ_resp->temp_block_id].sensor[n - 1];
-	val = sensor->value;
+	/* in millidegree Celsius */
+	val = sensor->value * 1000;
 	//printk("temp%d sensor value: %d\n", n, val);
 
 	//printk("------------- above are debug message, bellow is real output------------\n");	
-- 
2.6.3

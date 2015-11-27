Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9975C1A013E
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 17:40:51 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448606445005550.0791660057145;
 Thu, 26 Nov 2015 22:40:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v5 18/18] Init BMC_THROTTLE GPIO to high
Date: Fri, 27 Nov 2015 01:40:31 -0500
Message-Id: <1448606431-24037-19-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448606431-24037-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448606431-24037-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 27 Nov 2015 06:40:52 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 objects/control_host_obj.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/objects/control_host_obj.c b/objects/control_host_obj.c
index 672ef85..9297e52 100644
--- a/objects/control_host_obj.c
+++ b/objects/control_host_obj.c
@@ -21,6 +21,7 @@ GPIO fsi_data     = (GPIO){ "FSI_DATA" };
 GPIO fsi_clk      = (GPIO){ "FSI_CLK" };
 GPIO fsi_enable   = (GPIO){ "FSI_ENABLE" };
 GPIO cronus_sel   = (GPIO){ "CRONUS_SEL" };
+GPIO Throttle     = (GPIO){ "BMC_TROTTLE" };
 
 /* Bit bang patterns */
 
@@ -82,6 +83,9 @@ on_boot         (ControlHost        *host,
 {
 	int rc = GPIO_OK;
 
+	rc = gpio_open(&Throttle);
+	rc = gpio_write(&Throttle,1);
+
 	if (control_host_get_debug_mode(host)==1)
 	{
 		g_print("Enabling debug mode; not booting host\n");
@@ -165,7 +169,7 @@ on_boot         (ControlHost        *host,
 	gpio_close(&fsi_data);
 	gpio_close(&fsi_enable);
 	gpio_close(&cronus_sel);
-
+	gpio_close(&Throttle);
 	control_host_emit_booted(host);
 	return TRUE;
 }
-- 
2.6.3

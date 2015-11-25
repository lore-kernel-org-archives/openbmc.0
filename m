Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9BB801A034F
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:10:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448435428141284.5420430633948;
 Tue, 24 Nov 2015 23:10:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 3/7] host-services: Add ipmid-api header
Date: Wed, 25 Nov 2015 02:10:20 -0500
Message-Id: <1448435424-9067-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:10:32 -0000

From: Joel Stanley <joel@jms.id.au>

Needed for a prototype for ipmid_get_sd_bus_connection.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 host-services.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/host-services.c b/host-services.c
index 89f0b6c..ab9cfcc 100644
--- a/host-services.c
+++ b/host-services.c
@@ -3,6 +3,8 @@
 #include <errno.h>
 #include <systemd/sd-bus.h>
 
+#include "ipmid-api.h"
+
 // OpenBMC Host IPMI dbus framework
 const char  *bus_name      =  "org.openbmc.HostIpmi";
 const char  *object_name   =  "/org/openbmc/HostIpmi/1";
@@ -38,7 +40,7 @@ static int soft_power_off(sd_bus_message *m, void *userdata, sd_bus_error *ret_e
     sd_bus_error bus_error = SD_BUS_ERROR_NULL;
 
 	// Gets a hook onto either a SYSTEM or SESSION bus
-	sd_bus *bus = (sd_bus *)ipmid_get_sd_bus_connection();
+	sd_bus *bus = ipmid_get_sd_bus_connection();
 
 	rc = sd_bus_call_method(bus,        // On the System Bus
 							bus_name,        // Service to contact
-- 
2.6.3

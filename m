Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5DEB91A1AFC
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482038765843.6077239394965;
 Fri, 18 Dec 2015 15:40:38 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 04/15] sync to
 14caa527e0b10e0aece119693bf003ec95929370
Date: Fri, 18 Dec 2015 17:40:24 -0600
Message-Id: <1450482035-4530-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:51 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 objects/control_bmc_obj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/objects/control_bmc_obj.c b/objects/control_bmc_obj.c
index ae2827e..6b92235 100644
--- a/objects/control_bmc_obj.c
+++ b/objects/control_bmc_obj.c
@@ -85,6 +85,7 @@ void reg_init()
 	//GPIO
 	bmcreg = memmap(mem_fd,GPIO_BASE);
 	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
+        devmem(bmcreg+0x70,0x120CE406);
 	devmem(bmcreg+0x80,0xCB000000);
 	devmem(bmcreg+0x88,0x01C000FF);
 	devmem(bmcreg+0x8c,0xC1C000FF);
-- 
2.6.3

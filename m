Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r00MY5h6BzDqDJ
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2016 11:10:17 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462324211563435.95717831950105;
 Tue, 3 May 2016 18:10:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v4 2/6] Increase debugging output when receiving a
 response to message from dbus
Date: Tue,  3 May 2016 20:10:04 -0500
Message-Id: <1462324208-11150-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 May 2016 01:10:18 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 btbridged.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/btbridged.c b/btbridged.c
index 3e261a9..be25eb9 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -317,6 +317,8 @@ static int method_send_message(sd_bus_message *msg, void *userdata, sd_bus_error
 		goto out;
 	}
 	MSG_OUT("Received a dbus response for msg with seq 0x%02x\n", seq);
+	MSG_OUT("(netfn 0x%02x lun 0x%02x cmd 0x%02x cc 0x%02x with data of size %lu)\n",
+			netfn, lun, cmd, cc, data_sz);
 	bt_msg->call = sd_bus_message_ref(msg);
 	bt_msg->rsp.netfn = netfn;
 	bt_msg->rsp.lun = lun;
-- 
2.8.1

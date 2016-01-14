Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 232DE1A17E4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 16:50:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452750609670389.65364474888156;
 Wed, 13 Jan 2016 21:50:09 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge 2/3] Increase debugging output when receiving a
 response to message from dbus
Date: Wed, 13 Jan 2016 23:50:06 -0600
Message-Id: <1452750607-27095-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452750607-27095-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452750607-27095-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 14 Jan 2016 05:50:16 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 btbridged.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/btbridged.c b/btbridged.c
index 3e261a9..f1aac59 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -317,6 +317,8 @@ static int method_send_message(sd_bus_message *msg, void *userdata, sd_bus_error
 		goto out;
 	}
 	MSG_OUT("Received a dbus response for msg with seq 0x%02x\n", seq);
+	MSG_OUT("(netfn 0x%02x lun 0x%02x cmd 0x%02x cc 0x%02x with data of size %llu)\n",
+			netfn, lun, cmd, cc, data_sz);
 	bt_msg->call = sd_bus_message_ref(msg);
 	bt_msg->rsp.netfn = netfn;
 	bt_msg->rsp.lun = lun;
-- 
2.6.4

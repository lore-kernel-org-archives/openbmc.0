Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CEA711A004E
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 13:40:57 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453084838008125.28176597600202;
 Sun, 17 Jan 2016 18:40:38 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v5 2/5] Initial fan LED status
Date: Sun, 17 Jan 2016 20:40:32 -0600
Message-Id: <1453084835-12886-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453084835-12886-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453084835-12886-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Jan 2016 02:40:58 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/startup_hacks.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/bin/startup_hacks.sh b/bin/startup_hacks.sh
index 18582ae..02fd3a8 100755
--- a/bin/startup_hacks.sh
+++ b/bin/startup_hacks.sh
@@ -2,3 +2,10 @@
 
 systemctl stop serial-getty@ttyS0
 
+# Set to output pin
+i2cset -y 0x06 0x20 0x06 0x00
+i2cset -y 0x06 0x20 0x07 0x00
+
+# Turn on all fan LED to BLUE
+i2cset -y 0x06 0x20 0x03 0x55
+i2cset -y 0x06 0x20 0x02 0xaa
-- 
2.6.4

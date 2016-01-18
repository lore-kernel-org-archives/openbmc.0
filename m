Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7B9521A003F
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 17:47:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453099209576806.7991236767374;
 Sun, 17 Jan 2016 22:40:09 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] Update cheatsheet.md
Date: Mon, 18 Jan 2016 00:40:08 -0600
Message-Id: <1453099208-19798-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453099208-19798-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453099208-19798-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Jan 2016 06:47:51 -0000

From: Joel Stanley <joel@jms.id.au>

---
 cheatsheet.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cheatsheet.md b/cheatsheet.md
index 530f6c0..2f9fc15 100644
--- a/cheatsheet.md
+++ b/cheatsheet.md
@@ -50,7 +50,7 @@ You can reconfigure your build by removing the build/conf dir:
 ```
 rm -rf build/conf
 ```
-and running `oe-init-build-env` again (possibly with `TEMPLATE_CONF` set).
+and running `oe-init-build-env` again (possibly with `TEMPLATECONF` set).
 
 ## Useful dbus CLI tools
 
-- 
2.6.4

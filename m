Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5B0FD1A0008
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 14:20:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456370428677268.4140632848679;
 Wed, 24 Feb 2016 19:20:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux] net/ncsi: Fix possible deadlock caught with lockdep
Date: Wed, 24 Feb 2016 21:20:26 -0600
Message-Id: <1456370426-11311-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456370426-11311-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456370426-11311-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 25 Feb 2016 03:20:32 -0000

From: Cyril Bur <cyrilbur@gmail.com>

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 net/ncsi/ncsi-manage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 24ff6c2..ef1de7f 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -907,10 +907,10 @@ void ncsi_stop_dev(struct ncsi_dev *nd)
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
 	struct ncsi_package *tmp, *np;
 
-	spin_lock(&ndp->ndp_package_lock);
+	spin_lock_bh(&ndp->ndp_package_lock);
 	list_for_each_entry_safe(np, tmp, &ndp->ndp_packages, np_node)
 		ncsi_release_package(np);
-	spin_unlock(&ndp->ndp_package_lock);
+	spin_unlock_bh(&ndp->ndp_package_lock);
 }
 EXPORT_SYMBOL_GPL(ncsi_stop_dev);
 
-- 
2.7.1

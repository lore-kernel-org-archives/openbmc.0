Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.158])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 983CC1A0464
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 00:15:23 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144595162110625.463693035061624;
 Tue, 27 Oct 2015 06:13:41 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 1/4] Remove executable permissions in
 source files
Date: Tue, 27 Oct 2015 08:13:35 -0500
Message-Id: <1445951618-17631-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445951618-17631-1-git-send-email-patches@stwcx.xyz>
References: <1445951618-17631-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 13:15:24 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 Makefile     | 0
 apphandler.C | 0
 ipmid-api.h  | 0
 ipmid.H      | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 Makefile
 mode change 100755 => 100644 apphandler.C
 mode change 100755 => 100644 ipmid-api.h
 mode change 100755 => 100644 ipmid.H

diff --git a/Makefile b/Makefile
old mode 100755
new mode 100644
diff --git a/apphandler.C b/apphandler.C
old mode 100755
new mode 100644
diff --git a/ipmid-api.h b/ipmid-api.h
old mode 100755
new mode 100644
diff --git a/ipmid.H b/ipmid.H
old mode 100755
new mode 100644
-- 
2.6.0

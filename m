Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D72AA1A0E27
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 13:37:11 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446086227809168.36506305336275;
 Wed, 28 Oct 2015 19:37:07 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 1/4] Remove executable permissions in
 source files
Date: Wed, 28 Oct 2015 21:37:02 -0500
Message-Id: <1446086225-30746-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446086225-30746-1-git-send-email-patches@stwcx.xyz>
References: <1446086225-30746-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 02:37:12 -0000

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

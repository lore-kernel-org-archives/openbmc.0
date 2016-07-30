Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s1S1x1gqDzDrQV
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jul 2016 11:00:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1469840416370999.6016797972579;
 Fri, 29 Jul 2016 18:00:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: sivassrr <sivas.srr@in.ibm.com>
Subject: [PATCH docs] Update dbus-interfaces.md
Date: Fri, 29 Jul 2016 20:00:14 -0500
Message-Id: <20160730010014.31545-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160730010014.31545-1-openbmc-patches@stwcx.xyz>
References: <20160730010014.31545-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 30 Jul 2016 01:00:21 -0000

From: sivassrr <sivas.srr@in.ibm.com>

---
 dbus-interfaces.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index 84e75c3..c207a0a 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -44,7 +44,7 @@ firmware.
 ### signals
 | name          | signature | description                                      |
 | ------------- | --------- | ------------------------------------------------ |
-| `ReceivedMsg` | `yyyyay`  | **An IPMI message was received from the host processor firmware.**|
+| `ReceivedMessage` | `yyyyay`  | **An IPMI message was received from the host processor firmware.**|
 |               | `y`       | IPMI seq.                                        |
 |               | `y`       | IPMI netfn.                                      |
 |               | `y`       | IPMI lun.                                        |
-- 
2.9.0

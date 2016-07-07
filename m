Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlv4F6BxnzDr52
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 09:30:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467934217420709.7434458155043;
 Thu, 7 Jul 2016 16:30:17 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 1/2] Update dbus-interfaces.md
Date: Thu,  7 Jul 2016 18:30:14 -0500
Message-Id: <20160707233015.9687-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160707233015.9687-1-openbmc-patches@stwcx.xyz>
References: <20160707233015.9687-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 07 Jul 2016 23:30:22 -0000

From: Chris Austen <austenc@us.ibm.com>

dbus-interfaces: Add org.openbmc.control.BmcFlash.update method
Signed-off-by: Chris Austen <austenc@us.ibm.com>
---
 dbus-interfaces.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index 524bc3f..f4e043d 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -311,6 +311,8 @@ The control.BmcFlash interface allows applications update the BMC firmware.
 | `updateViaTftp` | `ss`         | `void`        | **Perform a BMC firmware update using a TFTP server.**|
 |                 | `s`          |               | The ipv4 address of the TFTP server hosting the firmware image file.|
 |                 | `s`          |               | The name of the file containing the BMC firmware image.|
+| `update`        | `s`          | `void`        | **Perform a BMC firmware update with a file already on the BMC.**|
+|                 | `s`          |               | The name of the file containing the BMC firmware image.|
 
 ### signals
 | name           | signature | description                              |
-- 
2.9.0

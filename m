Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rh0Gq6l6jzDql5
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jul 2016 01:10:59 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467385853873684.2446514764765;
 Fri, 1 Jul 2016 08:10:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] hwmon: attribute is not polled after failure
Date: Fri,  1 Jul 2016 10:10:52 -0500
Message-Id: <20160701151052.15601-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160701151052.15601-1-openbmc-patches@stwcx.xyz>
References: <20160701151052.15601-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 01 Jul 2016 15:11:00 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This line of code was removed with revert bd01c24d (original efc68970)
but should not have been.  The line was originally added with 6956bbd4.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 pyhwmon/hwmon.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pyhwmon/hwmon.py b/pyhwmon/hwmon.py
index e5dc19a..bb363dc 100644
--- a/pyhwmon/hwmon.py
+++ b/pyhwmon/hwmon.py
@@ -65,6 +65,7 @@ class Hwmons():
 				self.writeAttribute(attribute,rtn[1])
 		except:
 			print "HWMON: Attibute no longer exists: "+attribute
+			self.sensors.pop(objpath,None)
 			return False
 
 
-- 
2.9.0

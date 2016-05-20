Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rBMNN3DwkzDqHT
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2016 08:01:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146378170923875.23843756439635;
 Fri, 20 May 2016 15:01:49 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Add update rest interface to bmc
Date: Fri, 20 May 2016 17:01:47 -0500
Message-Id: <1463781707-16237-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463781707-16237-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463781707-16237-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 20 May 2016 22:01:56 -0000

From: Chris Austen <austenc@us.ibm.com>

Currentling /org/openbmc/control/flash/bmc only has updateViaTftp
I am adding the update method to allow for bmc code updates with
requiring a remote tftp server.

Something like this will now work.  Ofcourse the update method is not in charge of getting the code on to the bmc server.  That's the job of something else (i.e. scp)
curl -k -H "Content-Type: application/json" -x POST -d "{\"data\": [\"/tmp/flash-barreleye\"]}" https://<ip>/org/openbmc/control/flash/bmc/action/update
---
 bin/bmc_update.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/bin/bmc_update.py b/bin/bmc_update.py
index a3032cf..5d66be2 100755
--- a/bin/bmc_update.py
+++ b/bin/bmc_update.py
@@ -49,6 +49,12 @@ class BmcFlashControl(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		self.TftpDownload(ip,filename)
 		self.Set(DBUS_NAME,"status","Downloading")
 		
+	@dbus.service.method(DBUS_NAME,
+		in_signature='s', out_signature='')
+	def update(self,filename):
+		self.Set(DBUS_NAME,"filename",filename)
+		self.download_complete_handler(filename, filename)
+
 	@dbus.service.signal(DOWNLOAD_INTF,signature='ss')
 	def TftpDownload(self,ip,filename):
 		self.Set(DBUS_NAME,"filename",filename)
-- 
2.8.2

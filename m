Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1A0161A045F
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 00:14:04 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445951628216292.3788473962878;
 Tue, 27 Oct 2015 06:13:48 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 4/4] ipmid: Fix crash on scandir failure
Date: Tue, 27 Oct 2015 08:13:38 -0500
Message-Id: <1445951618-17631-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445951618-17631-1-git-send-email-patches@stwcx.xyz>
References: <1445951618-17631-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 27 Oct 2015 13:14:05 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Curently, if I have no ipmi_lib_path, ipmid crashes:

  $ ./ipmid
  Registering handler:[/usr/lib/host-ipmid/H��dH�%(]
  ERROR opening [/usr/lib/host-ipmid/H��dH�%(]: /usr/lib/host-ipmid/H��dH�%(: cannot open shared object file: No such file or directory
  *** Error in `./ipmid': munmap_chunk(): invalid pointer: 0x0000000000401eb6 ***
  Aborted (core dumped)

We need to check for the error case of a scandir().

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 ipmid.C | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ipmid.C b/ipmid.C
index 5528641..11dcb61 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -341,6 +341,9 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
         handler_fqdn += "/";
 
         num_handlers = scandir(ipmi_lib_path, &handler_list, handler_select, alphasort);
+	if (num_handlers < 0)
+		return;
+
         while(num_handlers--)
         {
             handler_fqdn = ipmi_lib_path;
-- 
2.6.0

Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CCBAD1A03DB
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 00:12:16 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446469933077805.4325710092107;
 Mon, 2 Nov 2015 05:12:13 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update rest-dbus
Date: Mon,  2 Nov 2015 07:12:10 -0600
Message-Id: <1446469931-23318-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Mon, 02 Nov 2015 13:12:17 -0000

Removed upstreamed patches to makefile.
Updated path in systemd service file.
Add dependency on mapper.

https://github.com/openbmc/openbmc/pull/61

Brad Bishop (1):
  Update rest-dbus

 .../rest-dbus/files/makefile.patch                 | 24 ----------------------
 .../rest-dbus/files/no-session-bus.patch           | 12 -----------
 .../rest-dbus/files/resources-path.patch           | 13 ------------
 .../rest-dbus/files/rest-dbus.service              |  2 +-
 .../common/recipes-phosphor/rest-dbus/rest-dbus.bb | 13 +++++-------
 5 files changed, 6 insertions(+), 58 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/rest-dbus/files/makefile.patch
 delete mode 100644 meta-phosphor/common/recipes-phosphor/rest-dbus/files/no-session-bus.patch
 delete mode 100644 meta-phosphor/common/recipes-phosphor/rest-dbus/files/resources-path.patch

-- 
2.6.0

Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3EBA31A0464
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 00:14:16 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445951619564496.5898306099349;
 Tue, 27 Oct 2015 06:13:39 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: OpenBMC Patches <patches@stwcx.xyz>
Subject: [PATCH phosphor-host-ipmid 0/4] dbus interface fixes
Date: Tue, 27 Oct 2015 08:13:34 -0500
Message-Id: <1445951618-17631-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <1445951618-17631-1-git-send-email-patches@stwcx.xyz>+zmo_0_<patches@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Tue, 27 Oct 2015 13:14:16 -0000

With these changes, I can get ipmid talking to our dbus-enabled ipmitool.

https://github.com/openbmc/phosphor-host-ipmid/pull/23

Jeremy Kerr (4):
  Remove executable permissions in source files
  ipmid: Remove assumptions about host IPMI sender objects
  ipmid: Use updated dbus HostIpmi interface
  ipmid: Fix crash on scandir failure

 Makefile     |  0
 apphandler.C |  0
 ipmid-api.h  | 20 ++++++++++----------
 ipmid.C      | 30 ++++++++++++++++--------------
 ipmid.H      |  0
 5 files changed, 26 insertions(+), 24 deletions(-)
 mode change 100755 => 100644 Makefile
 mode change 100755 => 100644 apphandler.C
 mode change 100755 => 100644 ipmid-api.h
 mode change 100755 => 100644 ipmid.H

-- 
2.6.0

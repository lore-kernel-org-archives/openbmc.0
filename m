Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 370A81A0E27
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 13:37:08 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446086226381917.583875732995;
 Wed, 28 Oct 2015 19:37:06 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 0/4] dbus interface fixes
Date: Wed, 28 Oct 2015 21:37:01 -0500
Message-Id: <1446086225-30746-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Thu, 29 Oct 2015 02:37:10 -0000

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

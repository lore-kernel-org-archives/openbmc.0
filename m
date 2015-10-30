Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E49A01A01C9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 14:54:09 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446177246737634.6908405467167;
 Thu, 29 Oct 2015 20:54:06 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v3 0/4] Various fixes to btbridged
Date: Thu, 29 Oct 2015 22:54:01 -0500
Message-Id: <1446177245-24974-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 03:54:11 -0000

Also threw in a simple Makefile improvement 

https://github.com/openbmc/btbridge/pull/3

Cyril Bur (4):
  Remove logic to check for message resends.
  Use builtin make rules
  Follow dbus naming convention for dbus signal
  Respect the /org/openbmc/HostIpmi interface

 Makefile    |  6 +++---
 btbridged.c | 36 +++++++++---------------------------
 2 files changed, 12 insertions(+), 30 deletions(-)

-- 
2.6.0

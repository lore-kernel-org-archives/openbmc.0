Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 963951A0521
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 14:44:59 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446176696659732.3118693877112;
 Thu, 29 Oct 2015 20:44:56 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v2 0/3] Remove tracking of last seq number fixes #2
Date: Thu, 29 Oct 2015 22:44:52 -0500
Message-Id: <1446176695-22945-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 03:45:00 -0000

Also threw in a simple Makefile improvement 

https://github.com/openbmc/btbridge/pull/3

Cyril Bur (3):
  Remove logic to check for message resends.
  Use builtin make rules
  Follow dbus naming convention for dbus signal

 Makefile    |  6 +++---
 btbridged.c | 24 +++---------------------
 2 files changed, 6 insertions(+), 24 deletions(-)

-- 
2.6.0

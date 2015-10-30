Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3FEF21A0CCF
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:19 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208936240779.2230049784298;
 Fri, 30 Oct 2015 05:42:16 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v4 0/8] Various fixes to btbridged
Date: Fri, 30 Oct 2015 07:42:06 -0500
Message-Id: <1446208934-25969-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:20 -0000

Also threw in a simple Makefile improvement 

https://github.com/openbmc/btbridge/pull/3

Cyril Bur (8):
  Remove logic to check for message resends.
  Use builtin make rules
  Follow dbus naming convention for dbus signal
  Respect the /org/openbmc/HostIpmi interface
  Fix incorrect sending of data bytes by ReceivedMessage signal
  Don't exit on short reads just ignore
  Improve debugging
  Makefile improvements, clean target

 Makefile    |  11 +++++--
 btbridged.c | 104 +++++++++++++++++++++++++++++++++++++-----------------------
 2 files changed, 73 insertions(+), 42 deletions(-)

-- 
2.6.0

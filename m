Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 312411A0ABE
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:57:22 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259440324194.9098603329512;
 Mon, 19 Oct 2015 05:57:20 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 0/7] Virtualsensor
Date: Mon, 19 Oct 2015 07:57:12 -0500
Message-Id: <1445259439-10608-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:57:23 -0000

Add code for 0x0F system Firmware boot sensor

https://github.com/openbmc/phosphor-host-ipmid/pull/6

Chris Austen (7):
  Print the dlopen failure for debugging
  Add routines for getting lookup data from the system dbus object
  Suport examining sensor records and calling dbus
  Added testcases for sensor record parsing
  Add virtual sensor support
  C7 and & virtual sensor support
  buffer overrun in sensor handling

 Makefile        |  16 +++-
 ipmid.C         | 167 ++++++++++++++++++++++++++++++++++++++++-
 ipmisensor.C    | 228 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sensorhandler.C |   8 +-
 testit.C        | 166 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 579 insertions(+), 6 deletions(-)
 create mode 100644 ipmisensor.C
 create mode 100644 testit.C

-- 
2.6.0

Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C2D671A0661
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:21:00 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444998057213646.8291533090353;
 Fri, 16 Oct 2015 05:20:57 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 0/5] Virtualsensor
Date: Fri, 16 Oct 2015 07:20:50 -0500
Message-Id: <1444998055-17954-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 12:21:01 -0000

Add code for 0x0F system Firmware boot sensor

https://github.com/openbmc/phosphor-host-ipmid/pull/6

Chris Austen (5):
  Print the dlopen failure for debugging
  Add routines for getting lookup data from the system dbus object
  Suport examining sensor records and calling dbus
  Added testcases for sensor record parsing
  Add virtual sensor support

 Makefile        |  16 ++++-
 ipmid.C         | 167 ++++++++++++++++++++++++++++++++++++++++++++-
 ipmisensor.C    | 207 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sensorhandler.C |   8 ++-
 testit.C        | 166 +++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 558 insertions(+), 6 deletions(-)
 create mode 100644 ipmisensor.C
 create mode 100644 testit.C

-- 
2.6.0

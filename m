Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0B8011A081F
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 13:13:38 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445048014411660.1533453484882;
 Fri, 16 Oct 2015 19:13:34 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 0/5] Added Sensors -> dbus states
Date: Fri, 16 Oct 2015 21:13:27 -0500
Message-Id: <1445048012-11082-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 17 Oct 2015 02:13:39 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/8

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

Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453EF1A08DF
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 02:43:30 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444923807433591.399680692875;
 Thu, 15 Oct 2015 08:43:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 0/4] Print the dlopen failure for debugging
Date: Thu, 15 Oct 2015 10:43:19 -0500
Message-Id: <1444923803-24688-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 15 Oct 2015 15:43:30 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/5

Chris Austen (4):
  Print the dlopen failure for debugging
  Add routines for getting lookup data from the system dbus object
  Suport examining sensor records and calling dbus
  Added testcases for sensor record parsing

 Makefile        |  15 ++++--
 ipmid.C         | 123 +++++++++++++++++++++++++++++++++++++++++-
 ipmisensor.C    | 119 +++++++++++++++++++++++++++++++++++++++++
 sensorhandler.C |   8 ++-
 testit.C        | 162 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 421 insertions(+), 6 deletions(-)
 create mode 100644 ipmisensor.C
 create mode 100644 testit.C

-- 
2.6.0

Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3B8B91A08F1
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 07:29:47 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445027383853929.4720342402983;
 Fri, 16 Oct 2015 13:29:43 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem v3 0/7] B1 Added oem so and test
 program
Date: Fri, 16 Oct 2015 15:29:34 -0500
Message-Id: <1445027381-30153-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 20:29:48 -0000

https://github.com/openbmc/openpower-host-ipmi-oem/pull/1

Chris Austen (7):
  Support OpenPOWERs OEM commands on openbmc
  Add a test framework for the .so
  Fixes from Joel review
  fixed #define issue with byte swapping
  fix build break with array of pointers
  Clean up Makefile
  Fixed string pointer usage

 Makefile     |  27 ++++++++++++
 README.md    |   1 +
 ipmid-api.h  |  83 +++++++++++++++++++++++++++++++++++
 ipmid.H      |  15 +++++++
 oemhandler.C |  91 ++++++++++++++++++++++++++++++++++++++
 oemhandler.h |  32 ++++++++++++++
 testit.C     | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 testit.h     |  14 ++++++
 8 files changed, 404 insertions(+)
 create mode 100644 Makefile
 create mode 100644 README.md
 create mode 100644 ipmid-api.h
 create mode 100644 ipmid.H
 create mode 100644 oemhandler.C
 create mode 100644 oemhandler.h
 create mode 100644 testit.C
 create mode 100644 testit.h

-- 
2.6.0

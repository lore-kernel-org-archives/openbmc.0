Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6EBA61A0512
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:52:18 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445482334781157.8800584229765;
 Wed, 21 Oct 2015 19:52:14 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 0/8] Fixups for oem
Date: Wed, 21 Oct 2015 21:52:05 -0500
Message-Id: <1445482333-2053-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:52:19 -0000

https://github.com/openbmc/openpower-host-ipmi-oem/pull/2

Chris Austen (8):
  Support OpenPOWERs OEM commands on openbmc
  Add a test framework for the .so
  Fixes from Joel review
  fixed #define issue with byte swapping
  fix build break with array of pointers
  Clean up Makefile
  Fixed string pointer usage
  Allow ipmi headers from SDK

 Makefile     |  27 ++++++++++++
 README.md    |   1 +
 oemhandler.C |  91 ++++++++++++++++++++++++++++++++++++++
 oemhandler.h |  33 ++++++++++++++
 testit.C     | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 testit.h     |  14 ++++++
 6 files changed, 307 insertions(+)
 create mode 100644 Makefile
 create mode 100644 README.md
 create mode 100644 oemhandler.C
 create mode 100644 oemhandler.h
 create mode 100644 testit.C
 create mode 100644 testit.h

-- 
2.6.0

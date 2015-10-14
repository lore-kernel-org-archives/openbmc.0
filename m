Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5DB8F1A0739
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 01:23:40 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444832605480223.79162695327398;
 Wed, 14 Oct 2015 07:23:25 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 0/2] B1 Added oem so and test program
Date: Wed, 14 Oct 2015 09:23:21 -0500
Message-Id: <1444832603-18260-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 14 Oct 2015 14:23:42 -0000

https://github.com/openbmc/openpower-host-ipmi-oem/pull/1

Chris Austen (2):
  Support OpenPOWERs OEM commands on openbmc
  Add a test framework for the .so

 Makefile     |  27 ++++++++++
 README.md    |   1 +
 ipmid-api.h  |  83 +++++++++++++++++++++++++++++++
 ipmid.H      |  15 ++++++
 oemhandler.C |  92 ++++++++++++++++++++++++++++++++++
 oemhandler.h |  32 ++++++++++++
 testit.C     | 157 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 testit.h     |  14 ++++++
 8 files changed, 421 insertions(+)
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

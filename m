Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0938D1A037E
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2015 05:44:35 +1100 (AEDT)
Received: from localhost (32.97.110.53 [32.97.110.53]) by mx.zohomail.com
 with SMTPS id 1444329870350640.5657438430067;
 Thu, 8 Oct 2015 11:44:30 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3] Initial IPMI Net Function router
Date: Thu,  8 Oct 2015 13:44:27 -0500
Message-Id: <1444329868-31461-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 18:44:37 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/1

vishwabmc (1):
  Final IPMI Net Function router

 Makefile     |  24 +++++
 apphandler.C |  58 +++++++++++
 apphandler.h |  11 ++
 ipmid-api.h  |  91 +++++++++++++++++
 ipmid.C      | 326 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 ipmid.H      |  15 +++
 6 files changed, 525 insertions(+)
 create mode 100755 Makefile
 create mode 100755 apphandler.C
 create mode 100644 apphandler.h
 create mode 100755 ipmid-api.h
 create mode 100644 ipmid.C
 create mode 100755 ipmid.H

-- 
2.6.0

Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 34E8B1A001D
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:39:23 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140360290621.309605488847;
 Thu, 29 Oct 2015 10:39:20 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Added liboemhandler.so to the official build
Date: Thu, 29 Oct 2015 12:39:18 -0500
Message-Id: <1446140359-7427-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:39:23 -0000

Moved ipmi up to the latest level to allow the ipmid-api.h to be exported in the package

https://github.com/openbmc/openbmc/pull/36

Chris Austen (1):
  Added liboemhandler.so to the official build     Moved ipmi up to the
    latest level to allow the ipmid-api.h to be exported in the package 
       fixed bb files to ensure RECCOMNDS do not get overwritten

 .../meta-palmetto/conf/machine/palmetto.conf       |  3 +++
 .../recipes-phosphor/host-ipmid/host-ipmid-oem.bb  | 31 ++++++++++++++++++++++
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  8 ++++--
 meta-phosphor/conf/machine/include/sample.inc      |  3 +++
 4 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb

-- 
2.6.0

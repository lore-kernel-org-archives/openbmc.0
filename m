Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DDB1A0415
 for <openbmc@lists.ozlabs.org>; Sun, 25 Oct 2015 12:43:00 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445737378120729.1455400377562;
 Sat, 24 Oct 2015 18:42:58 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: OpenBMC Patches <patches@stwcx.xyz>
Subject: [PATCH openbmc] Added liboemhandler.so to the official build
Date: Sat, 24 Oct 2015 20:42:55 -0500
Message-Id: <1445737376-28116-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <1445737376-28116-1-git-send-email-patches@stwcx.xyz>+zmo_0_<patches@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Sun, 25 Oct 2015 01:43:00 -0000

Moved ipmi up to the latest level to allow the ipmid-api.h to be exported in the package

https://github.com/openbmc/openbmc/pull/36

Chris Austen (1):
  Added liboemhandler.so to the official build     Moved ipmi up to the
    latest level to allow the ipmid-api.h to be exported in the package

 .../meta-palmetto/conf/machine/palmetto.conf       |  3 ++
 .../recipes-phosphor/host-ipmid/host-ipmid-oem.bb  | 32 ++++++++++++++++++++++
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  6 +++-
 meta-phosphor/conf/machine/include/sample.inc      |  3 ++
 4 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb

-- 
2.6.0

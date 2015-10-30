Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5BCF51A0CED
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:57 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208974178131.35137650084243;
 Fri, 30 Oct 2015 05:42:54 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] enable btbridge
Date: Fri, 30 Oct 2015 07:42:50 -0500
Message-Id: <1446208972-26266-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:58 -0000

https://github.com/openbmc/openbmc/pull/48

Brad Bishop (2):
  Add btbridged recipe
  Set btbridged as default host-ipmi-hw provider

 .../meta-openpower/conf/machine/include/openpower.inc  |  2 +-
 .../common/recipes-phosphor/host-ipmid/btbridged.bb    | 18 ++++++++++++++++++
 .../host-ipmid/btbridged/btbridged.service             |  8 ++++++++
 .../host-ipmid/btbridged/makefile.patch                | 11 +++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/btbridged.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch

-- 
2.6.0

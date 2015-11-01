Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CECD31A03D5
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 15:34:21 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446352459510309.41521588868886;
 Sat, 31 Oct 2015 21:34:19 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Patch btbridge makefile.
Date: Sat, 31 Oct 2015 23:34:16 -0500
Message-Id: <1446352457-9325-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 04:34:22 -0000

It doesn't work inside OE at the moment.

https://github.com/openbmc/openbmc/pull/55

Brad Bishop (1):
  Patch btbridge makefile.

 .../common/recipes-phosphor/host-ipmid/btbridged.bb    |  2 +-
 .../host-ipmid/btbridged/makefile.patch                | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch

-- 
2.6.0

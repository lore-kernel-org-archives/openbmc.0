Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E2BA31A02CB
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2015 13:10:05 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445911801247310.06173288969603;
 Mon, 26 Oct 2015 19:10:01 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: OpenBMC Patches <patches@stwcx.xyz>
Subject: [PATCH openbmc] add screen, i2ctools, and fix tty issue
Date: Mon, 26 Oct 2015 21:09:58 -0500
Message-Id: <1445911799-16008-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <1445911799-16008-1-git-send-email-patches@stwcx.xyz>+zmo_0_<patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 02:10:06 -0000

https://github.com/openbmc/openbmc/pull/39

Norman James (1):
  add screen, i2ctools, and fix tty issue

 .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf  | 2 ++
 meta-phosphor/classes/obmc-phosphor-image.bbclass                     | 2 ++
 meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend  | 4 ++++
 3 files changed, 8 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend

-- 
2.6.0

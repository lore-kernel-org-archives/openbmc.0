Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9A1D81A0C92
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 13:39:46 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446691184112113.57721610346039;
 Wed, 4 Nov 2015 18:39:44 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add TMP421 to Palmetto config
Date: Wed,  4 Nov 2015 20:39:41 -0600
Message-Id: <1446691182-32076-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 02:39:48 -0000

https://github.com/openbmc/openbmc/pull/68

Brad Bishop (1):
  Add TMP421 to Palmetto config

 .../meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg        | 4 ++++
 .../meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg

-- 
2.6.0

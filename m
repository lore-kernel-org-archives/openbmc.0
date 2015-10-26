Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F35F1A0907
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2015 12:40:02 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445823597251346.44594038177877;
 Sun, 25 Oct 2015 18:39:57 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: OpenBMC Patches <patches@stwcx.xyz>
Subject: [PATCH openbmc] Adding real event log manager
Date: Sun, 25 Oct 2015 20:39:53 -0500
Message-Id: <1445823594-7365-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_4
X-ZohoMail-Owner: <1445823594-7365-1-git-send-email-patches@stwcx.xyz>+zmo_0_<patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 26 Oct 2015 01:40:03 -0000

removed the eventd program from the skeleton includes

https://github.com/openbmc/openbmc/pull/37

Chris Austen (1):
  Adding real event log manager     removed the eventd program from the
    skeleton includes

 .../conf/machine/include/openpower.inc             |  3 ++-
 .../files/obmc-phosphor-event.service              |  8 ++++++
 .../files/obmc-phosphor-eventd.py                  | 29 ----------------------
 .../files/obmc-phosphor-eventd.service             |  8 ------
 .../obmc-phosphor-event/obmc-phosphor-event.bb     | 25 +++++++++++++++++++
 .../obmc-phosphor-event/obmc-phosphor-eventd.bb    |  9 -------
 .../common/recipes-phosphor/skeleton/skeleton.bb   |  1 -
 7 files changed, 35 insertions(+), 48 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.py
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb

-- 
2.6.0

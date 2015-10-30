Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 04B501A0CAA
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 07:02:10 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446235327871184.21139120558473;
 Fri, 30 Oct 2015 13:02:07 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Adding real event log manager
Date: Fri, 30 Oct 2015 15:02:05 -0500
Message-Id: <1446235326-17756-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 20:02:12 -0000

removed the eventd program from the skeleton includes

https://github.com/openbmc/openbmc/pull/37

Chris Austen (1):
  Adding real event log manager     removed the eventd program from the
    skeleton includes     Added DEPENDS per code review

 .../conf/machine/include/openpower.inc             |  3 ++-
 .../files/obmc-phosphor-event.service              |  8 ++++++
 .../files/obmc-phosphor-eventd.py                  | 29 ----------------------
 .../files/obmc-phosphor-eventd.service             |  8 ------
 .../obmc-phosphor-event/obmc-phosphor-event.bb     | 26 +++++++++++++++++++
 .../obmc-phosphor-event/obmc-phosphor-eventd.bb    |  9 -------
 .../common/recipes-phosphor/skeleton/skeleton.bb   |  1 -
 7 files changed, 36 insertions(+), 48 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.py
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb

-- 
2.6.0

Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C38181A0608
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 07:40:59 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446237657331464.7695487733388;
 Fri, 30 Oct 2015 13:40:57 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Moving openbmc's ipmid and oem to support Nov1 release
Date: Fri, 30 Oct 2015 15:40:54 -0500
Message-Id: <1446237655-29061-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 20:41:00 -0000

Fixes contained up till now include...
host: 5fc6492ff8882390e55592d776969a094567b0d5
oem: 17160cebf1735337a35a12ba27728d90c5207ec5

https://github.com/openbmc/openbmc/pull/52

Chris Austen (1):
  Moving openbmc's ipmid and oem to support Nov1 release     Fixes
    contained up till now include...     host:
    5fc6492ff8882390e55592d776969a094567b0d5     oem:
    17160cebf1735337a35a12ba27728d90c5207ec5

 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.0

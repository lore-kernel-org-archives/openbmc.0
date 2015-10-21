Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48C791A03BC
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 00:38:23 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445434422175282.1151115144694;
 Wed, 21 Oct 2015 06:33:42 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3 0/2] FRU validator CLI
Date: Wed, 21 Oct 2015 08:33:38 -0500
Message-Id: <1445434420-14198-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 13:38:23 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/4

vishwabmc (2):
  FRU validator CLI
  Refactored fru validator to use sd_bus

 sd_bus_fruvalidator.C | 568 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 568 insertions(+)
 create mode 100644 sd_bus_fruvalidator.C

-- 
2.6.0

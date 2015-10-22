Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0B0F81A08F5
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:43:59 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445539437058484.31503666845606;
 Thu, 22 Oct 2015 11:43:57 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v5] FRU validator CLI
Date: Thu, 22 Oct 2015 13:43:54 -0500
Message-Id: <1445539435-24359-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:44:00 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/4

vishwabmc (1):
  FRU validator

 sd_bus_fruvalidator.C | 566 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 566 insertions(+)
 create mode 100644 sd_bus_fruvalidator.C

-- 
2.6.0

Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C1CB91A030A
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:00:18 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536816779137.23545236525695;
 Thu, 22 Oct 2015 11:00:16 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Start watchdog with 30s timeout on poweron
Date: Thu, 22 Oct 2015 13:00:14 -0500
Message-Id: <1445536815-14833-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:00:19 -0000

Per the OpenPower Host IPMI Spec, start the watchdog from the BMC
with a 30s timeout at power on. Once the host starts booting, it
will reset it and refresh it.

https://github.com/openbmc/skeleton/pull/7

Adriana Kobylak (1):
  Start watchdog with 30s timeout on poweron

 bin/chassis_control.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.6.0

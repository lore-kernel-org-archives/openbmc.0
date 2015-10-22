Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A8CDC1A0965
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 08:31:40 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445549498325591.94448616134;
 Thu, 22 Oct 2015 14:31:38 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Add App Set BMC Global Enables ipmi cmd
Date: Thu, 22 Oct 2015 16:31:36 -0500
Message-Id: <1445549497-2972-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 21:31:41 -0000

Add support for App NetFn Set BMC Global Enables

https://github.com/openbmc/phosphor-host-ipmid/pull/11

Adriana Kobylak (1):
  Add App Set BMC Global Enables ipmi cmd

 apphandler.C | 17 +++++++++++++++++
 apphandler.h | 15 ++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.6.0

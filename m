Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qgYsP15CTzDq64
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2016 17:20:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460013633476680.8511342648092;
 Thu, 7 Apr 2016 00:20:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem v2] Support for IPMI restricted mode
Date: Thu,  7 Apr 2016 02:20:31 -0500
Message-Id: <1460013632-16618-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 07 Apr 2016 07:20:41 -0000

Only IPMI whitelisted commands are supported in restricted mode. OEM command for FW update(NetFn: 0x32, Cmd: 0x10) is restricted in restricted mode.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openpower-host-ipmi-oem/10)
<!-- Reviewable:end -->


https://github.com/openbmc/openpower-host-ipmi-oem/pull/10

tomjose (1):
  Support for restricted mode for IPMI commands

 oemhandler.C | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.7.1

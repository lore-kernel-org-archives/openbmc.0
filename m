Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 30E3E1A0216
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2015 17:30:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447223423560798.3015181032212;
 Tue, 10 Nov 2015 22:30:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Hostboot not clearing out its cached logs
Date: Wed, 11 Nov 2015 01:30:21 -0500
Message-Id: <1447223422-20179-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Wed, 11 Nov 2015 06:30:28 -0000

renaming sent to dbus logs for debug

https://github.com/openbmc/phosphor-host-ipmid/pull/36

Chris Austen (1):
  Hostboot not clearing out its cached logs

 storageaddsel.C  | 15 ++++++++++++---
 storagehandler.C |  2 +-
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.6.3

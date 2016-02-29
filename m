Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8DAE61A0035
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 22:45:54 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456746032841581.054826180829;
 Mon, 29 Feb 2016 03:40:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 0/2] Fixing the Duplicate registration
 for NetFn [0x6], Cmd:[0xFF]
Date: Mon, 29 Feb 2016 05:40:30 -0600
Message-Id: <1456746032-24977-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 29 Feb 2016 11:45:55 -0000

This NetFn [0x6], Cmd:[0xFF] is getting registered in both apphandler.C and globalhandler.C causing a duplicate registration. 

--> The fix is to remove the registration in globalhandler.C

apphandler.C and globalhandler.C are part of libapphandler library.

https://github.com/openbmc/phosphor-host-ipmid/pull/67

Ratan Gupta (2):
  Fixing the Duplicate registration for NetFn [0x6], Cmd:[0xFF]
  Removed the handler function of the wild card command      enter the
    commit message for your changes. Lines starting

 globalhandler.C | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

-- 
2.7.1

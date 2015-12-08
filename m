Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F92C1A0E6B
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 15:50:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449550224530924.0349423487859;
 Mon, 7 Dec 2015 20:50:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Increase ipmi BT to 64 bytes
Date: Mon,  7 Dec 2015 23:50:22 -0500
Message-Id: <1449550223-24173-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 08 Dec 2015 04:50:29 -0000

after a lot of testing and verification from Hostboot it appears it is
fine to move this back to 64 bytes.  I'm doing this to reduce the
number of IPMI calls from the host.

https://github.com/openbmc/phosphor-host-ipmid/pull/53

Chris Austen (1):
  Increase ipmi BT to 64 bytes

 ipmid.H | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.6.3

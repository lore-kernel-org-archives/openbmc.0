Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8742A1A005D
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 07:10:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457467834352654.2726057078236;
 Tue, 8 Mar 2016 12:10:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] ipmi daemon return code modification
Date: Tue,  8 Mar 2016 14:10:32 -0600
Message-Id: <1457467833-17690-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 08 Mar 2016 20:10:39 -0000

1) Modified the return code for error ipmi rc's
2) Added Channel number 8 support in Channel Info command

https://github.com/openbmc/phosphor-host-ipmid/pull/74

tomjose (1):
  ipmi daemon return code modification

 apphandler.C | 2 +-
 ipmid.C      | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.7.1

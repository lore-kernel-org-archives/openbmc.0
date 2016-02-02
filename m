Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D79FD1A007F
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 11:00:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454371230800485.5066829821478;
 Mon, 1 Feb 2016 16:00:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update recipes to pick changes for Foxconn build
Date: Mon,  1 Feb 2016 18:00:28 -0600
Message-Id: <1454371229-4435-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Tue, 02 Feb 2016 00:00:33 -0000

Update recipes to pick up changes required for Foxconn delivery

https://github.com/openbmc/openbmc/pull/156

Adriana Kobylak (1):
  Update recipes to pick changes for Foxconn build

 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb        | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
 meta-phosphor/common/recipes-phosphor/settings/settings.bb         | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.6.4

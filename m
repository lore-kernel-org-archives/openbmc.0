Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D6FDE1A01D8
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 14:40:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454384420368129.28742424260417;
 Mon, 1 Feb 2016 19:40:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Enable DHCP
Date: Mon,  1 Feb 2016 21:40:18 -0600
Message-Id: <1454384419-9859-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 03:40:24 -0000

Enable DHCP as default in the image.

https://github.com/openbmc/openbmc/pull/158

Adriana Kobylak (1):
  Enable DHCP

 meta-phosphor/common/recipes-phosphor/network/network.bb            | 6 +++++-
 .../common/recipes-phosphor/network/network/80-dhcp.network         | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100755 meta-phosphor/common/recipes-phosphor/network/network/80-dhcp.network

-- 
2.6.4

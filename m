Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 80BC41A0D36
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 16:21:27 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1446787282965359.72435811523496;
 Thu, 5 Nov 2015 21:21:22 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add ipmitool for qemu image only
Date: Thu,  5 Nov 2015 23:21:20 -0600
Message-Id: <1446787281-15293-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 06 Nov 2015 05:21:28 -0000

https://github.com/openbmc/openbmc/pull/69

Chris Austen (1):
  Add ipmitool for qemu image only

 .../recipes-phosphor/host-ipmid/host-ipmid-tool.bb | 37 ++++++++++++++++++++++
 meta-phosphor/conf/machine/include/sample.inc      |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-tool.bb

-- 
2.6.0

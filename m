Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 83A131A0024
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 02:03:59 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444662236059357.39641658099777;
 Mon, 12 Oct 2015 08:03:56 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] bitbake and package files for host-ipmid
Date: Mon, 12 Oct 2015 10:03:53 -0500
Message-Id: <1444662234-13303-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 15:04:00 -0000

https://github.com/openbmc/openbmc/pull/14

vishwabmc (1):
  bitbake and package files for host-ipmid

 .../host-ipmid/files/host-ipmid.service              |  8 ++++++++
 .../common/recipes-phosphor/host-ipmid/host-ipmid.bb | 20 ++++++++++++++++++++
 .../packagegroups/packagegroup-obmc-phosphor-apps.bb |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb

-- 
2.6.0

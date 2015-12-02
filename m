Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AB1B71A0BC0
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 04:20:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449076827031109.35930461527437;
 Wed, 2 Dec 2015 09:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Set dropbearkey service to start on boot
Date: Wed,  2 Dec 2015 12:20:25 -0500
Message-Id: <1449076826-7916-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 17:20:30 -0000

Before this patch it isn't started until the first
client connection which is not the desired behavior.

https://github.com/openbmc/openbmc/pull/112

Brad Bishop (1):
  Set dropbearkey service to start on boot

 .../common/recipes-core/dropbear/dropbear/dropbearkey.service | 11 +++++++++++
 .../common/recipes-core/dropbear/dropbear_%.bbappend          |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/dropbear/dropbear/dropbearkey.service
 create mode 100644 meta-phosphor/common/recipes-core/dropbear/dropbear_%.bbappend

-- 
2.6.3

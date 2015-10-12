Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 98DB11A0133
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 06:36:32 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444678589504499.45424927862234;
 Mon, 12 Oct 2015 12:36:29 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Code to allow building on Power  based systems
Date: Mon, 12 Oct 2015 14:36:26 -0500
Message-Id: <1444678587-27997-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 19:36:33 -0000

https://github.com/openbmc/openbmc/pull/15

Chris Austen (1):
  Code to allow building on Power  based systems

 yocto-poky/meta/classes/siteinfo.bbclass           |  1 +
 .../0001-add-support-for-Power8-LE-mode.patch      | 26 ++++++++++++++++++++++
 .../glibc/cross-localedef-native_2.22.bb           |  1 +
 3 files changed, 28 insertions(+)
 create mode 100644 yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch

-- 
2.6.0

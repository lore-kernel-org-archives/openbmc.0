Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rflTD3w8JzDqsp
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:30:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467210637564792.8514085889675;
 Wed, 29 Jun 2016 07:30:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/3] random fixes
Date: Wed, 29 Jun 2016 09:30:33 -0500
Message-Id: <20160629143036.30291-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2016 14:30:41 -0000

This patchset contains a couple of unrelated fixes:
 - yocto 2.1 fix for taskhash mismatch
 - remove execute perms from skeleton.service
 - allow python apps to print to the journal

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/422)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/422

Brad Bishop (3):
  Remove execute permissions from skeleton.service
  Set PYTHONUNBUFFERED for systemd managed python
  Remove BUILD_ID from os-release vardeps

 meta-phosphor/common/recipes-core/os-release/os-release.bbappend         | 1 +
 .../common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service         | 1 +
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service   | 1 +
 meta-phosphor/common/recipes-phosphor/network/network/network.service    | 1 +
 .../files/obmc-phosphor-example-pydbus.service                           | 1 +
 .../recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service | 1 +
 meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service  | 1 +
 meta-phosphor/common/recipes-phosphor/settings/settings/settings.service | 1 +
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service | 1 +
 9 files changed, 9 insertions(+)
 mode change 100755 => 100644 meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service

-- 
2.9.0

Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rR7Fz4f0DzDq5k
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 02:40:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465576832710506.24998208303236;
 Fri, 10 Jun 2016 09:40:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Bump phosphor recipe versions
Date: Fri, 10 Jun 2016 11:40:30 -0500
Message-Id: <20160610164031.25371-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
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
X-List-Received-Date: Fri, 10 Jun 2016 16:40:40 -0000

Enable one-time vs permanent host boot option
Handle endianness in IPMI eSEL function
Improve IPMI error handling
Add IPMI Travis CI
Fix host hanging due to inventory upload
Performance improvements

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/318)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/318

Adriana Kobylak (1):
  Bump phosphor recipe versions

 .../common/recipes-phosphor/inventory-upload/inventory-upload.bb        | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb               | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb      | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb      | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          | 2 +-
 meta-phosphor/common/recipes-phosphor/settings/settings.bb              | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb            | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb              | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.8.3

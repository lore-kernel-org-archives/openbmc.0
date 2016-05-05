Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0xs35w8ZzDq5y
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2016 00:20:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462458034610895.6056572468777;
 Thu, 5 May 2016 07:20:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Bump versions for inventory upload
Date: Thu,  5 May 2016 09:20:32 -0500
Message-Id: <1462458033-8576-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Thu, 05 May 2016 14:20:40 -0000

Bump mapper and skeleton versions.
Bump upload version and add systemd service file.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/256)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/256

Brad Bishop (1):
  Bump versions for inventory upload

 .../recipes-phosphor/inventory-upload/inventory-upload.bb      |  5 ++++-
 .../inventory-upload/inventory-upload/inventory-upload.service | 10 ++++++++++
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb      |  2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb     |  2 +-
 4 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload/inventory-upload.service

-- 
2.8.1

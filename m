Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxL7W4wM2zDqB4
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 03:20:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461950437186328.8896097703524;
 Fri, 29 Apr 2016 10:20:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-inventory-upload v2] Introducing inventory upload
Date: Fri, 29 Apr 2016 12:20:35 -0500
Message-Id: <1461950436-22595-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Fri, 29 Apr 2016 17:20:40 -0000

This script collects the BMC inventory, encodes it in DTB format
and writes it to BIOS flash for consumption by the host firmware.

https://github.com/openbmc/openpower-inventory-upload/pull/1

Brad Bishop (1):
  Introducing inventory upload

 .gitignore          |  62 ++++++++++++++++++++++++++++
 inventory_upload.py | 115 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 setup.cfg           |   2 +
 setup.py            |   6 +++
 4 files changed, 185 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 inventory_upload.py
 create mode 100644 setup.cfg
 create mode 100644 setup.py

-- 
2.8.1

Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpYKM6mFszDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 02:20:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460996436489210.17186729192872;
 Mon, 18 Apr 2016 09:20:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-inventory-upload] Introducing inventory upload
Date: Mon, 18 Apr 2016 11:20:34 -0500
Message-Id: <1460996435-29671-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Mon, 18 Apr 2016 16:20:40 -0000

This script collects the BMC inventory, encodes it in DTB format
and writes it to BIOS flash for consumption by the host firmware.

https://github.com/openbmc/openpower-inventory-upload/pull/1

Brad Bishop (1):
  Introducing inventory upload

 .gitignore          | 62 +++++++++++++++++++++++++++++++++++++++
 inventory_upload.py | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 setup.cfg           |  2 ++
 setup.py            |  6 ++++
 4 files changed, 154 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 inventory_upload.py
 create mode 100644 setup.cfg
 create mode 100644 setup.py

-- 
2.7.1

Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnsMm27T4zDqwr
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:20:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468210832493716.5759851525769;
 Sun, 10 Jul 2016 21:20:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] Remove extra busses from python and sdbus examples
Date: Sun, 10 Jul 2016 23:20:29 -0500
Message-Id: <20160711042031.5026-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 04:20:36 -0000

I can't think of any use cases for this.  Removing to make things less confusing.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/461)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/461

Brad Bishop (2):
  Remove second bus from pydbus example
  Remove second bus from sdbus example

 .../files/obmc-phosphor-example-pydbus.py                         | 3 +--
 .../files/org.openbmc.examples.PythonService.conf}                | 4 ++--
 ...-pydbus.service => org.openbmc.examples.PythonService.service} | 0
 .../files/org.openbmc.examples.PythonService0.conf                | 8 --------
 .../files/org.openbmc.examples.PythonService1.conf                | 8 --------
 .../obmc-phosphor-example-pydbus/files/pyclient-sample.py         | 4 ++--
 .../obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb  | 3 +--
 .../files/obmc-phosphor-example-sdbus.c                           | 8 +-------
 ....SDBusService1.conf => org.openbmc.examples.SDBusService.conf} | 4 ++--
 ...le-sdbus.service => org.openbmc.examples.SDBusService.service} | 0
 .../obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb    | 3 +--
 11 files changed, 10 insertions(+), 35 deletions(-)
 rename meta-phosphor/common/recipes-phosphor/{obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService0.conf => obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService.conf} (63%)
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/{obmc-phosphor-example-pydbus.service => org.openbmc.examples.PythonService.service} (100%)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService0.conf
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService1.conf
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/{org.openbmc.examples.SDBusService1.conf => org.openbmc.examples.SDBusService.conf} (62%)
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/{obmc-phosphor-example-sdbus.service => org.openbmc.examples.SDBusService.service} (100%)

-- 
2.9.0

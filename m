Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8KWQ5XL3zDqDf
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 00:30:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463495454201484.3084699131623;
 Tue, 17 May 2016 07:30:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Allow multiple systemd service files
Date: Tue, 17 May 2016 09:30:52 -0500
Message-Id: <1463495453-27825-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
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
X-List-Received-Date: Tue, 17 May 2016 14:30:59 -0000

Enhance the obmc-phosphor-systemd class such that an array
of service files in SYSTEMD_SERVICES works.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/274)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/274

Brad Bishop (1):
  Allow multiple systemd service files

 meta-phosphor/classes/obmc-phosphor-systemd.bbclass    | 18 +++++++++++++-----
 .../host-ipmi-hw-example/host-ipmi-hw-example.service  |  8 --------
 .../host-ipmi-hw-example/host-ipmi-hw.service          |  8 ++++++++
 3 files changed, 21 insertions(+), 13 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service

-- 
2.8.2

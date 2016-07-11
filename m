Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnspx3CtNzDqws
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:40:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146821203261848.651854515599325;
 Sun, 10 Jul 2016 21:40:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] systemd: Add OpenBMC standby target
Date: Sun, 10 Jul 2016 23:40:30 -0500
Message-Id: <20160711044031.5771-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 04:40:42 -0000

Add a target pulled in by multi-user to which Phosphor applications
can be added.  This is an organizational change only.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/462)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/462

Brad Bishop (1):
  systemd: Add OpenBMC standby target

 .../common/recipes-core/systemd/systemd/obmc-standby.target          | 2 ++
 meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend         | 5 +++++
 2 files changed, 7 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/systemd/systemd/obmc-standby.target

-- 
2.9.0

Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qlrQT6znFzDq5y
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 16:30:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460615436699516.6194032572342;
 Wed, 13 Apr 2016 23:30:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/3] Re-enable obmc-console and add a ssh endpoint
Date: Thu, 14 Apr 2016 01:30:32 -0500
Message-Id: <1460615435-26806-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Apr 2016 06:30:42 -0000

Following the previous disable, this bumps us to a working obmc-console version, and adds infrastructure for a ssh-based remote console connection.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/232)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/232

Jeremy Kerr (3):
  Enable obmc-console project
  dropbear: Add patch for -c <command> option to dropbear
  obmc-console: Add ssh endpoint

 meta-phosphor/classes/obmc-phosphor-image.bbclass  |  1 +
 ...d-c-command-option-to-force-a-specific-co.patch | 91 ++++++++++++++++++++++
 .../recipes-core/dropbear/dropbear_%.bbappend      |  3 +-
 .../recipes-phosphor/obmc-console/obmc-console.bb  | 22 +++++-
 .../obmc-console/obmc-console-ssh.socket           | 11 +++
 .../obmc-console/obmc-console-ssh@.service         | 11 +++
 6 files changed, 136 insertions(+), 3 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-core/dropbear/dropbear/0001-dropbear-Add-c-command-option-to-force-a-specific-co.patch
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh.socket
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh@.service

-- 
2.7.1

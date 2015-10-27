Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7ACF71A09AE
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 11:30:11 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445983619394733.662400116469;
 Tue, 27 Oct 2015 15:06:59 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v4] Add get sel time cmd
Date: Tue, 27 Oct 2015 17:06:57 -0500
Message-Id: <1445983618-2853-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 00:30:12 -0000

Add support for storage ipmi function Add Get SEL Time

https://github.com/openbmc/phosphor-host-ipmid/pull/12

Adriana Kobylak (1):
  Add get sel time cmd

 storagehandler.C | 75 ++++++++++++++++++++++++++++++++++++++------------------
 storagehandler.h |  5 ++--
 2 files changed, 54 insertions(+), 26 deletions(-)

-- 
2.6.0

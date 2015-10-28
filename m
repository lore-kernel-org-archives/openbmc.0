Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C5CFE1A0A9E
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 01:31:07 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446040099103223.9022892282428;
 Wed, 28 Oct 2015 06:48:19 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/3] Barreleye skeleton updates
Date: Wed, 28 Oct 2015 08:48:12 -0500
Message-Id: <1446040095-14799-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 14:31:08 -0000

https://github.com/openbmc/openbmc/pull/42

Brad Bishop (3):
  Don't set source dir to git
  Remove quotes from skeleton service description
  Patch skeleton.service for Barreleye

 .../meta-rackspace/meta-barreleye/conf/layer.conf             |  4 ++++
 .../recipes-phosphor/skeleton/skeleton.bbappend               |  2 ++
 .../recipes-phosphor/skeleton/skeleton/skeleton.patch         | 11 +++++++++++
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb    | 10 ++++++----
 .../recipes-phosphor/skeleton/skeleton/skeleton.service       |  2 +-
 5 files changed, 24 insertions(+), 5 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch

-- 
2.6.0

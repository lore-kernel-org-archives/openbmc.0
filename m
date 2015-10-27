Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 308BD1A01DC
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 11:24:19 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 144599033647356.13158969996539;
 Tue, 27 Oct 2015 16:58:56 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/2] add screen, i2ctools, and fix tty issue
Date: Tue, 27 Oct 2015 18:58:51 -0500
Message-Id: <1445990333-27071-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 00:24:20 -0000

https://github.com/openbmc/openbmc/pull/39

Norman James (2):
  add screen, i2ctools, and fix tty issue
  remove tty fix

 .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf  | 1 +
 meta-phosphor/classes/obmc-phosphor-image.bbclass                     | 2 ++
 meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend  | 4 ++++
 3 files changed, 7 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend

-- 
2.6.0

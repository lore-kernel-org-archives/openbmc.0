Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A5BCC1A0A70
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 13:06:16 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446084373521835.2027196822361;
 Wed, 28 Oct 2015 19:06:13 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr 0/2] introspection parser
Date: Wed, 28 Oct 2015 21:06:10 -0500
Message-Id: <1446084372-26724-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 02:06:17 -0000

Setting this up for rest-dbus to use.

https://github.com/openbmc/phosphor-objmgr/pull/2

Brad Bishop (2):
  Generalize introspection parser
  Move introspection parser to OpenBMCMapper

 OpenBMCMapper.py | 107 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 phosphor-mapper  |  81 ++++++++---------------------------------
 2 files changed, 122 insertions(+), 66 deletions(-)

-- 
2.6.0

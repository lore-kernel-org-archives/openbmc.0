Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 92B481A0CFA
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 00:22:47 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446729712350328.0217657549557;
 Thu, 5 Nov 2015 05:21:52 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr v2 00/10] Mapper refactoring
Date: Thu,  5 Nov 2015 07:21:40 -0600
Message-Id: <1446729710-27220-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:22:49 -0000

Working towards rest-server usage of the org.openbmc.Object.Enumerate interface.

https://github.com/openbmc/phosphor-objmgr/pull/3

Brad Bishop (10):
  Add filter capability to introspection parser
  Add PathTree to mapper library
  Rename TagListMatch to ListMatch
  Use PathTree as internal storage structure
  Defer mapper name registration to post discovery
  Add enumerate iface alias to OpenBMCMapper
  Add ObjectMapper binding
  Add basic error handling to ObjectMapper
  Mapper performance improvements
  Use introspect interface enum

 OpenBMCMapper.py | 230 +++++++++++++++++++++++++++++++++++++++++---
 phosphor-mapper  | 285 ++++++++++++++++++-------------------------------------
 2 files changed, 309 insertions(+), 206 deletions(-)

-- 
2.6.0

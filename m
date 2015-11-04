Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 56B551A0133
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:39:40 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446654824911513.8894461266318;
 Wed, 4 Nov 2015 08:33:44 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr 0/8] Mapper refactoring
Date: Wed,  4 Nov 2015 10:33:26 -0600
Message-Id: <1446654814-4705-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:39:44 -0000

Working towards rest-server usage of the org.openbmc.Object.Enumerate interface.

https://github.com/openbmc/phosphor-objmgr/pull/3

Brad Bishop (8):
  Add filter capability to introspection parser
  Add PathTree to mapper library
  Rename TagListMatch to ListMatch
  Use PathTree as internal storage structure
  Defer mapper name registration to post discovery
  Add enumerate iface alias to OpenBMCMapper
  Add ObjectMapper binding
  Add basic error handling to ObjectMapper

 OpenBMCMapper.py | 222 +++++++++++++++++++++++++++++++++++++++++--
 phosphor-mapper  | 280 +++++++++++++++++--------------------------------------
 2 files changed, 299 insertions(+), 203 deletions(-)

-- 
2.6.0

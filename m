Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A42A61A01E9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 08:09:14 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446152951292597.4983917339024;
 Thu, 29 Oct 2015 14:09:11 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 0/2] REST API examples
Date: Thu, 29 Oct 2015 16:09:07 -0500
Message-Id: <1446152949-8085-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 21:09:16 -0000

https://github.com/openbmc/docs/pull/4

Brad Bishop (2):
  Fix description of busctl
  Add REST API examples

 cheatsheet.md |  2 +-
 rest-api.md   | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 rest-api.md

-- 
2.6.0

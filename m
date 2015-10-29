Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D90001A001D
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:40:30 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 14461404278621005.2690977796352;
 Thu, 29 Oct 2015 10:40:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Move .so library to lib directory
Date: Thu, 29 Oct 2015 12:40:24 -0500
Message-Id: <1446140425-7767-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:40:31 -0000

Move .so library out of bin into lib to make recipe simpler
Move the make all target to the top so that it's the default for make
Make clean to delete all created targets

https://github.com/openbmc/skeleton/pull/9

Adriana Kobylak (1):
  Move .so library to lib directory

 Makefile | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.6.0

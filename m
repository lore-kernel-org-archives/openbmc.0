Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8830E1A0CCE
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 08:20:58 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446240055324628.6167519103507;
 Fri, 30 Oct 2015 14:20:55 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Adding real event log manager
Date: Fri, 30 Oct 2015 16:20:52 -0500
Message-Id: <1446240053-5357-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 21:21:00 -0000

removed the eventd program from the skeleton includes
Added DEPENDS per code review

https://github.com/openbmc/openbmc/pull/53

Chris Austen (1):
  Move obmc build to use useful event

 .../recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.6.0

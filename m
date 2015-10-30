Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DDD971A0CE6
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 05:52:41 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446231159055429.7149793079475;
 Fri, 30 Oct 2015 11:52:39 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem] Fixed byte swapped esel log name so
 logs are saved
Date: Fri, 30 Oct 2015 13:52:36 -0500
Message-Id: <1446231157-31189-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 18:52:42 -0000

moved to tabs.. sorry that really messes up the changes

https://github.com/openbmc/openpower-host-ipmi-oem/pull/3

Chris Austen (1):
  Fixed byte swapped esel log name so logs are saved     moved to tabs..
    sorry that really messes up the changes

 oemhandler.C | 108 ++++++++++++++++++++++++++++-------------------------------
 1 file changed, 51 insertions(+), 57 deletions(-)

-- 
2.6.0

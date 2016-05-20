Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rBMNH6HlSzDqFL
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2016 08:01:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463781708029703.8374930006152;
 Fri, 20 May 2016 15:01:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Add update rest interface to bmc
Date: Fri, 20 May 2016 17:01:46 -0500
Message-Id: <1463781707-16237-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2016 22:01:52 -0000

Currentling /org/openbmc/control/flash/bmc only has updateViaTftp
I am adding the update method to allow for bmc code updates with
requiring a remote tftp server.

Something like this will now work.  Ofcourse the update method is not in charge of getting the code on to the bmc server.  That's the job of something else (i.e. scp)
curl -k -H "Content-Type: application/json" -x POST -d "{\"data\": [\"/tmp/flash-barreleye\"]}" https://<ip>/org/openbmc/control/flash/bmc/action/update

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/87)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/87

Chris Austen (1):
  Add update rest interface to bmc

 bin/bmc_update.py | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.8.2

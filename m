Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qw3M157LhzDqBt
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 01:11:09 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461769862654819.5975427883781;
 Wed, 27 Apr 2016 08:11:02 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Allow sysfs path to be passed to OCC sensor
Date: Wed, 27 Apr 2016 10:10:59 -0500
Message-Id: <1461769860-18109-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Wed, 27 Apr 2016 15:11:10 -0000

The previous method of overriding this didn't work because
the base class constructor disables the sensor before the path
is updated with the correct one.

Pass it into the constructor so that the path is correct from
the beginning.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/65)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/65

Brad Bishop (1):
  Allow sysfs path to be passed to OCC sensor

 bin/Sensors.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.8.1

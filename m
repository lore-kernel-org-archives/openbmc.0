Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 060A81A0290
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 16:10:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454994621778879.6147064779651;
 Mon, 8 Feb 2016 21:10:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Prep work for presistent event logs
Date: Mon,  8 Feb 2016 23:10:20 -0600
Message-Id: <1454994621-21413-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 09 Feb 2016 05:10:26 -0000

Making a very simple commit that contains the additional required
c++ flags along with making the directory to store the new event
manager log files.  This does not enable anything, it is a
precursor got the big drop.  I'd like to get some of the more
simple things in to the build first since a 2 line change is
faster to review.

https://github.com/openbmc/openbmc/pull/168

Chris Austen (1):
  Prep work for presistent event logs

 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.6.4

Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 12D801A0562
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 17:00:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453442422661365.3719113086263;
 Thu, 21 Jan 2016 22:00:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add fix for timeofday
Date: Fri, 22 Jan 2016 00:00:21 -0600
Message-Id: <1453442422-26990-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 22 Jan 2016 06:00:26 -0000

Merge pull request #58 from nkskjames/set_time
https://github.com/openbmc/phosphor-host-ipmid/commit/e90d8bf6a342649dba2fd1589a3cddb3cd051bb1

https://github.com/openbmc/openbmc/pull/144

Chris Austen (1):
  Add fix for timeofday

 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.6.4

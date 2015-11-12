Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BD8541A0672
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 22:45:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447327815569998.6435088100106;
 Thu, 12 Nov 2015 03:30:15 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH kernel-hwmon-occ v2 00/11] First pull request: tested occ
 hwmon driver on Palmetto
Date: Thu, 12 Nov 2015 06:30:01 -0500
Message-Id: <1447327812-21126-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Thu, 12 Nov 2015 11:45:45 -0000

Please see README.md to find details on Palmetto testing result.

https://github.com/openbmc/kernel-hwmon-occ/pull/1

adamliyi (10):
  remove the driver to change file name
  initial check in
  change file name to occ.c
  Create README.md
  fixed the parse error
  make it work with two socket machine (two occ)
  add description to README.md
  output temp*_input in millidegree Celsius
  add Palmetto test result
  add comments

liyi (1):
  initial check in

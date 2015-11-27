Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CC2371A03CB
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 17:50:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448607031900233.4193324566371;
 Thu, 26 Nov 2015 22:50:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v6 00/19] Set default LED status, add GPIO define
Date: Fri, 27 Nov 2015 01:50:12 -0500
Message-Id: <1448607031-24374-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 27 Nov 2015 06:50:35 -0000

Please omit Nov 07 commit, and add Nov 19 commit3

https://github.com/openbmc/skeleton/pull/16

Ken (19):
  LED test
  LED test 2
  LED test3
  Remove ;
  Force fan duty to 100%
  Workarounf for fan PWM 100%
  Remove git 1e751075d5a11736df67c40ead5a8375141269d3
  Set default LED status, add GPIO define
  Init BMC_THROTTLE GPIO to high
  LED test
  LED test 2
  LED test3
  Remove ;
  Force fan duty to 100%
  Workarounf for fan PWM 100%
  Remove git 1e751075d5a11736df67c40ead5a8375141269d3
  Set default LED status, add GPIO define
  Init BMC_THROTTLE GPIO to high
  Add BMC_CPLD GPIO define

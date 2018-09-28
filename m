Return-Path: <joe@perches.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.64; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0064.hostedemail.com
 [216.40.44.64])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42MQNt3M4VzF3Kx
 for <openbmc@lists.ozlabs.org>; Sat, 29 Sep 2018 07:51:25 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 68199182CED2A;
 Fri, 28 Sep 2018 21:51:20 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::,
 RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1345:1431:1437:1534:1541:1711:1730:1747:1777:1792:2393:2553:2559:2562:3138:3139:3140:3141:3142:3352:3865:3868:3874:4250:4321:5007:6117:6261:7514:7809:7901:9121:10004:10848:11233:11657:11658:11914:12043:12438:12555:12679:12740:12895:13069:13311:13357:14096:14181:14384:14721:21080:21365:21451:21627:30054:30091,
 0,
 RBL:47.151.153.53:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:none, Custom_rules:0:0:0, LFtime:30,
 LUA_SUMMARY:none
X-HE-Tag: hill40_45bb6e2f05b3a
X-Filterd-Recvd-Size: 2107
Received: from joe-laptop.perches.com (unknown [47.151.153.53])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Fri, 28 Sep 2018 21:51:19 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: linux-kernel@vger.kernel.org
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, openbmc@lists.ozlabs.org
Subject: Bad MAINTAINERS pattern in section 'ARM/NUVOTON NPCM ARCHITECTURE'
Date: Fri, 28 Sep 2018 14:51:17 -0700
Message-Id: <20180928215117.28711-1-joe@perches.com>
X-Mailer: git-send-email 2.15.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2018 21:51:26 -0000

Please fix this defect appropriately.

linux-next MAINTAINERS section:

	1781	ARM/NUVOTON NPCM ARCHITECTURE
	1782	M:	Avi Fishman <avifishman70@gmail.com>
	1783	M:	Tomer Maimon <tmaimon77@gmail.com>
	1784	R:	Patrick Venture <venture@google.com>
	1785	R:	Nancy Yuen <yuenn@google.com>
	1786	R:	Brendan Higgins <brendanhiggins@google.com>
	1787	L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
	1788	S:	Supported
	1789	F:	arch/arm/mach-npcm/
	1790	F:	arch/arm/boot/dts/nuvoton-npcm*
-->	1791	F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
	1792	F:	drivers/*/*npcm*
	1793	F:	Documentation/devicetree/bindings/*/*npcm*
	1794	F:	Documentation/devicetree/bindings/*/*/*npcm*

Commit that introduced this:

commit 6a498e06ba22872d3a27cc0dae77b9314b1de48b
 Author: Brendan Higgins <brendanhiggins@google.com>
 Date:   Thu Aug 17 09:44:32 2017 -0700
 
     MAINTAINERS: Add entry for the Nuvoton NPCM architecture
     
     Add maintainers and reviewers for the Nuvoton NPCM architecture.
     
     Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
     Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
     Reviewed-by: Avi Fishman <avifishman70@gmail.com>
     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
 
  MAINTAINERS | 14 ++++++++++++++
  1 file changed, 14 insertions(+)

No commit with include/dt-bindings/clock/nuvoton,npcm7xx-clks.h found

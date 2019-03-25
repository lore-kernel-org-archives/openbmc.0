Return-Path: <joe@perches.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.217; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
X-Greylist: delayed 372 seconds by postgrey-1.36 at bilbo;
 Tue, 26 Mar 2019 08:31:07 AEDT
Received: from smtprelay.hostedemail.com (smtprelay0217.hostedemail.com
 [216.40.44.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44SnWH5l0szDqKl
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 08:31:05 +1100 (AEDT)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 3D57F1802A057
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 21:24:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 8C424182CF66A;
 Mon, 25 Mar 2019 21:24:49 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::,
 RULES_HIT:41:69:355:379:541:800:960:968:973:988:989:1260:1345:1359:1431:1437:1534:1542:1711:1730:1747:1777:1792:2393:2553:2559:2562:3138:3139:3140:3141:3142:3352:3865:3866:3868:3870:3874:4250:4321:5007:6117:6261:7264:7514:7809:7901:9121:10004:10848:11233:11657:11658:11914:12043:12262:12295:12438:12555:12679:12683:12740:12895:13161:13229:14095:14096:14110:14181:14721:21080:21365:21451:21611:21627:30054:30091,
 0,
 RBL:47.151.153.53:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:none, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: laugh28_cd10bac20c50
X-Filterd-Recvd-Size: 2956
Received: from joe-laptop.perches.com (unknown [47.151.153.53])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Mon, 25 Mar 2019 21:24:47 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: linux-kernel@vger.kernel.org
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, openbmc@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Bad file pattern in MAINTAINERS section 'ARM/NUVOTON NPCM
 ARCHITECTURE'
Date: Mon, 25 Mar 2019 14:24:46 -0700
Message-Id: <20190325212446.25795-1-joe@perches.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
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
X-List-Received-Date: Mon, 25 Mar 2019 21:31:09 -0000

A file pattern line in this section of the MAINTAINERS file in linux-next
does not have a match in the linux source files.

This could occur because a matching filename was never added, was deleted
or renamed in some other commit.

The commits that added and if found renamed or removed the file pattern
are shown below.

Please fix this defect appropriately.

1: ---------------------------------------------------------------------------

linux-next MAINTAINERS section:

	1893	ARM/NUVOTON NPCM ARCHITECTURE
	1894	M:	Avi Fishman <avifishman70@gmail.com>
	1895	M:	Tomer Maimon <tmaimon77@gmail.com>
	1896	R:	Patrick Venture <venture@google.com>
	1897	R:	Nancy Yuen <yuenn@google.com>
	1898	R:	Brendan Higgins <brendanhiggins@google.com>
	1899	L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
	1900	S:	Supported
	1901	F:	arch/arm/mach-npcm/
	1902	F:	arch/arm/boot/dts/nuvoton-npcm*
-->	1903	F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
	1904	F:	drivers/*/*npcm*
	1905	F:	Documentation/devicetree/bindings/*/*npcm*
	1906	F:	Documentation/devicetree/bindings/*/*/*npcm*

2: ---------------------------------------------------------------------------

The most recent commit that added or modified file pattern 'include/dt-bindings/clock/nuvoton,npcm7xx-clks.h':

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

3: ---------------------------------------------------------------------------

No commit with file pattern 'include/dt-bindings/clock/nuvoton,npcm7xx-clks.h' was found

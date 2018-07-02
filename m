Return-Path: <joe@perches.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.205; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0205.hostedemail.com
 [216.40.44.205])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KLjG1FfhzF1LQ
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 07:58:09 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id AD4A0182CED34;
 Mon,  2 Jul 2018 21:58:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::,
 RULES_HIT:41:355:379:541:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:4321:5007:6117:6119:7514:7576:7809:8957:9038:10004:10400:10848:10967:11232:11657:11658:11914:12043:12555:12679:12740:12760:12895:13069:13200:13229:13311:13357:13439:14096:14097:14181:14659:14721:21080:21451:21611:21627:30054:30090:30091,
 0, RBL:error, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0,
 LFtime:26, LUA_SUMMARY:none
X-HE-Tag: rat62_63529679bfe5a
X-Filterd-Recvd-Size: 2638
Received: from XPS-9350 (unknown [172.58.94.179])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Mon,  2 Jul 2018 21:58:02 +0000 (UTC)
Message-ID: <578ce3d69b43c580d5e810741364b4d86174c3f0.camel@perches.com>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: add subfolders for nuvoton *npcm*
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>, avi.fishman@nuvoton.com
Cc: davem@davemloft.net, mchehab+samsung@kernel.org,
 gregkh@linuxfoundation.org,  rdunlap@infradead.org, avifishman70@gmail.com,
 tmaimon77@gmail.com,  linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Mon, 02 Jul 2018 14:58:00 -0700
In-Reply-To: <20180702144514.18b45671a29cf5250aacb153@linux-foundation.org>
References: <20180701093028.10174-1-avi.fishman@nuvoton.com>
 <20180701093028.10174-2-avi.fishman@nuvoton.com>
 <20180702144514.18b45671a29cf5250aacb153@linux-foundation.org>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2018 21:58:10 -0000

On Mon, 2018-07-02 at 14:45 -0700, Andrew Morton wrote:
> On Sun,  1 Jul 2018 12:30:28 +0300 avi.fishman@nuvoton.com wrote:
> 
> > From: Avi Fishman <AviFishman70@gmail.com>
> > 
> > Add several subfolders to look for *npcm* files under
> > ARM/NUVOTON NPCM ARCHITECTURE
> > 
> > Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> > ---
> >  MAINTAINERS | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e0ce3c5f32e5..23c450adad44 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1727,7 +1727,10 @@ F:	arch/arm/mach-npcm/
> >  F:	arch/arm/boot/dts/nuvoton-npcm*
> >  F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> >  F:	drivers/*/*npcm*
> > +F:	drivers/*/*/*npcm*
> >  F:	Documentation/*/*npcm*
> > +F:	Documentation/*/*/*npcm*
> > +F:	Documentation/*/*/*/*npcm*
> 
> The Docuemntation/ pathnames have changed.  Please refresh to the
> current Linus tree.

$ git ls-files Documentation | grep npcm
Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
Documentation/devicetree/bindings/arm/npcm/npcm.txt
Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt

So maybe:

F:	Documentation/devicetree/bindings/*/*npcm*
F:	Documentation/devicetree/bindings/*/*/*npcm*

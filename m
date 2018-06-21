Return-Path: <joe@perches.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.244; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0244.hostedemail.com
 [216.40.44.244])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BPhw2sXdzF0mQ
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 00:48:47 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id CA489180F737D;
 Thu, 21 Jun 2018 14:48:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:541:599:967:973:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6117:6120:6742:7557:7901:8599:8603:8700:8985:9025:9389:10004:10400:10848:11232:11658:11854:11914:12043:12219:12740:12760:12776:12895:13069:13161:13229:13311:13357:13439:14096:14097:14181:14651:14659:14721:21080:21433:21451:21627:30054:30070:30074:30090:30091,
 0,
 RBL:47.151.150.235:@perches.com:.lbl8.mailshell.net-62.14.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: rule72_4baf34171461e
X-Filterd-Recvd-Size: 2495
Received: from XPS-9350.home (unknown [47.151.150.235])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Thu, 21 Jun 2018 14:48:39 +0000 (UTC)
Message-ID: <8f9c37fd13abe2596521afb5d2779f644c214a93.camel@perches.com>
Subject: Re: [PATCH v2 2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>, 
 cocci <cocci@systeme.lip6.fr>, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com,  avifishman70@gmail.com, yuenn@google.com,
 brendanhiggins@google.com,  venture@google.com, joel@jms.id.au,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org,  openbmc@lists.ozlabs.org
Date: Thu, 21 Jun 2018 07:48:38 -0700
In-Reply-To: <alpine.DEB.2.20.1806211515060.3774@hadrien>
References: <20180619105352.97181-1-tmaimon77@gmail.com>
 <20180619105352.97181-3-tmaimon77@gmail.com>
 <20180620164853.GA3459@roeck-us.net>
 <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
 <alpine.DEB.2.20.1806211515060.3774@hadrien>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 14:48:48 -0000

On Thu, 2018-06-21 at 15:17 +0200, Julia Lawall wrote:
> On Wed, 20 Jun 2018, Joe Perches wrote:
> > Also, spatch (1.0.4) seems to have a defect for this
> > when the type is used in operations that change a
> > smaller type to int or unsigned int.
> > 
> > i.e.: (offset is u16, but offset * 2 is int)
> 
> Ah.  The rule is that the result type is always the larger one?

Yes, but not quite, no.

The c90 rules are called "integer promotions" and are
detailed in section 6.3 Conversions

Basically, if any type is smaller than int, all operations
are done as int if possible, or unsigned int if necessary.
If any type is larger than int, then the larger type is used.

If you don't have the c90 standard, this one is close enough.
http://c0x.coding-guidelines.com/6.3.html
(use the next button several times to read the whole section)

Also, section 6.5 details "expressions" where the operands 
of things like bit operations use integer promotions.

> Unfortunately, Coccinelle doesn't know the size of any type.  I could add
> some special cases, but that may be more confusing than helpful.

Maybe, but when I saw the suggested removal, I was surprised.

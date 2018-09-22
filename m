Return-Path: <joe@perches.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.148; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
X-Greylist: delayed 321 seconds by postgrey-1.36 at bilbo;
 Sun, 23 Sep 2018 00:22:29 AEST
Received: from smtprelay.hostedemail.com (smtprelay0148.hostedemail.com
 [216.40.44.148])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42HXjd0ddczF3Mw;
 Sun, 23 Sep 2018 00:22:27 +1000 (AEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id BB67918016663;
 Sat, 22 Sep 2018 14:17:07 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 38B6B181D3417;
 Sat, 22 Sep 2018 14:17:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::::,
 RULES_HIT:41:355:379:541:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1593:1594:1711:1714:1730:1747:1777:1792:1801:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3351:3622:3865:3866:3867:3871:3872:3874:4321:4605:5007:10004:10400:10450:10455:10848:11232:11658:11914:12296:12740:12760:12895:13069:13255:13311:13357:13439:14659:14721:19904:19999:21080:21451:21627:30054:30060:30090:30091,
 0,
 RBL:47.151.153.53:@perches.com:.lbl8.mailshell.net-62.14.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:36,
 LUA_SUMMARY:none
X-HE-Tag: fact64_773dac533722d
X-Filterd-Recvd-Size: 1822
Received: from XPS-9350.home (unknown [47.151.153.53])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Sat, 22 Sep 2018 14:16:59 +0000 (UTC)
Message-ID: <a31b639d4415d6edd4174b3d4b71528ec94ad10a.camel@perches.com>
Subject: Re: [PATCH v2] i2c: aspeed: fix invalid clock parameters for very
 large divisors
From: Joe Perches <joe@perches.com>
To: Brendan Higgins <brendanhiggins@google.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, linux-i2c@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Date: Sat, 22 Sep 2018 07:16:58 -0700
In-Reply-To: <CAFd5g46==5HG2stvuVfOUtsSW37SvLN6cCmOhRSxibrUpxb8aA@mail.gmail.com>
References: <20180921221025.75003-1-brendanhiggins@google.com>
 <f5943177-6f1b-9344-3821-2aac001ff45d@linux.intel.com>
 <CAFd5g46==5HG2stvuVfOUtsSW37SvLN6cCmOhRSxibrUpxb8aA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sat, 22 Sep 2018 14:22:29 -0000

On Fri, 2018-09-21 at 15:30 -0700, Brendan Higgins wrote:
> On Fri, Sep 21, 2018 at 3:26 PM Jae Hyun Yoo
[]
> > > +             dev_err(dev,
> > > +                     "clamping clock divider: divider requested, %u, is greater than largest possible divider, %u.",
> > 
> > Please put a newline character at the end of the string.
> 
> I always forget to do that. I wonder if anyone has considered adding a
> warning for this to checkpatch?

Yes, but it's not possible to know when there
a pr_cont that follows so any checkpatch test
would be a false positive generator too.

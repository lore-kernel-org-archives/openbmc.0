Return-Path: <joe@perches.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.150; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0150.hostedemail.com
 [216.40.44.150])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Qltr5B4tzF35S
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 03:10:11 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id EA1D31802A37A;
 Wed, 11 Jul 2018 17:10:06 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::,
 RULES_HIT:41:355:379:541:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2198:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3870:3871:3874:4321:4605:5007:6742:7903:8660:10004:10400:10848:11026:11232:11473:11658:11914:12043:12296:12438:12740:12760:12895:13069:13148:13230:13311:13357:13439:14181:14659:14721:21063:21080:21092:21212:21433:21627:30054:30060:30090:30091,
 0,
 RBL:47.151.153.53:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:32,
 LUA_SUMMARY:none
X-HE-Tag: duck95_a486b15c84c
X-Filterd-Recvd-Size: 2624
Received: from XPS-9350.home (unknown [47.151.153.53])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Wed, 11 Jul 2018 17:10:04 +0000 (UTC)
Message-ID: <c13fc12e859f7bdb300f08ad805cdf6d7ec09f52.camel@perches.com>
Subject: Re: [PATCH] i2c: aspeed: Add newline characters into message
 printings.
From: Joe Perches <joe@perches.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org,  OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, jarkko.nikula@linux.intel.com, 
 james.feist@linux.intel.com, vernon.mauery@linux.intel.com
Date: Wed, 11 Jul 2018 10:10:03 -0700
In-Reply-To: <2d2f2b2b-394a-506f-c870-33520335250b@linux.intel.com>
References: <20180702211359.30585-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g443wTQJ+0hrprOV949Sr_nRnBGpNo3Wd01xFN4GW4K2Ng@mail.gmail.com>
 <2d2f2b2b-394a-506f-c870-33520335250b@linux.intel.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 17:10:13 -0000

On Wed, 2018-07-11 at 09:53 -0700, Jae Hyun Yoo wrote:
> On 7/10/2018 10:42 PM, Brendan Higgins wrote:
> > On Mon, Jul 2, 2018 at 2:14 PM Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> > > There are some log printing without a newline character. This
> > > patch adds the missing newline characters.
[]
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
[]
> > > @@ -431,7 +431,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
> > >           */
> > >          if (bus->master_state == ASPEED_I2C_MASTER_START) {
> > >                  if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> > > -                       pr_devel("no slave present at %02x", msg->addr);
> > > +                       pr_devel("no slave present at %02x\n", msg->addr);
> > 
> > Unless something changed in the last couple versions of the kernel, this is the
> > only line that actually changes anything. dev_* inserts a newline for every
> > call.

Not true.

Any printk without KERN_CONT inserts a newline
if the last character
emitted is not a newline.

dev_<level> uses can also be followed by pr_cont.

So this patch does reduce the possibility of
interleaved messages from multiple processes.

Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41HbNj6gqmzF2yr;
 Sat, 30 Jun 2018 11:22:45 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5U167Z9001754;
 Fri, 29 Jun 2018 20:06:08 -0500
Message-ID: <36f23db17a3d25e78e3387cc9d18fc66b4df74d1.camel@kernel.crashing.org>
Subject: Re: [RFC PATCH 01/14] devres: Add devm_of_iomap()
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org,
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH
 <gregkh@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>
Date: Sat, 30 Jun 2018 11:06:07 +1000
In-Reply-To: <CAHp75VfshFLuvOSB4deALX=EUf2Z_RW4Ct-K5cMsAj4yifF-cg@mail.gmail.com>
References: <20180622043134.18238-1-benh@kernel.crashing.org>
 <20180622043134.18238-2-benh@kernel.crashing.org>
 <CACRpkdbhxjahYaVnQN0xqD0NLPouO8VCW8w-GZD0sbLFtFtY5g@mail.gmail.com>
 <CAHp75VfshFLuvOSB4deALX=EUf2Z_RW4Ct-K5cMsAj4yifF-cg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
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
X-List-Received-Date: Sat, 30 Jun 2018 01:22:46 -0000

On Fri, 2018-06-29 at 23:27 +0300, Andy Shevchenko wrote:
> On Fri, Jun 29, 2018 at 12:14 PM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
> 
> > I wonder if it is easy to find these cases and replace them with
> > this neat function...
> 
> Would be reasonable easy by using coccinelle.

For the obvious ones yes. A lot of the existing users of of_iomap
however don't do the request_region, and while they probably should and
should use the new accessor, this can't be done blindly without
testing, because there are many old things around that have broken
memory region tracking and that will fail..

I plan to do a sweep through some of my old powermac/powerpc stuff one
of these days and do some conversions.

Cheers,
Ben.

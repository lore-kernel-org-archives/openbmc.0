Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3RrQ5pd5zDq7g
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 13:59:50 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1492055940.20567.1.camel@fuzziesquirrel.com>
Subject: Re: [PATCH linux dev-4.7 0/2] enable gpio-keys
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Date: Wed, 12 Apr 2017 23:59:00 -0400
In-Reply-To: <CACPK8XcT=QGSXmStod2AFYm6gXgQp1U6=gTHkH_z-0giM7czMQ@mail.gmail.com>
References: <1491961541-10864-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <CACPK8XcT=QGSXmStod2AFYm6gXgQp1U6=gTHkH_z-0giM7czMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Apr 2017 03:59:51 -0000

> Hi Brad,
> 
> On Wed, Apr 12, 2017 at 11:15 AM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
> > Enable the gpio-keys and evdev drivers on ast24xx generally.
> >
> > Bind gpio-key events to the checkstop and air-water cooled gpios on the
> > Witherspoon system.
> 
> Thanks for the patches. It looks like something went wrong in your
> git-send-email invocation:
> 
>  From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>  To: "joel@jms.id.au" <openbmc@lists.ozlabs.org>
> 
> Did you intend to send it to me as well as the list?

I did.  Sorry about that.

> 
> Cheers,
> 
> Joel
> 
> >
> > Brad Bishop (2):
> >   ARM: configs: aspeed: Enable keyboard-gpio
> >   ARM: dts: Enable checkstop and cooling gpio keys
> >
> >  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 17 +++++++++++++++++
> >  arch/arm/configs/aspeed_g4_defconfig             |  8 +++++++-
> >  arch/arm/configs/aspeed_g5_defconfig             |  8 +++++++-
> >  3 files changed, 31 insertions(+), 2 deletions(-)
> >
> > --
> > 1.8.3.1

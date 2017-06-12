Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wmpPq3pmkzDqCt
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 09:04:47 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v5CN4UpN004300;
 Mon, 12 Jun 2017 18:04:31 -0500
Message-ID: <1497308676.2897.3.camel@kernel.crashing.org>
Subject: Re: [PATCH] drivers/misc: add Aspeed LPC snoop driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Rick Altherr <raltherr@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Robert Lippert <roblip@gmail.com>
Date: Tue, 13 Jun 2017 09:04:36 +1000
In-Reply-To: <CAPLgG==_Vh8ucTY+r1NFD3+QuURYWOCBwbftvTzZD5Q=hsQJeQ@mail.gmail.com>
References: <20170602215322.24376-1-rlippert@google.com>
 <CACPK8XfWySi5kDEASVpmDKAmBSByB6w0ocQxinazqTHbv+omcQ@mail.gmail.com>
 <CAFRv3wxh-+KiaLfD7zc4+FeiUOn4AyvJtcRLshiPQfpNb8uk4g@mail.gmail.com>
 <CACPK8XfKmm9ZUesgNJsL=MeruOfLzi-j6Dfjb2Be1zfdYn7XcQ@mail.gmail.com>
 <CAK8P3a0BLCL8s+-iWut=himPsVUL==+jqzhDP92+NOPXEMsoNg@mail.gmail.com>
 <CAPLgG=mYiODs6KAjdJV3dZBXrdR=OWsFwdEJ9jT+5-_CC9_pYA@mail.gmail.com>
 <CAK8P3a0ditvpCzsCA+5uwZ8wVTvbsob0OywNZu_VK1eKD=K4BQ@mail.gmail.com>
 <CAPLgG==_Vh8ucTY+r1NFD3+QuURYWOCBwbftvTzZD5Q=hsQJeQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 12 Jun 2017 23:04:48 -0000

On Fri, 2017-06-09 at 15:16 -0700, Rick Altherr wrote:
> I've only seen the Aspeed eSPI hardware.  It implements demux of the
> eSPI channels in the hardware and provides separate DMA descriptors
> for each.  It looks nothing like LPC at any level.

Sort of... it does have a kind of memory mapped IO channel which
*could* be aliased to the LPC IO space though afaik, Aspeed just
aliases it to their internal bus which is a recipe for disaster when it
comes to security, so one should just disable it.

It's unfortunate, I don't see how you can access things like the legacy
UART, RTC etc... via eSPI. It looks like yet another crackpot invented
for SMM BIOS to get in the way and emulate everything. Yuck.

Ben.

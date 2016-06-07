Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNxYz0RVFzDq66
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 13:16:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=vHY01ch2; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com D3F1D27D86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1465269412;
 bh=q04hQI8sz066FgwZAsMyu95uiaUOCBCmloZRZmeIi0Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=vHY01ch2pBqKuYO9AMYHt4zEH6NXpmIvlHrcbBxHxmvgI1Xa2b4YiA+7ssV/72/c6
 8s6dkfsfO/qCcmeVBTZCyCQxmsZvuw021f4u0GXH1gmfd2bcWJxodqi89mDXeBROm0
 jePPltNCg4x66Rqpa1k04QTwccPYwo1JYfAvf+Qc=
Message-ID: <1465269410.30053.6.camel@fuzziesquirrel.com>
Subject: Re: [PATCH openbmc 06/10] Move static kernel recipe configuration
 to include
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 06 Jun 2016 23:16:50 -0400
In-Reply-To: <CACPK8XeSGjPNhXBvvRigQJ8eE3YWmJ3WmgGcR782crw6Wek6tg@mail.gmail.com>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-7-openbmc-patches@stwcx.xyz>
 <CACPK8XeSGjPNhXBvvRigQJ8eE3YWmJ3WmgGcR782crw6Wek6tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jun 2016 03:16:55 -0000

On Sun, 2016-06-05 at 11:40 -0500, Joel Stanley wrote:
> On Sat, Jun 4, 2016 at 12:20 AM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >
> > This facilitates multiple kernel recipes.
> >
> > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > ---
> >  .../common/recipes-kernel/linux/linux-obmc.inc         | 18 ++++++++++++++++++
> >  .../common/recipes-kernel/linux/linux-obmc_4.4.bb      | 18 +-----------------
> >  2 files changed, 19 insertions(+), 17 deletions(-)
> >  create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
> >
> > diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
> > new file mode 100644
> > index 0000000..c64ff9d
> > --- /dev/null
> > +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
> > @@ -0,0 +1,18 @@
> > +DESCRIPTION = "Linux kernel for OpenBMC"
> > +SECTION = "kernel"
> > +LICENSE = "GPLv2"
> > +
> > +KCONFIG_MODE="--alldefconfig"
> > +
> > +KSRC ?= "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
> 
> Can we tell poky to download a tarball instead of waiting for it to
> check out a git repository?

Sure, but I haven't changed anything functionally here...just stuck this
in a variable so its easy to point it at a different repository when
hacking.  Can we explore that improvement later?

> 
> > +SRC_URI = "${KSRC}"
> > +SRC_URI += "file://hwmon.cfg"
> 
> As I commented in another patch, I'd prefer we weren't spreading our
> configuration all over the poky tree and instead it was all in one
> place.

I responded to this in the other thread.

> 
> Cheers,
> 
> Joel
> 
> > +
> > +LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
> > +
> > +PV = "${LINUX_VERSION}+git${SRCPV}"
> > +
> > +COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
> > +
> > +inherit kernel
> > +require recipes-kernel/linux/linux-yocto.inc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

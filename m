Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rR4JR1ZrxzDq5k
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 00:27:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=y4kpQBjF; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 72F1725BDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1465568852;
 bh=sdQz+KkZi46NBdNg4zurOBJIovBF20bhXsZkL3xU2/g=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=y4kpQBjFfOCygYgqNJk4jygyjis0okveI83HA3RS+ay7YBSE1PH53wR/pngnDTPtD
 QEXAT70ck9R9dIKnRPzIysLhP4L7HmmeTZuT6Zkj7abjiLOUqjJaPy5sm4kRZmwEKi
 LFfiPNP3Pf9F/EApw1ly+lh7p84unfLkbyNfYZfw=
Message-ID: <1465568849.10360.0.camel@fuzziesquirrel.com>
Subject: Re: [PATCH openbmc v2 08/11] AST2400: Use Palmetto as the default
 uboot target
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2016 10:27:29 -0400
In-Reply-To: <CACPK8Xe5C6GrHwp02DtEVSt10jkceKV_F2doZ5+iNOskt3TDoQ@mail.gmail.com>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
 <20160609002032.984-9-openbmc-patches@stwcx.xyz>
 <CACPK8Xe5C6GrHwp02DtEVSt10jkceKV_F2doZ5+iNOskt3TDoQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 10 Jun 2016 14:27:36 -0000

On Wed, 2016-06-08 at 19:43 -0500, Joel Stanley wrote:
> On Wed, Jun 8, 2016 at 7:20 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >
> > An evaluation board target would be nice here but at least Palmetto is
> > an improvement over the generic ARM target.
> 
> Can you open a ticket for someone to create a evb target?

https://github.com/openbmc/openbmc/issues/317

> 
> Does anyone have a ast2400 evb to test on?
> 
> >
> > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> > ---
> >  .../meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc           | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> > index 97a8834..964de9a 100644
> > --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> > +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> > @@ -5,7 +5,7 @@
> >  PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
> >  PREFERRED_VERSION_linux-obmc ?= "4.4+git%"
> >
> > -UBOOT_MACHINE ?= "versatileab_config"
> > +UBOOT_MACHINE ?= "palmetto_config"
> >  UBOOT_ENTRYPOINT ?= "0x40001000"
> >  UBOOT_LOADADDRESS ?= "0x40001000"
> >
> > --
> > 2.8.3
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc

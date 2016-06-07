Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNz5k4MNfzDq5v
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 14:26:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=t8wkNI+l; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com DFE1827EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1465273559;
 bh=gc3JLxjpAUiuY5ZqmqBUh84X8XQdczPLfYUz9TnqN1E=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=t8wkNI+ltvUWDUESetwIzuKxQqkXfhbQ8E8Zq6uMy4++msJPf/zMFPK0Kwyrod8do
 xUNp46QP2m0ggG5WB12P20qH8SKN9IayfAjw1OY85zZ8AZREoL/QljYxMe0In/sSo9
 gIyyDlxy4aZLDuzwGtpZf44k3uDKelig5tpFwgaM=
Message-ID: <1465273557.30053.41.camel@fuzziesquirrel.com>
Subject: Re: [PATCH openbmc 09/10] AST2500: Initial AST2500 BSP layer
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: andrew@aj.id.au
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 07 Jun 2016 00:25:57 -0400
In-Reply-To: <1465179547.16048.7.camel@aj.id.au>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-10-openbmc-patches@stwcx.xyz>
 <1465179547.16048.7.camel@aj.id.au>
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
X-List-Received-Date: Tue, 07 Jun 2016 04:26:04 -0000

On Mon, 2016-06-06 at 11:49 +0930, Andrew Jeffery wrote:
> On Sat, 2016-06-04 at 00:20 -0500, OpenBMC Patches wrote:
> >  5 files changed, 132 insertions(+)
> >  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
> >  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
> >  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
> >  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend
> >  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt
> 
> This might show my ignorance of Yocto, but what drives us to structure
> the repository this way? Specifically, why are we nesting meta-aspeed

I think openbmc in the name meta-openbmc-bsp might be getting in the way
here.  Technically once upstream uboot/kernel support these chips there
isn't anything preventing anyone from using these outside of the openbmc
project.

Another thing to keep in mind as you contemplate this is that at the
moment meta-openbmc-bsp and meta-openbmc-machines are git subtrees in
the openbmc repository.

In my head the endgame would be some SOC vendor repositories hosted
upstream @ yoctoproject.org (they already do this with intel/freescale)
and OpenBMC just pulls those layers in.

> under meta-openbmc-bsp? Whilst OpenBMC is heavily centred around the
> Aspeed SoCs, in general Aspeed SoCs are used by more than OpenBMC. It
> feels like the OOP inheritance vs composition problem. Is that a fair
> analogy? If so, should we try to flatten out this hierarchy a bit?





> 
> Cheers,
> 
> Andrew
> _______________________________________________ openbmc mailing list openbmc@lists.ozlabs.org https://lists.ozlabs.org/listinfo/openbmc

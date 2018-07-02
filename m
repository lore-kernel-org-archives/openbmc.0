Return-Path: <mchehab+samsung@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mchehab+samsung@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KMNJ1SBqzF1D8
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 08:28:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WGcpKKte4ftPjlrm45UJa0lnnKkBOc5fqIteZi7Xrwk=; b=Gy66wMZQ8yfj4djYQI6sixgB6
 YzAEdy02hQbWeQkTECW79VqMxl7pZHp08uW+LzhnVa5+3rKrzBVilRsH2ZfkjHk4n3aXPFjjEL70I
 XzTnq7Nq4ZcMq1aLrySlCUJl35E4xqooQoCeaNc4usBMRw4DdRskMckR28WFiBWmjOQ7U1tfEeBvI
 YCk2bRCCKZJfC5byxX/fsnpVuGpSLIxDH7JSIS05mPsSSSBEuKPc/smMCFBqfQIR5Wv97AzGYWziB
 oiMeUuSYgOIQSsg/g8vFjuZPc/HKACsbRxeUmS107Ibf5AVOgjk76F9LAzp0ztJJEv7YnKNkoqzPO
 wD9rV6/hQ==;
Received: from [179.182.160.95] (helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fa7Iz-0008VT-H2; Mon, 02 Jul 2018 22:28:21 +0000
Date: Mon, 2 Jul 2018 19:28:17 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, avi.fishman@nuvoton.com,
 davem@davemloft.net, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/1] MAINTAINERS: add subfolders for nuvoton *npcm*
Message-ID: <20180702192610.291e885e@coco.lan>
In-Reply-To: <578ce3d69b43c580d5e810741364b4d86174c3f0.camel@perches.com>
References: <20180701093028.10174-1-avi.fishman@nuvoton.com>
 <20180701093028.10174-2-avi.fishman@nuvoton.com>
 <20180702144514.18b45671a29cf5250aacb153@linux-foundation.org>
 <578ce3d69b43c580d5e810741364b4d86174c3f0.camel@perches.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 05 Jul 2018 11:44:20 +1000
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
X-List-Received-Date: Mon, 02 Jul 2018 22:28:37 -0000

Em Mon, 02 Jul 2018 14:58:00 -0700
Joe Perches <joe@perches.com> escreveu:

> On Mon, 2018-07-02 at 14:45 -0700, Andrew Morton wrote:
> > On Sun,  1 Jul 2018 12:30:28 +0300 avi.fishman@nuvoton.com wrote:
> >   
> > > From: Avi Fishman <AviFishman70@gmail.com>
> > > 
> > > Add several subfolders to look for *npcm* files under
> > > ARM/NUVOTON NPCM ARCHITECTURE
> > > 
> > > Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> > > ---
> > >  MAINTAINERS | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index e0ce3c5f32e5..23c450adad44 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1727,7 +1727,10 @@ F:	arch/arm/mach-npcm/
> > >  F:	arch/arm/boot/dts/nuvoton-npcm*
> > >  F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> > >  F:	drivers/*/*npcm*
> > > +F:	drivers/*/*/*npcm*
> > >  F:	Documentation/*/*npcm*
> > > +F:	Documentation/*/*/*npcm*
> > > +F:	Documentation/*/*/*/*npcm*  
> > 
> > The Docuemntation/ pathnames have changed.  Please refresh to the
> > current Linus tree.  
> 
> $ git ls-files Documentation | grep npcm
> Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
> Documentation/devicetree/bindings/arm/npcm/npcm.txt
> Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
> Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> 
> So maybe:
> 
> F:	Documentation/devicetree/bindings/*/*npcm*
> F:	Documentation/devicetree/bindings/*/*/*npcm*
> 

It is already like that, since commit
	5efa6f8473cc ("MAINTAINERS: fix location of DT npcm files")

Btw, I suggest to check documentation references with:

	./scripts/documentation-file-ref-check

It helps to identify if the links are pointing to the right
places. It does it tree-wide, though, and not per patch.

Thanks,
Mauro

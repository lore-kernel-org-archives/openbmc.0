Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tlLDW6chMzDwM8
 for <openbmc@lists.ozlabs.org>; Fri, 23 Dec 2016 18:51:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJq5wVoh"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id i88so13544585pfk.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 23:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GzE2t9KHalxk+j3tQ4HdbO7QG/p3d0H+nYbzEf6GoCM=;
 b=QJq5wVoh+qH9XPHzoEUilmTA8yNMrKtFOPyKFS6zKKS2N6FghtD07fJihcWV2Bx14Y
 5dHPepHo6ggZidyzQym1iFAZfrZ+kROwaHelk2X7iBR41rR9IDP7oDmnv+Y78rtL3uAk
 BvinKgC/L/GYsLR6NPtdKVrcJCO7j9aDLiz4p2IQcHUw3Y3lZDFywQAYtX3klM2hVTee
 KFybTF9O8HZD4epzoW1d3sA26ipXw+Dp2Gvm3k74b+sX++uv+1qF7gbi1wzSJaVbFagp
 ESFxxcVQ6/Lcq8MlF52AjAl+RZgHk3XKt7/gkwUyv1G6mAgMZ9d5PWlWr/bPLkVcpSfS
 lL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzE2t9KHalxk+j3tQ4HdbO7QG/p3d0H+nYbzEf6GoCM=;
 b=QEnsdjkORrE74fb83Vovf2godncHzOkZOktwjYwspjWNDXoaWws2klyQKZd+q8c99c
 ga0AR808VBDUUaEgYCKYsElZj2kRlRPvawWtnFjP359d1/TrPD1nawRZiP/xlI5hqsid
 KZ/g4lLByJV2wZ83yuIS6nHfeDipbdeQRfn3INeCLr7I+nFvkfGhh14gJydS+TSubPgt
 QuKTDjQxWvRUngLnzD3jIIFcuSXkr1ZHT8tPilOQjdTFauxVQcZdmtKWiLY4yvXwOFFa
 MjGSE0RxXuPe5qwhr2cRSgwe7Za1YpbfsQLPVlRy1iu71XDLahCChtVeNIyy4prGk2BW
 LeTg==
X-Gm-Message-State: AIkVDXLRfca9LlbdaA0rLSWQ9DZkiQqOjmlxAofxbd5dNZZK6pmh/iIvEJGNn16yqxed2w==
X-Received: by 10.99.114.2 with SMTP id n2mr23813731pgc.130.1482479466250;
 Thu, 22 Dec 2016 23:51:06 -0800 (PST)
Received: from [192.168.1.20] ([220.240.15.54])
 by smtp.googlemail.com with ESMTPSA id s3sm27645506pfg.14.2016.12.22.23.51.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Dec 2016 23:51:05 -0800 (PST)
Message-ID: <1482479440.14044.2.camel@gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: dts: aspeed: Reserve BMC ram for host to
 BMC communication
From: Cyril Bur <cyrilbur@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Fri, 23 Dec 2016 18:50:40 +1100
In-Reply-To: <1482454906.3419.24.camel@aj.id.au>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-2-cyrilbur@gmail.com>
 <1482454906.3419.24.camel@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
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
X-List-Received-Date: Fri, 23 Dec 2016 07:51:08 -0000

On Fri, 2016-12-23 at 11:31 +1030, Andrew Jeffery wrote:
> Hi Cyril,
> 
> On Thu, 2016-12-22 at 17:06 +1100, Cyril Bur wrote:
> > > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > 
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 12 ++++++++++++
> >  arch/arm/boot/dts/aspeed-g4.dtsi              |  6 ++++++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > index 13e9f18fbed8..b60044800ea1 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > @@ -29,6 +29,18 @@
> > >  			no-map;
> > >  			reg = <0x5f000000 0x01000000>; /* 16MB */
> > >  		};
> > 
> > +
> > > > +		flash_memory: region@54000000 {
> > > 
> > > +			compatible = "aspeed,ast2400-lpc-ctrl";
> > > +			no-map;
> > > +			reg = <0x54000000 0x04000000>; /* 64M */
> > > +		};
> > > +	};
> > 
> > +
> > > +	flash_buffer@1e789000 {
> > > +		compatible = "aspeed,ast2400-lpc-ctrl";
> > > +		memory-region = <&flash_memory>;
> > > +		reg = <0x1e789000 0x8>;
> > 
> >  	};
> 
> Save this for addition in 2/5?
> 
> >  
> >          leds {
> > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> > index 7c78eb1c01ff..1ed2a9ba7ab8 100644
> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > @@ -870,6 +870,12 @@
> > >  				interrupts = <8>;
> > >  			};
> > 
> >  
> > > > +			mbox: mbox@1e789200 {
> > > 
> > > +				compatible = "aspeed,ast2400-mbox";
> > > +				reg = <0x1e789200 0x5c>;
> > > +				interrupts = <46>;
> > 
> > +			};
> 
> Save this for addition in 3/5?
> 
> Or maybe just squash them all together?
> 

Yeah I'm not sure these three commits make sense - it might just be
easier to have 1 dts changes commit.

Thanks,

Cyril

> Andrew
> 
> > +
> > > >  			wdt1: wdt@1e785000 {
> > > 
> > >  				compatible = "aspeed,ast2400-wdt";
> > >  				reg = <0x1e785000 0x1c>;

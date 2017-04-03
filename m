Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxZ7G74kXzDq8M
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 00:22:18 +1000 (AEST)
Received: by mail-oi0-f65.google.com with SMTP id f193so19859392oib.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Apr 2017 07:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HM/R/mFxfIewTK5CerAYAm6LrujTjGTvxLCgXR9FWDw=;
 b=sT1SrHgTBPrOJziVWnyWPbLA591zV34TH27huqehyFJfi5vj60ZKhuLxlIm8jQeAa5
 pLyRpF1bvbVaJNb7cLGdEZoX2KNEiDcg49FMzYLzze+UUM3mn6AxWYtDlXsDhEBofG0O
 f3szjRQAWGxsh+VBMdvX1jd1MxP74od0X5FWgpaQpZrMkqkA8Md2BNo4/UJyTLfOy3Hk
 vpQC99aV8W64KxxqX0xvi9iY88hCGgxunt3rxlNqPOTAxWiQXozZziIb/o7CZlUFkVOG
 o6PiLreTzfQ6ki4Xbe3uNBsGtboHaRl4FZoMMtwbtywNEKjZTItB+vonsv89CiOZsf5C
 FhXg==
X-Gm-Message-State: AFeK/H1+P542ia16Su7gEvn8DbEnmYftA6rGyXrwHJALkbRDBtn6am6YAo9fqBPTrqq+TA==
X-Received: by 10.157.17.197 with SMTP id y5mr8698360oty.150.1491229336851;
 Mon, 03 Apr 2017 07:22:16 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id p47sm6806510ota.54.2017.04.03.07.22.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Apr 2017 07:22:16 -0700 (PDT)
Date: Mon, 3 Apr 2017 09:22:15 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 mark.rutland@arm.com, tglx@linutronix.de, jason@lakedaemon.net,
 marc.zyngier@arm.com, joel@jms.id.au, vz@mleia.com, mouse@mayc.ru,
 clg@kaod.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v6 3/5] i2c: aspeed: added documentation for Aspeed I2C
 driver
Message-ID: <20170403142215.zvj3aypoarczf2ok@rob-hp-laptop>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-4-brendanhiggins@google.com>
 <1490691283.3177.112.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490691283.3177.112.camel@kernel.crashing.org>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
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
X-List-Received-Date: Mon, 03 Apr 2017 14:22:19 -0000

On Tue, Mar 28, 2017 at 07:54:43PM +1100, Benjamin Herrenschmidt wrote:
> On Mon, 2017-03-27 at 22:12 -0700, Brendan Higgins wrote:
> > Added device tree binding documentation for Aspeed I2C busses.
> > 
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> 
> > +	i2c0: i2c-bus@40 {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		#interrupt-cells = <1>;
> > +		reg = <0x40 0x40>;
> > +		compatible = "aspeed,ast2400-i2c-bus";
> > +		bus = <0>;
> > +		clocks = <&clk_apb>;
> > +		clock-frequency = <100000>;
> 
> For busses it's more traditional to make this "bus-frequency" but
> that's a nit and Linux/fdt has not respected that tradition terribly
> well. If you respin, it might be work changing.

Makes sense, but that's news to me. I'm still new to this DT stuff.

> The clock-frequency tends to be the frequency of the controller itself.

The clock binding has largely replaced that.

Rob

Return-Path: <linux+openbmc=lists.ozlabs.org@armlinux.org.uk>
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdvm75vvCzDsyc
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 22:41:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="nVYVBMnk"; dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2014; 
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=/r22rAFjPLF9fnEfPTaG7I5oyEgkWVpmfo4oR+cWj5Y=; 
 b=nVYVBMnkZTDBIAHRASdkf6edmQ8aRRvFolxbjOSsw5tao4ELOCd2dmrAW0M2XrHlf8aaV0HgKoUKxgMi0UVnj3RLZ0IxIb5F6t0v92Zlz6gcq6zQJ05kJZX/dQ196bIIG/lnh5CHeowSZUIdLlvweRNQCTXYIQQv6NtlsUUIpao=;
Received: from n2100.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:4f86]:50859)
 by pandora.armlinux.org.uk with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <linux@armlinux.org.uk>)
 id 1cH7vb-0004i6-9F; Wed, 14 Dec 2016 11:40:55 +0000
Received: from linux by n2100.armlinux.org.uk with local (Exim 4.76)
 (envelope-from <linux@n2100.armlinux.org.uk>)
 id 1cH7vX-0005ce-T3; Wed, 14 Dec 2016 11:40:51 +0000
Date: Wed, 14 Dec 2016 11:40:51 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Cc: mark.rutland@arm.com,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 robh+dt@kernel.org, joel@jms.id.au, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
Message-ID: <20161214114051.GC14217@n2100.armlinux.org.uk>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <1481702104-8617-5-git-send-email-jaghu@google.com>
 <3917905.e4iOqADnVQ@wuerfel> <10697525.O7CkPN6Gfl@wuerfel>
 <20161214110635.GB14217@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161214110635.GB14217@n2100.armlinux.org.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
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
X-List-Received-Date: Wed, 14 Dec 2016 11:41:12 -0000

On Wed, Dec 14, 2016 at 11:06:35AM +0000, Russell King - ARM Linux wrote:
> On Wed, Dec 14, 2016 at 10:00:46AM +0100, Arnd Bergmann wrote:
> > On Wednesday, December 14, 2016 9:55:47 AM CET Arnd Bergmann wrote:
> > > According to your introductory mail, the interface is assumed to be
> > > a 74HC164. Should we use that ID in the compatible string?
> > > 
> > > We can always add other strings later if we want to support multiple
> > > wire formats.
> > 
> > Actually, looking up 74hc164, that seems to be a gpio expander,
> > so maybe a more flexible way to do the same is to put a driver
> > for the expander into drivers/gpio/ and have the main driver
> > access the outputs of that using the gpiolib interface.
> 
> There already is - drivers/gpio/gpio-74x164.c

Looking at this more, it's a SPI driver, presumably because the first
case where it appeared was on a SPI bus.

However, it's not a SPI device as such, it's a piece of standard,
general purpose logic that's been around for many years, pre-dating
the SPI bus.

Now, as for DT, we have this "DT represents the hardware, not the
implementation" edict, which now brings up an interesting problem.

If we want to use this driver in its existing form, we need to:

- declare in DT a spi-gpio driver to provide a SPI bus on the GPIO
  pins connected to the 74HC164.
- attach the 74HC164 to the SPI bus.

The problem with that is it's not representative of the hardware -
what we're saying is that we want to reuse our existing implementation
and make DT conform to the implementation.  At that point, we might as
well scrap our "DT is implementation independent" edict above.

What if, tomorrow, we end up with 74HC164 connected to via a different
method?

I think a much more sensible approach would be to turn the GPIO side
of the 74x164 driver into a library, which can be re-used by multiple
bus-specific drivers - one for SPI which allows it to be used in its
current form, one for our platform bus which takes the GPIO lines for
the data, clock and clear signals.

I also don't see why they shouldn't use the same compatible - they're
the same _device_ at the end of the day, just wired up differently.
It makes the binding documentation a little fun wrt what are required
and optional properties, but nothing that shouldn't be too difficult.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.

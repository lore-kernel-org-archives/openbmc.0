Return-Path: <linux+openbmc=lists.ozlabs.org@armlinux.org.uk>
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdv0d3SdGzDvx1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 22:06:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="by6QpZiE"; dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2014; 
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=GAQuTfm5JMXB0KjDoUKvUbtPGBxx/SmSAJFl6VqIpoc=; 
 b=by6QpZiEoq/cwO6fTACMe9q4itxR0IUwkTaevZOclpqC/SmN1zSQWKFgfiTzuO9igohIzkIN4HZlTQJHn0lUhk8ApeVbMI0N3071AlKAJ3rEyfSEwuQefw3T/USCIJfEZiuyijIiwlmgnYZAtRM6k2OJ8jrqOj/NHBQAq56+L4c=;
Received: from n2100.armlinux.org.uk
 ([2002:4e20:1eda:1:214:fdff:fe10:4f86]:37905)
 by pandora.armlinux.org.uk with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <linux@armlinux.org.uk>)
 id 1cH7OR-0004Yo-3h; Wed, 14 Dec 2016 11:06:39 +0000
Received: from linux by n2100.armlinux.org.uk with local (Exim 4.76)
 (envelope-from <linux@n2100.armlinux.org.uk>)
 id 1cH7ON-0005HI-Rw; Wed, 14 Dec 2016 11:06:35 +0000
Date: Wed, 14 Dec 2016 11:06:35 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org, joel@jms.id.au,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 linus.walleij@linaro.org
Subject: Re: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
Message-ID: <20161214110635.GB14217@n2100.armlinux.org.uk>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <1481702104-8617-5-git-send-email-jaghu@google.com>
 <3917905.e4iOqADnVQ@wuerfel> <10697525.O7CkPN6Gfl@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10697525.O7CkPN6Gfl@wuerfel>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
X-Mailman-Approved-At: Wed, 14 Dec 2016 22:17:28 +1100
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
X-List-Received-Date: Wed, 14 Dec 2016 11:06:59 -0000

On Wed, Dec 14, 2016 at 10:00:46AM +0100, Arnd Bergmann wrote:
> On Wednesday, December 14, 2016 9:55:47 AM CET Arnd Bergmann wrote:
> > According to your introductory mail, the interface is assumed to be
> > a 74HC164. Should we use that ID in the compatible string?
> > 
> > We can always add other strings later if we want to support multiple
> > wire formats.
> 
> Actually, looking up 74hc164, that seems to be a gpio expander,
> so maybe a more flexible way to do the same is to put a driver
> for the expander into drivers/gpio/ and have the main driver
> access the outputs of that using the gpiolib interface.

There already is - drivers/gpio/gpio-74x164.c

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.

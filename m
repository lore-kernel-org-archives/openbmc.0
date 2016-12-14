Return-Path: <arnd@arndb.de>
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdzCk07KkzDt1n
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 01:16:47 +1100 (AEDT)
Received: from wuerfel.localnet ([78.43.21.235]) by mrelayeu.kundenserver.de
 (mreue101 [212.227.15.145]) with ESMTPSA (Nemesis) id
 0M6DoA-1cXB5h0b5G-00y9cl; Wed, 14 Dec 2016 15:15:59 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, mark.rutland@arm.com,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
Date: Wed, 14 Dec 2016 15:15:53 +0100
Message-ID: <2512681.Wh85HyB8FH@wuerfel>
User-Agent: KMail/5.1.3 (Linux/4.4.0-34-generic; KDE/5.18.0; x86_64; ; )
In-Reply-To: <ac324946-41da-c090-a0ca-78155611bb7e@baylibre.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <20161214125641.GA5379@kroah.com>
 <ac324946-41da-c090-a0ca-78155611bb7e@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K0:f3M8h7QwrsqqJvfooac+GVyIvPOmLN/ePe31XjPmyx4Z1xFs7Y9
 cbAZcEY1xob3GIDhwWLcaY3G++NpbGuzWLg0D9lLkCw6kXpUqD5XEtXUwEh2r+uTNlzGrBI
 r1K1IE7uLeZ1K55ftcwZqO6TYc5NAiD/2Ou0IXFdXVyalN2yU9z/rLVF6d8KiuM46v8x1aA
 aDlK2iOndTsmi0bAwpE4A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:OpWiV1lKYck=:PJxXy/pnCW1j9ff+PC4E9q
 bsgBi2JDeXYJFb2VzylQiP+svc9ZPYcpkhzU7Cg5cAjd6otEAgobXQT6FDDXWV4t+JdP/1IHO
 zHTkncUj4gU4Ufnh2hymRZ2FZuszU4iq0SK3sEPkGNwTcDJln7PRCifqwiknNSzDv6sPVeGQW
 OZ6afbM2aH17qywvuThnExsi+ifkbqrVDrOlqOhd47ja110M6AYVnOh1XwwZ2hf2lddf+TznH
 bvssI9xL+Yhg5LCZcKUet9Mnq8XYuQdOo1X1gjN8x/w2zpbh96Mu0J6G+Ysa8cWm/SHPOKuGS
 UqBbKOyFerzSJ0KWkmfF3hluGJkZ+fsjJ/glaF4JE6uinDwav9MPmUoUovc4JRCUQvCtErnXC
 kYKjKeTQQ1nRblqheFW3/4mwIAFrpiwhcoWSgzqX0T3cf43XsZLXLwdAXKIGwmzLftxU0Cys0
 uhOFXAhyrt4YOQNiSpqJFqVWhgFzbCnsEzTZu5zdW/IH0ZCSLUhsfnO1DkTj8TBNqVB0BguJh
 2ULVZaduB2x6E81+WSu078MNP+PkkTClgPycB0dy/e4bwueu0r1TorW3tdMk1bj85MrgaYUiP
 6r2DJth4vcqqa6F5U61By4kMDLjJ6BnFXZQQiNOOIXHILMiKPARDk9ptRbsaLlPmfXgKovFk5
 fTlIR8wGln8SSs8MP01O6mJpIUsFPobQLwHZKRL3ojm8ejc2Fei8FSfFFGlwXCWZBi6HTxOaI
 h7PPMFqXRg1rahGP
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
X-List-Received-Date: Wed, 14 Dec 2016 14:16:51 -0000

On Wednesday, December 14, 2016 2:12:41 PM CET Neil Armstrong wrote:
> On 12/14/2016 01:56 PM, Greg KH wrote:
> > On Wed, Dec 14, 2016 at 01:45:30PM +0100, Thomas Petazzoni wrote:
> >> Hello,
> >>
> >> On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder
> >> Natarajan wrote:
> >>
> >>> Documentation for the binding which provides an interface for adding clock,
> >>> data and clear signal GPIO lines to control seven segment display.
> >>>
> >>> The platform device driver provides an API for displaying on two 7-segment
> >>> displays, and implements the required bit-banging. The hardware assumed is
> >>> 74HC164 wired to two 7-segment displays.
> >>>
> >>> The character device driver implements the user-space API for letting a user
> >>> write to two 7-segment displays including any conversion methods necessary
> >>> to map the user input to two 7-segment displays.
> >>>
> >>> Adding clock, data and clear signal GPIO lines in the devicetree to control
> >>> seven segment display on zaius platform.
> >>>
> >>> The platform driver matches on the device tree node; the platform driver also
> >>> initializes the character device.
> >>>
> >>> Tested that the seven segment display works properly by writing to the
> >>> character device file on a EVB AST2500 board which also has 74HC164 wired
> >>> to two 7-segment displays.
> >>
> >> FWIW, I proposed a driver for seven segment displays back in 2013:
> >>
> >>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139986.html
> >>
> >> And the feedback from Greg KH was: we don't need a driver for that, do
> >> it from userspace. See:
> >>
> >>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139992.html
> >>
> >> So: good luck 
> > 
> > Did anyone ever write a library for this type of thing?
> > 
> > Again, I don't want to see one-off drivers for random devices like this
> > that should be able to all be controlled from userspace in a common
> > manner.  Much like we did for fingerprint readers a long long time
> > ago...
> > 

> Actually, it's more than a random interface, a lot of SoCs and boards actually have such displays
> and it's a pity to use UIO, sysfs gpio bitbanging and all sort of ugly stuff to only print a few
> characters a simple and clean driver could achieve.
> Some very well known SoCs even have integrated registers to lower the BOM and bypass the need for
> a 74HC164 like component and avoid gpio bit banging.
> 
> My personal concern is that you could also need to drive more segments, thus 7-segments
> is too restrictive.
> 
> But this driver is well structured, the gpio-bitbanging sub-driver is welcome.

Maybe we can find a way to fit this into the existing drivers/leds/ subsystem?

That already supports blinking, brightness and colour attributes of LEDs,
so could this be extended to support (one of) digit, number, character
or string with a common sysfs attribute and a way to hook up a led driver
to that?

	Arnd

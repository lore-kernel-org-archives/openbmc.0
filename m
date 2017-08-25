Return-Path: <stuartl@longlandclan.id.au>
X-Greylist: delayed 348 seconds by postgrey-1.36 at bilbo;
 Fri, 25 Aug 2017 18:56:38 AEST
Received: from atomos.longlandclan.id.au (eth2015.qld.adsl.internode.on.net
 [150.101.176.226])
 by lists.ozlabs.org (Postfix) with ESMTP id 3xdw522gMKzDrVR
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 18:56:38 +1000 (AEST)
Received: from [IPv6:2001:44b8:21ac:7053:a64e:31ff:fe53:99cc] (unknown
 [IPv6:2001:44b8:21ac:7053:a64e:31ff:fe53:99cc])
 by atomos.longlandclan.id.au (Postfix) with ESMTPSA id 001792029657;
 Fri, 25 Aug 2017 18:50:28 +1000 (EST)
Subject: Re: [patch v6 0/3] JTAG driver introduction
To: Linus Walleij <linus.walleij@linaro.org>,
 Rick Altherr <raltherr@google.com>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
 <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
 <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, system-sw-low-level@mellanox.com,
 Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openocd-devel-owner@lists.sourceforge.net, mec@shout.net,
 Rob Herring <robh+dt@kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Tobias Klauser <tklauser@distanz.ch>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Stuart Longland <stuartl@longlandclan.id.au>
Openpgp: id=BCA11879F4F93BE3DB0DEE72F954BBBB7948D546;
 url=https://stuartl.longlandclan.id.au/key.asc
Message-ID: <593cd0d3-8e06-0992-c155-1322014c0477@longlandclan.id.au>
Date: Fri, 25 Aug 2017 18:50:23 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="14jdK5JVTNEEBgGWobCjMLbpSGuOqeIbc"
X-Mailman-Approved-At: Mon, 28 Aug 2017 13:40:15 +1000
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
X-List-Received-Date: Fri, 25 Aug 2017 08:56:38 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--14jdK5JVTNEEBgGWobCjMLbpSGuOqeIbc
Content-Type: multipart/mixed; boundary="G4ojsckFeEJJiAK0j3vAe59BPUDr6Q1GF"
From: Stuart Longland <stuartl@longlandclan.id.au>
To: Linus Walleij <linus.walleij@linaro.org>,
 Rick Altherr <raltherr@google.com>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, system-sw-low-level@mellanox.com,
 Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openocd-devel-owner@lists.sourceforge.net, mec@shout.net,
 Rob Herring <robh+dt@kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Tobias Klauser <tklauser@distanz.ch>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <593cd0d3-8e06-0992-c155-1322014c0477@longlandclan.id.au>
Subject: Re: [patch v6 0/3] JTAG driver introduction
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
 <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
 <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
In-Reply-To: <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>

--G4ojsckFeEJJiAK0j3vAe59BPUDr6Q1GF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[Note: dropping vadimp@maellanox.com as SMTP server complained about the
DNS server returning NXDOMAIN.  Apologies.]
On 25/08/17 18:32, Linus Walleij wrote:
> Gnah!
> Whoever writes a slot-in replacement making the character device
> take precendence wins lots of karma.

What would such a replacement look like though?

Some sort of system whereby you can read/write single-line commands as
if talking to a GPIO expander over a UART?

Would you access the GPIOs one by one, or would you perhaps map them
into a bitmap (maybe arbitrarily, up to 64-bits wide) and perform masked
operations on the bitmap?

I'm no fan of the sysfs GPIO interface, but it beats poking around at
registers behind the kernel's back.
--=20
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.


--G4ojsckFeEJJiAK0j3vAe59BPUDr6Q1GF--

--14jdK5JVTNEEBgGWobCjMLbpSGuOqeIbc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJZn+TPAAoJEPlUu7t5SNVG67kP/j8MgSUNySU8dWR/Xm22ACvo
kRwGWNLrKlMnWiPxGhZlRTTSrewT6jeuCQLueY2CPMmH0omtLJCNm6ZiG5B/xa9d
8lJ/+D9MmrPAsqdArCRXyiakZlNU20IvyFl8loN+DgRnVzpx1UOjVWGkcwnhei1D
/Qo3XF/wcR5gLHkCsC9j7NCN+hsOwwRPlM+NO9lQvYuRb/pAQ9JlWczrR5kC2NK+
Ln3Aqqesbv4tQ28S3pfR+AoQi/qKM2IHJXl4K4kM1C4wW6aajls2jZZ/8r6xWC9u
DIVXv6R7WpSUPxeHNlmn9TzJPTCFd1CV7tMkP9ACiS++rZurXQsS/Bu5EwKvbkrV
xnox6io+SQD0mn/nXpi7N/6NPUugeLIv47fsi2NKXs+nm97soL+6dliFOLDsR5G9
4JKRUQkhrq0o+0qWWnRdALrEj0FgGbaF5oJDWkDeEp89UIzbzPcVHXQElCcznDXZ
YNBwa+5V9XhXiPkilOgI/qQ0iAJaG9bM2HpALQaCrHRbvsD6/0IWHxjw4KRx2S7j
k43T1LkrvtIfQb1fFpZVPD19Noybgl7y1CMmi+5bZOHzUwaeUYe/pF4DETBhy6yh
sgvc9J/I/ChtfYm8TQeX7+RdrAdhebMrvP6uWDpbNrYEIyScpg9xgn9DcCSCi+sO
a8kIjjqlfdI797Zeclxm
=GgQT
-----END PGP SIGNATURE-----

--14jdK5JVTNEEBgGWobCjMLbpSGuOqeIbc--

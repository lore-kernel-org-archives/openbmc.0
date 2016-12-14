Return-Path: <arnd@arndb.de>
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdrLL4yJpzDvM9
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 20:07:06 +1100 (AEDT)
Received: from wuerfel.localnet ([78.43.21.235]) by mrelayeu.kundenserver.de
 (mreue104 [212.227.15.145]) with ESMTPSA (Nemesis) id
 0MK1VF-1cHuuV07nB-001Ox5; Wed, 14 Dec 2016 10:00:50 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, gregkh@linuxfoundation.org, joel@jms.id.au,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 linus.walleij@linaro.org
Subject: Re: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
Date: Wed, 14 Dec 2016 10:00:46 +0100
Message-ID: <10697525.O7CkPN6Gfl@wuerfel>
User-Agent: KMail/5.1.3 (Linux/4.4.0-34-generic; KDE/5.18.0; x86_64; ; )
In-Reply-To: <3917905.e4iOqADnVQ@wuerfel>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <1481702104-8617-5-git-send-email-jaghu@google.com>
 <3917905.e4iOqADnVQ@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K0:kxfd69o2y9bGcxwduQvQfj+N5KPttM4Hp9f9O/8DSAAkxl0c8FL
 MNSE66EgXm+ii4YQw9+dOH+zDyYZvqp94FRbC/U6KqaTO7EO72mO75XfE4+0IUfU98mq15A
 MxPPrqKfrdY/jGUFVSFHQ3o+mh5OXE1ceO8u5nGji1mjEisax2NZrHSol6USaKjsEMJT+go
 fQsP7yEYM29aZFx3BMiJw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:XRANpihvjeU=:fifd5uJ4liNU8yWupX4VIk
 hdPVNvn1A3siXyEQELx5dnG5JqGB4IPQX2xdyuqpdca43tNQMLqMFDFkeBqHf3j5lQPtV40rS
 kF0LJPgb9xYLttArDwFms74PxFqwknm4sJCZNS6pStIuk78+HRf31nf+qaV6mFD8QYVQGB06L
 Z4wAlYNWKSAU2V2zMJnodmjooZoz8pDM7laaz1xcaqQZsoJWh2qFR0dxnv2iNnJeS/d5DdKUp
 0E6K8b6BNTxPJrBYrUdIIe9ICPS12VZkH887VIFJKoZkoaBkmL/C9jqJuzaFX/1TJ/Mlbnj/c
 8S/uilkCA4rUO6Eo261MDCHi6qXL+raiyuiYVeqpU0bNk0/26aRK1VA8m4Lg931ND4ZXp1AOX
 xfGkoG4Fvan1xI0YvQtsmdkXq5H/sCOUIyoUfOgPGhh++41QvOzHPcENC1VZHbE+l+wJteKiX
 k4hWPfnBv87CTFvXddw+/QO4BVfpp5G/KRiR5vnebCuCNPwHZQt1L/BBzH3ZMWeoPELleoGpZ
 Dw7mY5w76MDcOPsShBDOCAPbRxXYXEWIg2vcwSjSN+xEO5bmHndE5ZrDjfmoclx3m/HXEfEEN
 H7bpP5qxoIHx54SZ3g3NY0yvpPzMeXsrHoP4y7scjcsVG1cz6Gg71jy5W+mrCYEIgZ9vSEAeK
 8fx4E3jiU7o9xzUMkzls4SsrCRfsC7rR3PMIBzkVLE5J6khv8uCdmnAxb4mxzSgr0hFSiSDnM
 AlHS5+AJFtSaHaXy
X-Mailman-Approved-At: Wed, 14 Dec 2016 20:12:00 +1100
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
X-List-Received-Date: Wed, 14 Dec 2016 09:07:07 -0000

On Wednesday, December 14, 2016 9:55:47 AM CET Arnd Bergmann wrote:
> According to your introductory mail, the interface is assumed to be
> a 74HC164. Should we use that ID in the compatible string?
> 
> We can always add other strings later if we want to support multiple
> wire formats.

Actually, looking up 74hc164, that seems to be a gpio expander,
so maybe a more flexible way to do the same is to put a driver
for the expander into drivers/gpio/ and have the main driver
access the outputs of that using the gpiolib interface.

	Arnd

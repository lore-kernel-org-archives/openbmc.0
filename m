Return-Path: <awilliams@marvell.com>
Authentication-Results: lists.ozlabs.org;
 spf=fail (mailfrom) smtp.mailfrom=marvell.com
 (client-ip=173.8.172.90; helo=roger.doofus.org;
 envelope-from=awilliams@marvell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=marvell.com
Received: from roger.doofus.org (unknown [173.8.172.90])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lctX5jFLzDqHw
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 20:53:55 +1100 (AEDT)
Received: from flash.localnet (unknown [192.168.0.16])
 by roger.doofus.org (Postfix) with ESMTPSA id BA296846C55C;
 Thu, 24 Jan 2019 01:53:53 -0800 (PST)
From: Aaron Williams <awilliams@marvell.com>
To: openbmc@lists.ozlabs.org
Cc: Vijay Khemka <vijaykhemka@fb.com>,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: Re: [EXT] Re: New motherboard to port OpenBMC to
Date: Thu, 24 Jan 2019 01:53:53 -0800
Message-ID: <3329865.kWqfkPkNCf@flash>
In-Reply-To: <9F5DFCC3-67E6-48D8-B189-D3A4A7569451@fb.com>
References: <3817431548258966@sas1-fc7737ec834f.qloud-c.yandex.net>
 <9F5DFCC3-67E6-48D8-B189-D3A4A7569451@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2019 09:53:57 -0000

I look forward to seeing this since that's what I'm currently trying to fig=
ure=20
out with our own board.

=2DAaron

On Wednesday, January 23, 2019 9:56:43 AM PST Vijay Khemka wrote:
> External Email
>=20
> ----------------------------------------------------------------------
> Hi Konstantin,
> I am working on howto for sensors, temp etc. I will post it here in couple
> of days.
=20
> Regards
> -Vijay
>=20
> =EF=BB=BFOn 1/23/19, 8:02 AM, "openbmc on behalf of Konstantin Klubnichki=
n"
> <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of
> kitsok@yandex-team.ru> wrote:
=20
>     Hi all!=20
>    =20
>     I have the custom-made motherboards for Grantley CPU with Avocent-bas=
ed
> BMC, and my goal is to switch to OpenBMC.=20
=20
>     I've read HOWTOs in the OpenBMC documentation, but usually the
> documentation is usually a bit behind the development, so are there any
> newer howtos or guides?
=20
>     Now I took Quanta MB as a reference and going to at least boot up the
> system and get the network. But it's pretty unclear for me how to add
> sensors, how to get CPUs temperatures, etc
=20
>     Could you please advise what to read to get into details?
>    =20
>     Thanks!
>     --=20
>     Best regards,
>     Konstantin Klubnichkin,
>     lead firmware engineer,
>     server hardware R&D group,
>     Yandex Moscow office.
>     tel: +7-903-510-33-33
>    =20
>    =20
>=20

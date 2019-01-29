Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pVrJ3GgqzDqJc
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 13:31:59 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 28 Jan 2019 21:32:28 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Aspeed XDMA Engine Driver Interfaces (PCI communications with
 host)
Message-ID: <20190129023228.7yerubd62lza72a7@thinkpad>
References: <c3ab751d-d3a8-8491-3353-92ad91e73966@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c3ab751d-d3a8-8491-3353-92ad91e73966@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 29 Jan 2019 02:32:01 -0000

On Mon, Jan 28, 2019 at 03:50:57PM -0600, Eddie James wrote:
> Hi,
>=20
> I'm working on a driver for the XDMA engine to enable DMA operations be=
tween
> the host and the BMC. I thought I'd get up a proposal for the interface=
s to
> get some feedback.
>=20
> Driver provides one or two simple read/write file handles under /dev/,
> depending on whether or not we're restricted to using the VGA memory on=
ly.
>=20
> /dev/xdma:
>=20
> =A0=A0=A0 seek: user sets the host DMA address
>=20
> =A0=A0=A0 write: user provides the BMC address and specifies the operat=
ion type
> ("upstream", meaning from the BMC to the host, or "downstream", meaning=
 from
> the host to the BMC). If we're using only VGA memory, the BMC address c=
an be
> skipped, as it will always be from/to the VGA space.
>=20
> =A0=A0=A0 read: the syscall blocks or returns EAGAIN until the operatio=
n is
> complete
>=20
> If we only use VGA memory, we need another device to interact with that
> memory space easily, as well as prevent multiple users overwriting each
> others data. VGA memory space is configurable by HW strap on the Aspeed
> between 8 and 64MB, but is 16MB by default.
>=20
> /dev/xdma-buffer:
>=20
> =A0=A0=A0 open/close: lock access to the memory
>=20
> =A0=A0=A0 read/write: read or write the VGA memory
>=20
> Locking access in this way is quite a limitation, but I'm not sure how =
else
> to guarantee user's data is OK...
>=20
> Suggestions are very welcome, on all aspects of the design.
>=20
> Thanks,
>=20
> Eddie

Hi Eddie

There is a linux-aspeed list:

https://lists.ozlabs.org/pipermail/linux-aspeed/

It might make sense to copy that list too.

-brad

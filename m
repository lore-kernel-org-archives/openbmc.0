Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBDjg369NzDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 15:02:30 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.7 0/3] drivers: fsi: sbefifo: Add in-kernel API
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1492549634-27369-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Mon, 24 Apr 2017 01:02:25 -0400
Cc: openbmc@lists.ozlabs.org,
 "Edward A. James" <eajames@us.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C42B9317-AA8A-4A88-80A4-EB6AC601039E@fuzziesquirrel.com>
References: <1492549634-27369-1-git-send-email-eajames@linux.vnet.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 05:02:31 -0000

Thanks for the patch Eddie.


> On Apr 18, 2017, at 5:07 PM, Eddie James <eajames@linux.vnet.ibm.com> =
wrote:
>=20
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> This patchset provides an in-kernel API for the SBEFIFO driver and the =
first
> user, a driver to access the P9 OCC hardware. There are also some =
potential
> devicetree bindings for the SBEFIFO and OCC devices.
>=20
> The OCC provides a read/write interface, but only performs a single, =
atomic,
> OCC "command and response" operation per write operation. The driver =
cannot
> perform multiple writes in a row without first reading back to the =
user the
> response generated for each command. I can't see a use case for doing =
multiple
> commands without fetching the response.
>=20
> Any feedback, particularly on how to improve the dt bindings or how to
> inform the OCC client that the SBEFIFO device has gone away (via =
unbinding
> FSI, or other means), would be helpful.
>=20
> Edward A. James (3):

Since un-merged patches are needed for this to apply I think the normal =
thing
to do would have been for you and I to co-ordinate and one of us sent =
the
entire patchset (sbefifo + these three patches).

Lets do that when we re-submit for 4.10.

Anyone else, please don=E2=80=99t let this discourage you from providing =
cursory thoughts
especially on the DT bindings.

>  drivers: fsi: sbefifo: Add in-kernel API
>  drivers: fsi: sbefifo: Add OCC driver
>  ARM: dts: aspeed: witherspoon: Add example sbefifo and occfifo =
devices
>=20
> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  16 +
> drivers/fsi/Kconfig                              |  10 +
> drivers/fsi/Makefile                             |   1 +
> drivers/fsi/fsi-sbefifo.c                        | 173 +++++-
> drivers/fsi/occfifo.c                            | 649 =
+++++++++++++++++++++++
> include/linux/fsi-sbefifo.h                      |  41 ++
> 6 files changed, 861 insertions(+), 29 deletions(-)
> create mode 100644 drivers/fsi/occfifo.c
> create mode 100644 include/linux/fsi-sbefifo.h
>=20
> --=20
> 1.8.3.1

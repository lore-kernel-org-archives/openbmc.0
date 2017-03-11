Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vg76t5m7MzDqXf
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 13:16:54 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [RFC linux dev-4.7 0/4] drivers: i2c: FSI-attached I2C master
 algorithm
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Fri, 10 Mar 2017 21:16:49 -0500
Cc: openbmc@lists.ozlabs.org, "Edward A. James" <eajames@us.ibm.com>,
 cbostic@linux.vnet.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <57A4FEEE-E09F-443A-B7AB-226457C39D25@fuzziesquirrel.com>
References: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Sat, 11 Mar 2017 02:16:55 -0000


> On Mar 10, 2017, at 4:48 PM, Eddie James <eajames@linux.vnet.ibm.com> =
wrote:
>=20
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> This patch series adds an I2C bus algorithm to drive the I2C master =
located on
> POWER CPUs. The master is accessed over FSI bus from the service =
processor.
>=20
> The driver is functional for some basic read/write ops. There are a =
couple of
> details regarding the device tree and chardev entries that need =
working out.
>=20
> Mainly, do we want a char device for each port?  There are 15 ports =
off one P9
> master, so that'll be a lot of /dev/i2c-<x> entries.

IMHO I don=E2=80=99t see this being a problem.

> One issue is that
> i2c_add_adapter always names it's device i2c-%d, regardless of adapter =
name.

One can always add udev rules to get alternate naming schemes.

> Furthermore, you can specify the number to label it with
> i2c_add_numbered_adapter, but how to prevent collisions with regular =
i2c
> devices?

I think this is also probably solvable with udev.

>=20
> The driver will currently set up one chardev for each master (each =
proc).
> The port is then specified by hacking the addr field of i2c_msg. It =
works,
> but not a clean solution.

I=E2=80=99d say we just go with one chardev per port, unless others have =
experience
that recommends otherwise.

>=20
> FSI clocking details are not defined in the device tree, so FSI clock =
is
> hardcoded for now.
>=20
> Edward A. James (4):
>  drivers: fsi: Add function to get FSI clock rate
>  drivers: i2c: Add FSI-attached I2C master algorithm
>  drivers: i2c: Add transfer implementation for FSI algorithm
>  drivers: i2c: Add bus recovery for FSI algorithm
>=20
> drivers/Makefile             |   2 +-
> drivers/fsi/fsi-core.c       |   7 +
> drivers/i2c/busses/Kconfig   |  11 +
> drivers/i2c/busses/Makefile  |   1 +
> drivers/i2c/busses/i2c-fsi.c | 608 =
+++++++++++++++++++++++++++++++++++++++++++
> include/linux/fsi.h          |   1 +
> 6 files changed, 629 insertions(+), 1 deletion(-)
> create mode 100644 drivers/i2c/busses/i2c-fsi.c
>=20
> --=20
> 1.8.3.1

Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkmnn3Bn9zDqZW
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 11:44:45 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [RFC linux dev-4.7 0/4] drivers: i2c: FSI-attached I2C master
 algorithm
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <c3ddbdde-02ba-425d-a75a-bec7dce2b714@linux.vnet.ibm.com>
Date: Thu, 16 Mar 2017 20:44:41 -0400
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <718E3927-8949-417C-8055-2B192958D49C@fuzziesquirrel.com>
References: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
 <57A4FEEE-E09F-443A-B7AB-226457C39D25@fuzziesquirrel.com>
 <c3ddbdde-02ba-425d-a75a-bec7dce2b714@linux.vnet.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 17 Mar 2017 00:44:45 -0000

[snip]

>>=20
>>> The driver will currently set up one chardev for each master (each =
proc).
>>> The port is then specified by hacking the addr field of i2c_msg. It =
works,
>>> but not a clean solution.
>> I=E2=80=99d say we just go with one chardev per port, unless others =
have experience
>> that recommends otherwise.
>=20
> Thought of a potential issue with this approach. This will require =
some custom bus locking solution, as we need to prevent multiple =
transfers from setting the master regs at the same time.

Does each port have its own reg(s) or do bits n-m in reg x correlate to =
ports n-m?

> Obviously the kernel i2c driver handles locking on each chardev to =
prevent simultaneous access, but since we will have multiple chardevs =
that have to lock each other out, we need to do it ourselves.
>=20
> I think having our own locking is pretty do-able, I just wonder if the =
kernel guys will not be happy with it?
>=20
> Eddie
>>=20
>>> FSI clocking details are not defined in the device tree, so FSI =
clock is
>>> hardcoded for now.
>>>=20
>>> Edward A. James (4):
>>>  drivers: fsi: Add function to get FSI clock rate
>>>  drivers: i2c: Add FSI-attached I2C master algorithm
>>>  drivers: i2c: Add transfer implementation for FSI algorithm
>>>  drivers: i2c: Add bus recovery for FSI algorithm
>>>=20
>>> drivers/Makefile             |   2 +-
>>> drivers/fsi/fsi-core.c       |   7 +
>>> drivers/i2c/busses/Kconfig   |  11 +
>>> drivers/i2c/busses/Makefile  |   1 +
>>> drivers/i2c/busses/i2c-fsi.c | 608 =
+++++++++++++++++++++++++++++++++++++++++++
>>> include/linux/fsi.h          |   1 +
>>> 6 files changed, 629 insertions(+), 1 deletion(-)
>>> create mode 100644 drivers/i2c/busses/i2c-fsi.c
>>>=20
>>> --=20
>>> 1.8.3.1

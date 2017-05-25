Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYBPZ2LXZzDqdl
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 11:24:17 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10 v2] arm: dts: aspeed: Add IR35221 instances
 to dev tree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8XeZN5ALj3ry-G8QkOneCLWT=_6yBF4NuMP1h+MEO8NPmQ@mail.gmail.com>
Date: Wed, 24 May 2017 21:24:14 -0400
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <86554E4C-0D25-4446-B59B-3FCB84638ACD@fuzziesquirrel.com>
References: <20170519173412.68053-1-cbostic@linux.vnet.ibm.com>
 <20170519173412.68053-2-cbostic@linux.vnet.ibm.com>
 <CACPK8Xdq2J0XE9bkezBDOTQ=xCUGdYo=TLdjyOkwpp=3JFATgg@mail.gmail.com>
 <CACPK8Xe_5V_c30A+h_5+ZVbZ2YEcfSbF5od-qfQgp+aGggFmJg@mail.gmail.com>
 <8ED27577-DDFA-49E1-ADFC-EAC12A98D655@fuzziesquirrel.com>
 <CACPK8XeZN5ALj3ry-G8QkOneCLWT=_6yBF4NuMP1h+MEO8NPmQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Thu, 25 May 2017 01:24:18 -0000


> On May 24, 2017, at 9:16 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Thu, May 25, 2017 at 4:32 AM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>>=20
>>> On May 24, 2017, at 2:20 AM, Joel Stanley <joel@jms.id.au> wrote:
>>>=20
>>> On Wed, May 24, 2017 at 10:58 AM, Joel Stanley <joel@jms.id.au> =
wrote:
>>>> On Sat, May 20, 2017 at 3:34 AM, Christopher Bostic
>>>> <cbostic@linux.vnet.ibm.com> wrote:
>>>>> Add IR35221 to i2c4 and i2c5 buses.
>>>>=20
>>>> This is similar to the patch that I sent on the 2nd.
>>>>=20
>>>> I took your patch as it adds the device at 0x71 which I did not =
know about.
>>>>=20
>>>=20
>>> This breaks userspace, as userspace assumes it can access the i2c
>>> devices through /dev/i2c-x.
>>>=20
>>=20
>> Joel, or anyone able to answer=E2=80=A6
>>=20
>> Do you know which application?  I wasn=E2=80=99t aware of any =
applications using i2c-dev...
>=20
> The one I noticed was vrm-control.sh.
>=20
>> Can we simply remove i2c-dev from the config?
>=20
> We could, but that would break other bits of the p9 userspace.
>=20
> Taking a look a the root filesystem, we have the following
> applications that use the /dev/i2c interfaces:
>=20
> $ grep -rl i2cset *
> usr/sbin/i2cset
> usr/bin/avsbus-disable.sh
> usr/bin/avsbus-workaround.sh
> usr/bin/avsbus-enable.sh
> usr/bin/vrm-control.sh
> usr/bin/vcs_on.sh
> usr/bin/ucd_disable_vcs.sh
> usr/bin/vcs_off.sh
>=20

Thanks Joel.  I had forgotten about these.

I=E2=80=99m not sure how to handle this.  We obviously still need to run =
these workarounds,
but we also need the regulator temperatures.

The only thing I can think of is exposing what these scripts need via =
sysfs attributes.

Is there any alternative?

> grep -rl i2cget *
> usr/sbin/i2cget
> usr/bin/vrm-control.sh
>=20
> Cheers,
>=20
> Joel

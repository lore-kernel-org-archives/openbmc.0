Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wY1GS22PzzDqdL
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 04:32:31 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10 v2] arm: dts: aspeed: Add IR35221 instances
 to dev tree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8Xe_5V_c30A+h_5+ZVbZ2YEcfSbF5od-qfQgp+aGggFmJg@mail.gmail.com>
Date: Wed, 24 May 2017 14:32:27 -0400
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8ED27577-DDFA-49E1-ADFC-EAC12A98D655@fuzziesquirrel.com>
References: <20170519173412.68053-1-cbostic@linux.vnet.ibm.com>
 <20170519173412.68053-2-cbostic@linux.vnet.ibm.com>
 <CACPK8Xdq2J0XE9bkezBDOTQ=xCUGdYo=TLdjyOkwpp=3JFATgg@mail.gmail.com>
 <CACPK8Xe_5V_c30A+h_5+ZVbZ2YEcfSbF5od-qfQgp+aGggFmJg@mail.gmail.com>
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
X-List-Received-Date: Wed, 24 May 2017 18:32:32 -0000


> On May 24, 2017, at 2:20 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Wed, May 24, 2017 at 10:58 AM, Joel Stanley <joel@jms.id.au> wrote:
>> On Sat, May 20, 2017 at 3:34 AM, Christopher Bostic
>> <cbostic@linux.vnet.ibm.com> wrote:
>>> Add IR35221 to i2c4 and i2c5 buses.
>>=20
>> This is similar to the patch that I sent on the 2nd.
>>=20
>> I took your patch as it adds the device at 0x71 which I did not know =
about.
>>=20
>=20
> This breaks userspace, as userspace assumes it can access the i2c
> devices through /dev/i2c-x.
>=20

Joel, or anyone able to answer=E2=80=A6

Do you know which application?  I wasn=E2=80=99t aware of any =
applications using i2c-dev...

Can we simply remove i2c-dev from the config?

thx - brad

> Do you have a ticket opened for fixing userspace?
>=20
> Cheers,
>=20
> Joel

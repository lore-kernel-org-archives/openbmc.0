Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vFN4D1h8VzDqBY
 for <openbmc@lists.ozlabs.org>; Sat,  4 Feb 2017 03:44:08 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [PATCH linux] dts: aspeed: merge initrd into kernel in flash
 layout
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CALLMt=pHyZhj8W7i7qWgM6ppf0a+4aUp8+zxfx8QFSuZ_xNpnQ@mail.gmail.com>
Date: Fri, 3 Feb 2017 11:44:04 -0500
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <490CE008-B094-4008-83A7-7CD13F3F6C26@fuzziesquirrel.com>
References: <20170131183927.30887-1-raltherr@google.com>
 <CACPK8Xf7qFw-LgnwTyJH3fMme5w_c99JuJ1LVA74VmFGkBMDPg@mail.gmail.com>
 <CALLMt=pHyZhj8W7i7qWgM6ppf0a+4aUp8+zxfx8QFSuZ_xNpnQ@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Fri, 03 Feb 2017 16:44:12 -0000

I=E2=80=99m not suggesting one way or the other as far as how to proceed =
but I don=E2=80=99t
think pulling chips is ever necessary.  You can always netboot and flash =
the
entire image image that way.

> On Feb 3, 2017, at 11:36 AM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
> On Thu, Feb 2, 2017 at 6:51 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Wed, Feb 1, 2017 at 5:09 AM, Rick Altherr via openbmc
>> <openbmc@lists.ozlabs.org> wrote:
>>> openbmc/openbmc commit 1ed6fe335cda50cf60b7afddbe530077a1b25d27 =
includes
>>> the initrd in the kernel image.  Update the flash layout used by =
OpenBMC
>>> dts accordingly.  This is required for OpenBMC's kernel update =
mechanism
>>> to work as the kernel image now exceeds the size of the original =
kernel
>>> partition.
>>=20
>> Brad, Patrick: This change will mean new kernels can't boot on old
>> flash layouts, and vice versa.
>>=20
>> All users will need to do a full-flash update to move to this =
version,
>> and a full flash update to downgrade.
>>=20
>> Are we ok to proceed?
>=20
> Ack, we just went through this with the last update and all hit
> https://github.com/openbmc/openbmc/issues/1030.  It was pretty
> disruptive for all of us in the lab needing to pull the chips and
> manually flash each.  This is would be fine if we can just flash the
> <system>.all.tar and all works ok, but that was not what we found in
> https://github.com/openbmc/openbmc/issues/1030.
>=20
>> Cheers,
>>=20
>> Joel
>>=20
>>>=20
>>> Signed-off-by: Rick Altherr <raltherr@google.com>
>>> ---
>>> arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 6 +-----
>>> 1 file changed, 1 insertion(+), 5 deletions(-)
>>>=20
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi =
b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>>> index 65095a40a203..4bcfd1bf8dc5 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>>> @@ -12,13 +12,9 @@
>>>                                        label =3D "u-boot-env";
>>>                                };
>>>                                kernel@80000 {
>>> -                                       reg =3D < 0x80000 0x280000 =
>;
>>> +                                       reg =3D < 0x80000 0x440000 =
>;
>>>                                        label =3D "kernel";
>>>                                };
>>> -                               initramfs@300000 {
>>> -                                       reg =3D < 0x300000 0x1c0000 =
>;
>>> -                                       label =3D "initramfs";
>>> -                               };
>>>                                rofs@0c0000 {
>>>                                        reg =3D < 0x4c0000 0x1740000 =
>;
>>>                                        label =3D "rofs";
>>> --
>>> 2.11.0.483.g087da7b7c-goog
>>>=20
>>> _______________________________________________
>>> openbmc mailing list
>>> openbmc@lists.ozlabs.org
>>> https://lists.ozlabs.org/listinfo/openbmc
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

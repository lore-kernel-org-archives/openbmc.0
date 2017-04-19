Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w783B0CTfzDq8M
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 14:21:57 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.7 v2 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1492123983.2866362.944182344.6EE25D8F@webmail.messagingengine.com>
Date: Wed, 19 Apr 2017 00:21:54 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <85CCBDBD-46CB-4D4E-AB3E-2A12A8011871@fuzziesquirrel.com>
References: <1491961541-10864-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492112248-28396-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492112248-28396-3-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492123983.2866362.944182344.6EE25D8F@webmail.messagingengine.com>
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Wed, 19 Apr 2017 04:21:58 -0000

Andrew

Thanks for looking.

> On Apr 13, 2017, at 6:53 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> Hi Brad,
>=20
> On Fri, Apr 14, 2017, at 05:07, Brad Bishop wrote:
>> Enable gpio-keys events for the checkstop and water/air cooled
>> gpios for use by applications on the Witherspoon system.
>>=20
>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> ---
>> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 16 =
++++++++++++++++
>> 1 file changed, 16 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index e3a7b77..4a68b30 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -31,6 +31,22 @@
>> 		};
>> 	};
>>=20
>> +       gpio-keys {
>> +               compatible =3D "gpio-keys";
>> +
>> +               air-water {
>> +                       label =3D "air-water";
>> +                       gpios =3D <&gpio ASPEED_GPIO(B, 5)
>> GPIO_ACTIVE_LOW>;
>> +                       linux,code =3D <&gpio ASPEED_GPIO(B, 5)
>> GPIO_ACTIVE_LOW>;
>=20
> This doesn't look right to me. linux,code doesn't appear to be =
anything
> more than a single value cell in the documentation:=20
>=20
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/devicetree/bindings/input/gpio-keys.txt?id=3Drefs/tags/v4.11-r=
c6
>=20
> I expect you just want the macro,  and not phandle or gpio flags. I =
was
> expecting to see:
>=20
> linux,code =3D <ASPEED_GPIO(B, 5)>;

Agreed and fixed.

>=20
> Is there a reason you've done it this way? Have you checked reading
> values from userspace gives the expected value?

No and No.  Busted.  I fully exercised v3 on a Palmetto ( I can=E2=80=99t =
easily control the state of these specific Witherspoon gpios ).

>=20
> Andrew
>=20
>> +               };
>> +
>> +               checkstop {
>> +                       label =3D "checkstop";
>> +                       gpios =3D <&gpio ASPEED_GPIO(J, 2)
>> GPIO_ACTIVE_LOW>;
>> +                       linux,code =3D <&gpio ASPEED_GPIO(J, 2)
>> GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> +
>> 	leds {
>> 		compatible =3D "gpio-leds";
>>=20
>> --=20
>> 1.8.3.1

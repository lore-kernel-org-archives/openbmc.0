Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w7Pl94WKrzDqFk
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 00:39:01 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.7 v3 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1492612195.1011.4.camel@aj.id.au>
Date: Wed, 19 Apr 2017 10:38:56 -0400
Cc: openbmc@lists.ozlabs.org,
 joel@jms.id.au
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2CEC6F0-6FAD-41DB-9797-E6D63868FA6F@fuzziesquirrel.com>
References: <1492575497-1419-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492575497-1419-3-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492612195.1011.4.camel@aj.id.au>
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
X-List-Received-Date: Wed, 19 Apr 2017 14:39:01 -0000


> On Apr 19, 2017, at 10:29 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> Hi Brad,
>=20
> If you do future revisions of these patches, can you please Cc me?

will do.

>=20
> On Wed, 2017-04-19 at 00:18 -0400, Brad Bishop wrote:
>> Enable gpio-keys events for the checkstop and water/air cooled
>> gpios for use by applications on the Witherspoon system.
>>=20
>>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 20 =
++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts =
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index e3a7b77..aa1708e 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -31,6 +31,26 @@
>>>  		};
>>>  	};
>> =20
>> +	gpio-keys@0 {
>=20
> does the @0 give us a stable device name for userspace to open?

No it doesn=E2=80=99t.  This is my lack of DT skillz showing.  I was =
looking
into how we can give userspace a stable device name.  I was going
down the udev path but I can=E2=80=99t find any any of the information =
from
these DT nodes in the udev event.

>=20
> Do we really want to go this way? We now have useful unique codes for
> the "key"s, why not use the one node? Or is your concern we've now =
tied

Each gpio will have an application waiting for its state to change.  My
concern was waking up x number of applications every time any gpio =
changes
state.  Is that a valid concern?

> the function to a value that might vary across platforms? If so, are

No, not worried about this.  Applications will be getting their gpio =
number
on the command line anyway.

> you relying on always specifying "air-water" in @0? If you are, I =
think
> I'd prefer the arbitrary codes, rather than this.
>=20
> Andrew
>=20
>> +		compatible =3D "gpio-keys";
>> +
>>> +		air-water {
>>> +			label =3D "air-water";
>>> +			gpios =3D <&gpio ASPEED_GPIO(B, 5) =
GPIO_ACTIVE_LOW>;
>>> +			linux,code =3D <ASPEED_GPIO(B, 5)>;
>>> +		};
>>> +	};
>> +
>>> +	gpio-keys@1 {
>>> +		compatible =3D "gpio-keys";
>> +
>>> +		checkstop {
>>> +			label =3D "checkstop";
>>> +			gpios =3D <&gpio ASPEED_GPIO(J, 2) =
GPIO_ACTIVE_LOW>;
>>> +			linux,code =3D <ASPEED_GPIO(J, 2)>;
>>> +		};
>>> +	};
>> +
>>>  	leds {
>>>  		compatible =3D "gpio-leds";

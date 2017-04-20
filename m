Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w81MW55zBzDqLG
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 00:24:07 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.7 v3 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1492662892.1011.7.camel@aj.id.au>
Date: Thu, 20 Apr 2017 10:24:02 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <86B3586F-7CEC-4389-8CCC-38D5423A4CE7@fuzziesquirrel.com>
References: <1492575497-1419-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492575497-1419-3-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492612195.1011.4.camel@aj.id.au>
 <F2CEC6F0-6FAD-41DB-9797-E6D63868FA6F@fuzziesquirrel.com>
 <1492662892.1011.7.camel@aj.id.au>
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
X-List-Received-Date: Thu, 20 Apr 2017 14:24:08 -0000


> On Apr 20, 2017, at 12:34 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> On Wed, 2017-04-19 at 10:38 -0400, Brad Bishop wrote:
>>>>> On Apr 19, 2017, at 10:29 AM, Andrew Jeffery <andrew@aj.id.au> =
wrote:
>>>=20
>>> Hi Brad,
>>>=20
>>> If you do future revisions of these patches, can you please Cc me?
>>=20
>> will do.
>>=20
>>>=20
>>> On Wed, 2017-04-19 at 00:18 -0400, Brad Bishop wrote:
>>>> Enable gpio-keys events for the checkstop and water/air cooled
>>>> gpios for use by applications on the Witherspoon system.
>>>>=20
>>>>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>>>>=20
>>>> ---
>>>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 20 =
++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>=20
>>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts =
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>>> index e3a7b77..aa1708e 100644
>>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>>> @@ -31,6 +31,26 @@
>>>>>>>>>  		};
>>>>>  	};
>>>>=20
>>>> =20
>>>> +	gpio-keys@0 {
>>>=20
>>> does the @0 give us a stable device name for userspace to open?
>>=20
>> No it doesn=E2=80=99t.  This is my lack of DT skillz showing.  I was =
looking
>> into how we can give userspace a stable device name.  I was going
>> down the udev path but I can=E2=80=99t find any any of the =
information from
>> these DT nodes in the udev event.
>>=20
>>>=20
>>> Do we really want to go this way? We now have useful unique codes =
for
>>> the "key"s, why not use the one node? Or is your concern we've now =
tied
>>=20
>> Each gpio will have an application waiting for its state to change.  =
My
>> concern was waking up x number of applications every time any gpio =
changes
>> state.  Is that a valid concern?
>=20
> How many applications do we expect to be reading the evdev? What are
> our expected interrupt rates? What are the worst expected cases?

For Witherspoon/Zaius or any OpenBMC platform?  I obviously can=E2=80=99t =
say for the
latter case.  On a bigger/enterprise systems I can see on the order of =
10 to 100
applications looking at these.  I don=E2=80=99t have a good sense of how =
often.

On Witherspoon/Zaius, sure, we only have a handful of applications and =
the
interrupt rate should be very infrequent.

I think you typically see all the gpio keys mapped to a single device =
because
the usual thing to do is have a single application (Xorg) treat it like =
a keyboard.

We aren=E2=80=99t structured that way so rethinking the usual approach =
seems reasonable. =20
Another reason I went for per gpio devices because it prevents =
applications from
reacting to each others events without any special library code. =20

I=E2=80=99m not saying there aren=E2=80=99t disadvantages to this =
approach - I just don=E2=80=99t know what
they are?

>=20
> It's hard to judge without knowing the numbers, but considering the
> chips we run on I agree we should generally favour performance if
> design is getting in the way. But to make that trade off we should be

Again, what exactly is being traded-off ?

> clear on the performance numbers.
>=20
> Andrew

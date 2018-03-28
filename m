Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40B8993KWyzF2LV
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 00:38:36 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C02BF14E0A;
 Wed, 28 Mar 2018 09:38:32 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Implement IPMI POH functionality
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <879fa484-b805-c398-3a99-7ecc07db170c@yadro.com>
Date: Wed, 28 Mar 2018 09:38:32 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <19186981-00B2-4BA6-AB80-890F374A2D97@fuzziesquirrel.com>
References: <24f546e1-4766-e6f0-df54-eaa399ae7189@linux.vnet.ibm.com>
 <CAJoAoZnuJvrOSh7dxN7rx0o-y0_KG8w4Y4+wBwyWXKAVsxg=Dg@mail.gmail.com>
 <879fa484-b805-c398-3a99-7ecc07db170c@yadro.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2018 13:38:38 -0000


> On Mar 28, 2018, at 8:56 AM, Alexander Amelkin <a.amelkin@yadro.com> =
wrote:
>> On Mon, Mar 26, 2018 at 5:00 AM Ratan Gupta =
<ratagupt@linux.vnet.ibm.com> wrote:
>>=20
>>     2) Don't update this property for the chassis power off duration =
and
>> update
>>     this property when the chassis state changes to PowerOn.
> I believe, we must follow the IPMI specification, which clearly states =
in section 1.7.28 that the POH counter is:
>=20
> "to return a counter value proportional to the system operating (S0) =
power-on hours"
>=20
> It looks quite clear to me that this is similar to a car mileage =
meter. That is, a means to identify when it's time to do some servicing =
and/or track warranty.

Agreed.  So option #2 then Alexander?

> =E2=80=98Clear=E2=80=99 or =E2=80=98Set=E2=80=99 commands are not =
specified for this counter. This is because the counter is most =
typically used for
> warranty tracking or replacement purposes where changing or clearing =
the counter would defeat the purpose.

So I take this as you don=E2=80=99t feel a factory reset should
reset the counter, at least, certainly not by default.  Agreed?=

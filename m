Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCc362J72zDr4T
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 03:37:54 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 3AC2097595;
 Thu, 12 Oct 2017 12:37:51 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAPH-5w7Kyv_GeZt=DHoYSPKJp5AjoJCUFkAwYEgVo7XpacGTUw@mail.gmail.com>
Date: Thu, 12 Oct 2017 12:37:51 -0400
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Development <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB5054A8-5A1E-4EF9-8312-77FE43C67570@fuzziesquirrel.com>
References: <20171011220548.GA61269@mauery>
 <1173E291-E8F5-4828-82CA-7B8BAC249B53@fuzziesquirrel.com>
 <CAPH-5w7Kyv_GeZt=DHoYSPKJp5AjoJCUFkAwYEgVo7XpacGTUw@mail.gmail.com>
To: Xo Wang <xow@google.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2017 16:37:54 -0000


> On Oct 12, 2017, at 12:25 PM, Xo Wang <xow@google.com> wrote:
>=20
> On Thu, Oct 12, 2017 at 9:03 AM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>>=20
>>> On Oct 11, 2017, at 6:05 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>>>=20
>>> I am working on an ipmi provider library and had a few questions and
>>> observations.
>>>=20
>>> 1) Why are there separate ipmi message queues for the host and =
network?
>>=20
>> iirc it was so that you could have a different set of providers
>> registered for each channel or even different, channel specific
>> implementations for the same command.
>>=20
>=20
> The reasoning here also derives from the "build the distro as you like
> it" approach. If you don't want a network interface to the BMC, then
> you can simply not build it or its handlers.
>=20
> Of course we could write a single queue service for both host and
> network that can be configured and built to support only one, but that
> puts the onus on architecting and testing that service to ensure the
> all three configurations all work independently.

Another possible advantage for multiple queues might be cgroups =
prioritization.

>=20
>>>  It seems awkward that for the host, the ipmi request comes from a
>>>  different process (btbridge, or in our case kcsbridge), while for =
the
>>>  network (RMCP+), the messages are handled directly in the same
>>>  process.
>>=20
>> Is it still awkward if you accept the two queue approach?  The
>> additional layer is needed for the bt/kcs -> host-ipmid
>> abstraction.  No such abstraction is needed for network.
>>=20
>>>=20
>>>  It seems that the network handler could just as easily package the
>>>  command up and send it to ipmid the same way that btbridge does.
>>>=20
>>> 2) Can we modify the signature of the handlers so that they can =
behave
>>>  in a more intelligent manner? It would be nice if they were handed =
a
>>>  gsl::span<uint8_t> instead of a void* and a length. This allows for
>>>  a no-copy, bounds-checked way of passing buffers.
>>=20
>> sounds good to me!
>>=20
>=20
> We can use more intelligent (safer) data passing throughout phosphor =
code. :)
>=20
>>>=20
>>>  It would be nice to know what channel something came in on. We =
might
>>>  want to be able to change behavior based on the incoming channel =
(as
>>>  some channels are more secure than others).
>>=20
>> I think the separate message queues solves this need; however, doing
>> this need not be mutually exclusive of having separate queues if that
>> enables another use case we don=E2=80=99t support today.
>>=20
>> I=E2=80=99m not totally stuck on two queues.  Especially if some =
alternative
>> maintains the same level of flexibility.  The motivation for a single
>> queue isn=E2=80=99t clear yet to me though - without more discussion =
it sounds
>> like we=E2=80=99d end up with the same capability we already =
have=E2=80=A6so why bother?
>>=20
>=20
> One set of cases is where a host might have multiple interfaces to the
> BMC (e.g. BT and SSIF).

What about three queues here?  (bt, ssif and rmcp)?  It would require
some rework of the bt/ssif/kcs -> host-ipmid interface to support =
multiple
host-ipmid instances.=20

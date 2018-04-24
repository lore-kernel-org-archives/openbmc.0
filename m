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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VvwQ3l82zF24D
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 06:25:41 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.39])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 769FF12FB4F;
 Tue, 24 Apr 2018 16:25:36 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Supporting insecure protocols in RMCP+
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20180424182656.GE130821@mauery>
Date: Tue, 24 Apr 2018 16:25:35 -0400
Cc: Emily Shaffer <emilyshaffer@google.com>,
 MARRI DEVENDER RAO <devenrao@in.ibm.com>,
 OpenBMC Development <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3D02171-F800-4A5E-A0F1-6E191937E5AD@fuzziesquirrel.com>
References: <20180423184729.GA130821@mauery>
 <89D77F3D-487B-4FF6-B9B6-5528B8E297B7@fuzziesquirrel.com>
 <20180424153711.GD130821@mauery>
 <DC4DAAAA-D206-435B-94FE-2A82C5AB125D@fuzziesquirrel.com>
 <20180424182656.GE130821@mauery>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
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
X-List-Received-Date: Tue, 24 Apr 2018 20:25:43 -0000


> On Apr 24, 2018, at 2:26 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>=20
> On 24-Apr-2018 01:41 PM, Brad Bishop wrote:
>>=20
>>> On Apr 24, 2018, at 11:37 AM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>>>=20
>>> On 24-Apr-2018 09:39 AM, Brad Bishop wrote:
>>>>=20
>>>>> On Apr 23, 2018, at 2:47 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>>>>>=20
>>>>>> Patch Set 4:
>>>>>>=20
>>>>>>> Given that RMCP+ is already insecure, unless it is a requirement =
to support 1, 2, 15, and 16, you may just want to support 3 and 17.
>>>>>>=20
>>>>>> 1,2,3 are marked as mandatory in the specification. It should be =
a community decision to revoke support for 1,2. If the community is ok, =
it will need additional code changes.
>>>>>=20
>>>>> tl;dr IPMI is old; let's drop the most insecure parts
>>>>>=20
>>>>> Opening this up to a wider audience. I would like some community =
consensus on how we should deal with parts of specifications that don't =
make sense anymore.
>>>>>=20
>>>>=20
>>>> I agree.
>>>>=20
>>>> However, if someone came along and tried to add this back in
>>>> (proving that there is at least one user in the world),
>>>> I would let them (provided its opt-in behavior).
>>>=20
>>> I would push back.
>>=20
>> Why?  What does the project (or anyone) have to gain by making it =
harder
>> for someone to use OpenBMC to meet their needs by requiring them to =
have
>> out-of-tree patches or forks?
>=20
> Why would we want to support insecure protocols?

We wouldn=E2=80=99t.  I was trying to make a more general point.  =
Besides=E2=80=A6whoever
wrote the code to enable those protocols would have to support it.  If =
they
didn=E2=80=99t, then it would get dropped from the tree by the =
maintainer, who is not
interested in maintaining or supporting those protocols.

> This doesn't make any sense. We happily move on to the next version of =
web browser or openssl when a new vulnerability is found. Nobody would =
insist that we must support ROT13 as a symmetric cipher because they =
know it is nonsense.  And thus my next point.
>=20
>>> Education is the fix, not less security.
>>=20
>> The fix to what exactly?  Customer requirements?  Not everyone is =
willing
>> to say no to their customers.  I don=E2=80=99t think it is always (or =
even usually)
>> ignorance that leads to these kind of shortcuts.
>=20
> Sometimes customers do need to understand that their requirements are =
unsafe. It is up to the engineers who understand the security =
implications that may not be obvious to the people who write the =
requirements.
>=20
>>> Call me an idealist.
>>=20
>> And call me a pragmatic.  I think if you apply this mode of thinking =
too
>> often, there won=E2=80=99t be anyone left working on your code with =
you.  But hey,
>> at least it will be _impossible_ for anyone to ever use it in an =
insecure
>> manner.
>=20
> No, I don't believe that is true. People want quality and security. =
Now more than ever. No company wants their name in the headlines saying =
they suffered a security breach.  The BMC is in that fray and OpenBMC =
needs to be at the front of the drive for secure coding and security =
standards.  I want people to use OpenBMC because they can trust it.
>=20
>>> Even then, if they just could not live without it, it would have to =
be done in a way that it can be compiled out by default.
>>=20
>> Of course this is reasonable.  There is a _huge_ difference between =
default
>> behavior and no choice in behavior.
>=20
> And yes, I would accept code that was compiled out by default if =
someone really needed it. But first, I would take the time to talk them =
off the edge first.

Good!  This erases my fears.  Whenever there is talk about unilaterally =
not
allowing code to be upstreamed I get nervous.

>=20
> --Vernon

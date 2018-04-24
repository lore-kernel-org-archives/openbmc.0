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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VrX86Z77zF1RV
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 03:52:56 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.38] (unknown [192.168.253.38])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id E8727EA09B;
 Tue, 24 Apr 2018 13:52:53 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Supporting insecure protocols in RMCP+
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20180424153456.GC130821@mauery>
Date: Tue, 24 Apr 2018 13:52:53 -0400
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>,
 MARRI DEVENDER RAO <devenrao@in.ibm.com>, Tom Joseph <tomjoseph@in.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C090B102-FF39-4B42-80CE-E39DD34D38CF@fuzziesquirrel.com>
References: <20180423184729.GA130821@mauery> <20180423193027.GB130821@mauery>
 <EA662B0F-9F97-49FA-9D9B-8545CBFD3E3B@fuzziesquirrel.com>
 <20180424153456.GC130821@mauery>
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
X-List-Received-Date: Tue, 24 Apr 2018 17:52:57 -0000


> On Apr 24, 2018, at 11:34 AM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>=20
> On 24-Apr-2018 09:17 AM, Brad Bishop wrote:
>>=20
>>> On Apr 23, 2018, at 3:30 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>>>=20
>>> On 23-Apr-2018 11:47 AM, Vernon Mauery wrote:
>>>>> Patch Set 4:
>>>>>=20
>>>>>> Given that RMCP+ is already insecure, unless it is a requirement =
to support 1, 2, 15, and 16, you may just want to support 3 and 17.
>>>>>=20
>>>>> 1,2,3 are marked as mandatory in the specification. It should be a =
community decision to revoke support for 1,2. If the community is ok, it =
will need additional code changes.
>>>>=20
>>>> tl;dr IPMI is old; let's drop the most insecure parts
>>>=20
>>> While I am at it, can we agree
>>=20
>> I agree with all your points.  But why is consensus necessary?
>=20
> Consensus is best when we are intentionally going against the IPMI =
standard.

This was a trick question.  I don=E2=80=99t think we should be limiting =
behaviors
in OpenBMC.  As in, if someone wants to comply to this part of the spec,
they should be able to do that.  If someone wants to skip this part of =
the
spec, they should also be able to do that.

If you accept that world-view, there isn=E2=80=99t anything left to find =
consensus
on other than which behavior is the default.

> With IPMI, there may be several of these things where we might want to =
break the standard in order to provide better security. But I don't =
think we can do that unilaterally.
>=20
> --Vernon
>=20
>>> that anonymous and nameless accounts are dangerous. I know that the =
IPMI spec says that having an account with no name is mandatory, I think =
this is another case of security trumps the standard.
>>>=20
>>> I would at least like a way to disable this at build time so we =
CANNOT have this exploited.
>>=20
>> That sounds like a reasonable way to make the code do what you need.
>>=20
>>>=20
>>> --Vernon

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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VrHZ56CLzF1RV
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 03:42:01 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.38] (unknown [192.168.253.38])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 71D08EA094;
 Tue, 24 Apr 2018 13:41:57 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Supporting insecure protocols in RMCP+
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20180424153711.GD130821@mauery>
Date: Tue, 24 Apr 2018 13:41:56 -0400
Cc: Emily Shaffer <emilyshaffer@google.com>,
 MARRI DEVENDER RAO <devenrao@in.ibm.com>,
 OpenBMC Development <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC4DAAAA-D206-435B-94FE-2A82C5AB125D@fuzziesquirrel.com>
References: <20180423184729.GA130821@mauery>
 <89D77F3D-487B-4FF6-B9B6-5528B8E297B7@fuzziesquirrel.com>
 <20180424153711.GD130821@mauery>
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
X-List-Received-Date: Tue, 24 Apr 2018 17:42:03 -0000


> On Apr 24, 2018, at 11:37 AM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>=20
> On 24-Apr-2018 09:39 AM, Brad Bishop wrote:
>>=20
>>> On Apr 23, 2018, at 2:47 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>>>=20
>>>> Patch Set 4:
>>>>=20
>>>>> Given that RMCP+ is already insecure, unless it is a requirement =
to support 1, 2, 15, and 16, you may just want to support 3 and 17.
>>>>=20
>>>> 1,2,3 are marked as mandatory in the specification. It should be a =
community decision to revoke support for 1,2. If the community is ok, it =
will need additional code changes.
>>>=20
>>> tl;dr IPMI is old; let's drop the most insecure parts
>>>=20
>>> Opening this up to a wider audience. I would like some community =
consensus on how we should deal with parts of specifications that don't =
make sense anymore.
>>>=20
>>=20
>> I agree.
>>=20
>> However, if someone came along and tried to add this back in
>> (proving that there is at least one user in the world),
>> I would let them (provided its opt-in behavior).
>=20
> I would push back.=20

Why?  What does the project (or anyone) have to gain by making it harder
for someone to use OpenBMC to meet their needs by requiring them to have
out-of-tree patches or forks?

> Education is the fix, not less security.=20

The fix to what exactly?  Customer requirements?  Not everyone is =
willing
to say no to their customers.  I don=E2=80=99t think it is always (or =
even usually)
ignorance that leads to these kind of shortcuts.

> Call me an idealist.

And call me a pragmatic.  I think if you apply this mode of thinking too
often, there won=E2=80=99t be anyone left working on your code with you. =
 But hey,
at least it will be _impossible_ for anyone to ever use it in an =
insecure
manner.

> Even then, if they just could not live without it, it would have to be =
done in a way that it can be compiled out by default.

Of course this is reasonable.  There is a _huge_ difference between =
default
behavior and no choice in behavior.

>=20
> --Vernon
>=20
>>> Tables in section 13.28:
>>> (authentication algorithm support)
>>> 00h: RAKP-none        Mandatory (recommend dropping support)
>>> 01h: RAKP-HMAC-SHA1   Mandatory (good, but not best; keep for now)
>>> 02h: RAKP-HMAC-MD5    Optional (not implemented; do not implement)
>>> 03h: RAKP-HMAC-SHA256 Optional (implemented; best available)
>>>=20
>>> (integrity algorithm support)
>>> 00h: none             Mandatory (recommend dropping support)
>>> 01h: HMAC-SHA1-96     Mandatory (good, but not best; keep for now)
>>> 02h: HMAC-MD5-128     Optional (not implemented; do not implement)
>>> 03h: MD5-128          Optional (not implemented; do not implement)
>>> 04h: HMAC-SHA256-128  Optional (implemented; best available)
>>>=20
>>> (confidentiality algorithm support)
>>> 00h: none             Mandatory (recommend dropping support)
>>> 01h: AES-CBC-128      Mandatory (implemented; best available)
>>> 02h: xRC4-128         Optional (not implemented; do not implement)
>>> 03h: xRC4-40          Optional (not implemented; do not implement)
>>>=20
>>> The IPMI spec was written in a time when computing resources were =
minimal and before some of the real security awareness started. And as =
such, it contains some legacy stuff that should really be dropped or at =
the very least deprecated.
>>>=20
>>> The IPMI spec only says that we must implement certain =
authentication, integrity, and confidentiality algorithms, it does not =
explicitly say what cipher suites must be implemented. But, if we =
implement every cipher suite that is available with the required =
algorithms, we would implement cipher suites 0, 1, 2, and 3. And if we =
added in sha256 integrity and authentication, we add in 15, 16, and 17.
>>>=20
>>> Just for comparison, DCMI 1.5 requires only 3, with 17 as =
recommended and 8 as optional. This is a step up from IPMI's security =
recommendations, but still not best. I would say that 3 and 17 should be =
required, with the recommendation that 3 be deprecated (or disabled at =
runtime) in favor of 17 only.
>>>=20
>>> I think we can all agree that cipher suite 0 is poison. It is a =
gaping open door with bright lights saying, "Hack me!" I would argue =
that cipher suites 1 and 2 are not much better. We have the computing =
resources to perform better security, so we should do it. As web =
browsers move along, they deprecate and then disable old versions of =
SSL/TLS. We should do the same. Just because at one point in history it =
was fine to authenticate with plaintext passwords, does not mean we =
should continue to do so. If you know better, do better.
>>>=20
>>> Even if end users come to us and say that they MUST have cipher =
suite 1 or 2, I would argue that we should tell them to update their =
infrastructure rather than re-implement old insecure protocols.
>>>=20
>>>=20
>>> --Vernon

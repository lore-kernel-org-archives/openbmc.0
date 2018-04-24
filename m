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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VkQZ3yDnzF1Rl
 for <openbmc@lists.ozlabs.org>; Tue, 24 Apr 2018 23:17:41 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.38] (unknown [192.168.253.38])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6BBE1EA094;
 Tue, 24 Apr 2018 09:17:35 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Supporting insecure protocols in RMCP+
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20180423193027.GB130821@mauery>
Date: Tue, 24 Apr 2018 09:17:34 -0400
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>,
 MARRI DEVENDER RAO <devenrao@in.ibm.com>, Tom Joseph <tomjoseph@in.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EA662B0F-9F97-49FA-9D9B-8545CBFD3E3B@fuzziesquirrel.com>
References: <20180423184729.GA130821@mauery> <20180423193027.GB130821@mauery>
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
X-List-Received-Date: Tue, 24 Apr 2018 13:17:43 -0000


> On Apr 23, 2018, at 3:30 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>=20
> On 23-Apr-2018 11:47 AM, Vernon Mauery wrote:
>>> Patch Set 4:
>>>=20
>>>> Given that RMCP+ is already insecure, unless it is a requirement to =
support 1, 2, 15, and 16, you may just want to support 3 and 17.
>>>=20
>>> 1,2,3 are marked as mandatory in the specification. It should be a =
community decision to revoke support for 1,2. If the community is ok, it =
will need additional code changes.
>>=20
>> tl;dr IPMI is old; let's drop the most insecure parts
>=20
> While I am at it, can we agree

I agree with all your points.  But why is consensus necessary?

> that anonymous and nameless accounts are dangerous. I know that the =
IPMI spec says that having an account with no name is mandatory, I think =
this is another case of security trumps the standard.
>=20
> I would at least like a way to disable this at build time so we CANNOT =
have this exploited.

That sounds like a reasonable way to make the code do what you need.

>=20
> --Vernon

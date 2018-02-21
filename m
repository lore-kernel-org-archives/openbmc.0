Return-Path: <patrick@stwcx.xyz>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=stwcx.xyz
 (client-ip=135.84.80.216; helo=sender-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
X-Greylist: delayed 2747 seconds by postgrey-1.36 at bilbo;
 Thu, 22 Feb 2018 00:24:07 AEDT
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmdVd0bWkzDqhc
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 00:24:04 +1100 (AEDT)
Received: from [192.168.55.75] (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 15192166853618.459610489425245;
 Wed, 21 Feb 2018 04:38:05 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: Proprietary task references in commit logs
From: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: iPhone Mail (15D100)
In-Reply-To: <1518743037.10440.22.camel@aj.id.au>
Date: Wed, 21 Feb 2018 06:38:03 -0600
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 Stewart Smith <stewart@linux.vnet.ibm.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0B7AC7B5-83C9-4D55-83BA-184112B920DB@stwcx.xyz>
References: <560ecebf-d449-b7e7-675b-03ec3c6f4212@yadro.com>
 <CAO=notw8DrRUP7MiFmDcQ9jqypeFqs6xmwXxPYt_jPf+dtP0DQ@mail.gmail.com>
 <87o9ksfdso.fsf@linux.vnet.ibm.com>
 <06aeaea6-cee0-8f57-654c-5d34f5319905@yadro.com>
 <1518743037.10440.22.camel@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
X-ZohoMailClient: External
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
X-List-Received-Date: Wed, 21 Feb 2018 13:24:11 -0000

If you allow proprietary references you have the general problem of who's tr=
acking reference do you use when multiple organizations have discovered and a=
re tracking the same issue. First one to submit code?  Everyone's? Are we go=
ing to end up with extra patchsets so everyone can put their own proprietary=
 tracker in?  What happens when the fix has already been merged and then you=
 discover it internally?

We'd not rewrite git history to get references into already released fixes. S=
o you have to deal with that case anyhow. The best way to solve that case is=
 that your internal tracker contains the Gerrit ChangeId(s) related to the p=
roblem. And once you do that, you can do the same for unmerged fixes.

Recommendation (which other orgs are already doing): Reference Gerrit IDs in=
 JIRA rather than having Gerrit commits reference JIRA.=20

Patrick
Sent from my iPhone

> On Feb 15, 2018, at 7:03 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
>> On Wed, 2018-02-14 at 11:07 +0300, Alexander Amelkin wrote:
>> 14.02.2018 06:30, Stewart Smith wrote:
>>> I've been poked at this for other firmware too, and I tend to dislike
>>> non-public bug tracker IDs in public repositories.
>>>=20
>>> I have an idea of using git-notes to have a local tree of `fixes` (even
>>> added retroactively) that could then be queried/modified that would suit=

>>> this kind of use case.
>>>=20
>>> Of course, finding enough time to write the couple of hundred lines of
>>> python to do that has been elusive :)
>>=20
>> Exactly! This is all about extra work to do, no time to do it, and=20
>> elusive profit of that effort.
>=20
> Stewart might not have the time to do it himself, but I agree with his
> direction and disagree with taking your suggested shortcut[0]. We
> should find someone with the time to sort it out properly. Please open
> an issue against OpenBMC where the details can be hashed out if you
> feel this is a significant deficiency.
>=20
> Cheers,
>=20
> Andrew
>=20
> [0] as someone who wants to see the issue tracker free of internal
> identifiers as well

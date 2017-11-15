Return-Path: <patrick@stwcx.xyz>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=stwcx.xyz
 (client-ip=135.84.80.216; helo=sender-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
X-Greylist: delayed 908 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Nov 2017 02:06:43 AEDT
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ycSQC1CJYzDqC2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 02:06:42 +1100 (AEDT)
Received: from [10.132.200.31] (mobile-107-92-59-156.mycingular.net
 [107.92.59.156]) by mx.zohomail.com
 with SMTPS id 1510757487436895.5547986949155;
 Wed, 15 Nov 2017 06:51:27 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: On the state of documentation
From: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: iPhone Mail (15B150)
In-Reply-To: <87lgj8rrz6.fsf@linux.vnet.ibm.com>
Date: Wed, 15 Nov 2017 08:40:35 -0600
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B9643A4A-B3FF-4D99-880C-8617231513BA@stwcx.xyz>
References: <87lgj8rrz6.fsf@linux.vnet.ibm.com>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
X-ZohoMailClient: External
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
X-List-Received-Date: Wed, 15 Nov 2017 15:06:43 -0000

The sdbusplus generator that is used on the *-dbus-interfaces repos already s=
upports generating markdown documentation for the APIs. This was suppose to b=
e roughly equivalent to the =E2=80=9Cold=E2=80=9D documentation.=20

The plan was:
  1. Enhance the make files to run the markdown generator.=20
  2. Add a Jenkins job that would run it and publish to the openbmc.github.i=
o repo on merge to an *-dbus-interfaces repo.=20

I don=E2=80=99t think either of these steps has been done but they are also n=
ot a significant effort.=20

Have you looked at the current markdown generation output to see if this wou=
ld be helpful?

Patrick
Sent from my iPhone

> On Nov 15, 2017, at 12:11 AM, Stewart Smith <stewart@linux.vnet.ibm.com> w=
rote:
>=20
> Hi all,
>=20
> thought I'd try and contribute my thoughts here, as a consumer of
> OpenBMC rather than a developer on it.
>=20
> The message has long been that the REST API is what should be used to
> interact with the BMC, and as such we now have a lot of tooling that
> does just that (and we're not the only ones).
>=20
> Over the past $months, it's been frustrating (to say the least) that
> there hasn't been any good documentation of this API.
>=20
> Indeed, If I look at the API on the "Rusty's API Scale" of usability:
> http://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html
> http://ozlabs.org/~rusty/index.cgi/tech/2008-04-01.html
> It's all pretty high on the negatives, although it does vary on what
> specific API you're looking at.
>=20
> A lot of the negative scoring here is due to a near complete absence of
> documentation. Most things that we use have ended up being documented
> either in the implementation (which may or may not allow you to use it
> correctly), or by some random thread on an IBM internal slack channel.
>=20
> Additionally, this issue and PR has come up:
> "Remove org.openbmc.* from REST server"
> https://github.com/openbmc/openbmc/issues/2378
> https://gerrit.openbmc-project.xyz/#/c/7422/
>=20
> This morning, I took a stab at going through the documentation and
> working out what this means for current documentation:
> https://gerrit.openbmc-project.xyz/#/c/7916/
>=20
> In short: it's not good. There is now no longer documentation even
> describing how to turn the host on and off.
>=20
> If the above "remove org.openbmc.* from REST server" is merged, there
> will be *ZERO* documentation on how to turn the host on and off - which
> is about the most simple thing you want to do with a BMC.
>=20
> Is there a plan to attack this?
>=20
> IMNSHO I'd like to see a standard interface be "the way" to talk to
> OpenBMC based systems, something like RedFish, which I noticed there was
> the start of some work on here: https://gerrit.openbmc-project.xyz/#/c/778=
6/
>=20
> But even if RedFish/IPMI became *the* way externally, the internal APIs
> (as in, d-bus APIs) could probably also do with some love.
>=20
> My initial stab at helping with that is:
> https://gerrit.openbmc-project.xyz/#/c/7923/
> but even then, that very same API raises a lot of other questions that I
> haven't addressed - and even in that pull request, I've made a bunch of
> sweeping statements binding the OpenBMC developers to certain API
> stability constraints.
> --=20
> Stewart Smith
> OPAL Architect, IBM.
>=20

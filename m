Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhTBW5YdmzF1Jb
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 05:55:46 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1518634543.11149.76.camel@fuzziesquirrel.com>
Subject: Re: contributor license agreement (CLA)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: openbmc@lists.ozlabs.org
Date: Wed, 14 Feb 2018 13:55:43 -0500
In-Reply-To: <1d8f9186-740f-c75b-a8ec-2abe51221b50@molgen.mpg.de>
References: <1518580396.11149.41.camel@fuzziesquirrel.com>
 <6a06a0b0-4ac4-899b-cfee-a325acb690df@molgen.mpg.de>
 <1518618944.11149.57.camel@fuzziesquirrel.com>
 <1d8f9186-740f-c75b-a8ec-2abe51221b50@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 14 Feb 2018 18:55:48 -0000

On Wed, 2018-02-14 at 15:51 +0100, Paul Menzel wrote:
> Dear Brad,
>=20
>=20
> Thank you for your response.

No problem!

>=20
> > I am not a lawyer but my understanding is that it protects the
> > users
> > of OpenBMC from a contribution to the project by a contributor that
> > did not have the necessary grants to make the submission in the
> > first place.  I found this page to provide a good layman's overview
> > of the benefits: http://oss-watch.ac.uk/resources/cla
>=20
> Thank you for the URL, but, unfortunately, it doesn=E2=80=99t answer th=
e=20
> question what the advantage over the Linux kernel [1] procedure is.

From the article:

"The purpose of a CLA is to ensure that the guardian of a project=E2=80=99=
s
outputs has the necessary ownership or grants of rights over all
contributions to allow them to distribute under the chosen license."

Again I am not a lawyer but based on my limited understanding, I don't
believe projects that only utilize a DCO (like Linux) can make these
assurances to their users.  This is the advantage - rather than
deferring this risk to the users of the project, we provide software
free of these concerns from the very start.

>=20
> Brad, who decided, that CLA are a requirement? To my knowledge, CLAs
> are=20
> only needed, if you think about changing the license in the future.=20
> Besides that, there is *no* advantage, and the Linux Kernel
> procedure=20
> should be used.=20

I think the evidence suggests otherwise.  There are many, many OSS
projects out there - many highly successful, that require a CLA.
Including Linux Foundation projects.  If there were no advantage at all
then this would not be the case.

> It just scares off people wanting to contribute small=20
> fixes and improvements.

I concede the point, but as with any decision it is about cost/benefit=20
- the cost being the point you have raised here, the benefit being
providing our users with software guaranteed to be free of any legal
infringement.

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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4204x34dVxzDqC3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 20:38:47 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 45B59E9F40
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 06:38:44 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: openbmc repository restructuring
Date: Tue, 28 Aug 2018 06:38:44 -0400
References: <8BD97EC3-91CE-45DD-AD6D-678BA4BC2A89@fuzziesquirrel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <8BD97EC3-91CE-45DD-AD6D-678BA4BC2A89@fuzziesquirrel.com>
Message-Id: <B69EC35B-9BB0-437C-9835-FE59759B1FB0@fuzziesquirrel.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2018 10:38:48 -0000


> On Aug 23, 2018, at 10:20 PM, Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>=20
> There is a pretty significant refactor of the openbmc repository going
> through the pipe right now.
>=20
> This has been discussed here:
> https://gerrit.openbmc-project.xyz/#/q/topic:subtrees
>=20
> and here:
> https://lists.ozlabs.org/pipermail/openbmc/2018-August/012707.html
>=20
> and here:
> https://lists.ozlabs.org/pipermail/openbmc/2018-July/012558.html
>=20
> You will likely have some impact to your bitbake development workflow;
> you may have to rebase or resubmit your unmerged bitbake changes; and,
> you might see odd Jenkins CI failures periodically.
>=20
> Please bear with it for the next couple of days while this transition =
is
> completed.  Feel free to find me on IRC if there are any questions.
>=20
> I will follow up with another note when the transition is complete =
with
> additional instructions.

The transition is mostly complete.  There are still a couple things to
do on the backend but that should be transparent to everyone but me.

At this point I am slowly making my way through the open pull requests
against openbmc/openbmc and re-opening them on the correct repository.
You can either wait for me to do it, or go ahead and do that yourself
(the latter will probably happen a bit faster).  Instructions for
generating patches against subtrees can be found in docs/subtree.md.
One nuance not covered in the instructions is that you must regenerate
the Change-Id=E2=80=A6Gerrit will not allow you to use the same =
change-id in
different projects.

>=20
> thx - brad

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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kmrP3YMJzF3HL
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 04:48:36 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id E4744127717;
 Mon,  6 Aug 2018 14:47:57 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Managing openbmc with subtree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <54643fe1-d382-3df7-8630-bb5e01ea2edb@linux.intel.com>
Date: Mon, 6 Aug 2018 14:47:57 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8E5317F7-E0B1-4A2F-B047-52B77E1AD13F@fuzziesquirrel.com>
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
 <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
 <54643fe1-d382-3df7-8630-bb5e01ea2edb@linux.intel.com>
To: Dave Cobbley <david.j.cobbley@linux.intel.com>, prashanth.giri@dell.com,
 sachit_bakshi@dell.com
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Mon, 06 Aug 2018 18:48:38 -0000


> On Aug 1, 2018, at 5:53 PM, Dave Cobbley =
<david.j.cobbley@linux.intel.com> wrote:
>=20
> I posted an initial draft of what permissions could look like in the =
top level meta-data.
>=20
> https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11730/

At first I was OK with this idea but instead of rushing to something
I=E2=80=99d like to slow down for a sec and be sure we don=E2=80=99t =
like the other
options.

My issue with 11730 is that we wind up with different workflows for
updating the different subtrees - for example updating =
meta-virtualization
is different than updating meta-phosphor.

If we go back to your original workflow where the developer pushes =
directly
to the subtree repository instead of openbmc/openbmc, recall we were =
stuck
on how to do it:

>>> However at this point, I end up with two commits in the parent repo, =
one with the squashed changes, and a merge commit.
>>> I don't know how to do this operation without ending up with a merge =
commit, do you have any advice here?
>> To avoid the merge you can skip the subtree pull (which does a merge) =
and
>> instead generate a patch:
>>=20
>> git cherry-pick =E2=80=94strategy=3Dsubtree -Xsubtree=3Dpath/to/subtree=
 <squash-commit>


Elaborating on my suggestion from before - here is a possible workflow.

Consider a repository with two remotes:

$ cat ~/.ssh/config
Host openbmc.gerrit
        Hostname gerrit.openbmc-project.xyz
        Port 29418
        User user
        IdentityFile ~/.ssh/my-gerrit-key

$ git remote -v
meta-phosphor-gerrit    ssh://openbmc.gerrit/openbmc/meta-phosphor =
(fetch)
meta-phosphor-gerrit    ssh://openbmc.gerrit/openbmc/meta-phosphor =
(push)
openbmc-gerrit  ssh://openbmc.gerrit/openbmc/openbmc (fetch)
openbmc-gerrit  ssh://openbmc.gerrit/openbmc/openbmc (push)

You can make and commit changes as usual.  When it comes time to push =
for
review:

$ git checkout -b phosphor-master meta-phosphor-gerrit/master
$ git cherry-pick =E2=80=94-strategy=3Dsubtree -Xsubtree=3Dmeta-phosphor =
<openbmc/openbmc-sha>
$ git push meta-phosphor-gerrit HEAD:refs/for/master

This gives us the same process for all subtrees, whether or not they are
openbmc hosted subtrees.  It also does not require people hacking on a
subtree to clone OpenBMC when it doesn=E2=80=99t make sense for them to =
do that,
such as someone just using the Aspeed BSP layer.

Granted it is a couple extra commands, but it seems like something that =
could
be scripted pretty easily.  Thoughts?

-brad

>=20
> This will require additional people receive +2 permissions, but the =
OWNERS plugin will ensure that a patch cannot get merged unless it has =
+2 from the appropriate people.
>=20
> Thanks,
> -Dave

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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41XJCv1v4jzDqCG
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jul 2018 03:44:09 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id B02C5129934;
 Fri, 20 Jul 2018 13:43:33 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Managing openbmc with subtree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
Date: Fri, 20 Jul 2018 13:43:33 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
To: Dave Cobbley <david.j.cobbley@linux.intel.com>
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
X-List-Received-Date: Fri, 20 Jul 2018 17:44:12 -0000


> On Jul 19, 2018, at 4:08 PM, Dave Cobbley =
<david.j.cobbley@linux.intel.com> wrote:
>=20
> Brad,
> Trying to identify the appropriate work-flowfor using git subtree to =
maintain all the meta-data under openbmc.
> I'm imagining something like:
>=20
> 17 subtrees
> ** indicates an actual folder, not subtree.
> meta-openembedded/
> meta-raspberrypi/
> meta-virtualization/
> poky/
> **meta-openbmc-machines/
> ** meta-arm
>    =E2=94=9C=E2=94=80=E2=94=80 common
>    =E2=94=94=E2=94=80=E2=94=80 meta-qualcomm
> **meta-evb
>    =E2=94=9C=E2=94=80=E2=94=80 meta-evb-aspeed
>    =E2=94=9C=E2=94=80=E2=94=80 meta-evb-nuvoton
>    =E2=94=9C=E2=94=80=E2=94=80 meta-evb-raspberrypi
> **meta-openpower
>    =E2=94=9C=E2=94=80=E2=94=80 meta-ibm
>    =E2=94=9C=E2=94=80=E2=94=80 meta-ingrasys
>    =E2=94=9C=E2=94=80=E2=94=80 meta-inventec
>    =E2=94=9C=E2=94=80=E2=94=80 meta-rackspace
> **meta-x86
>     =E2=94=9C=E2=94=80=E2=94=80 meta-intel
>     =E2=94=9C=E2=94=80=E2=94=80 meta-mellanox
>     =E2=94=9C=E2=94=80=E2=94=80 meta-portwell
>     =E2=94=94=E2=94=80=E2=94=80 meta-quanta
> **meta-openbmc-bsp/
>     =E2=94=9C=E2=94=80=E2=94=80 meta-aspeed
>     =E2=94=9C=E2=94=80=E2=94=80 meta-ibm
>     =E2=94=9C=E2=94=80=E2=94=80 meta-nuvoton
> meta-phosphor/
>=20

This is a great picture, thanks.  My longer-term vision is a bit more =
like this:

meta-openembedded/
meta-virtualization/
poky/
meta-arm/
meta-openpower/
meta-x86/
meta-phosphor/

Or even ditching Yocto and just using OE-Core/bitbake directly:

meta-openembedded/
meta-virtualization/
meta/
bitbake/
meta-arm/
meta-openpower/
meta-x86/
meta-phosphor/

I could understand a case for including the BSPs in the base distro:

meta-openembedded/
meta-virtualization/
meta/
bitbake/
meta-arm/
meta-openpower/
meta-x86/
meta-phosphor/
meta-aspeed/
meta-ibm/ -> for our SOCs only, not servers
meta-nuvoton/
meta-raspberrypi/

The main thing to notice with all of these is I=E2=80=99ve removed =
meta-foo from
meta-openpower, meta-x86 and meta-arm.  This lets people have arm, power
and x86 servers all in the same layer or repo if they want:

meta-xyzcorp/
   |=E2=80=94 meta-arm-server/
   |- meta-x86-server/
   |- meta-power-server/

Actually I=E2=80=99ve removed them from the repository completely.  I =
think we
need some kind of reference platform(s) just like Yocto.  Otherwise we =
are
going to wind up with too many server-layers in the distro.

Another idea is to scrap meta-openpower, meta-arm and meta-x86
and put all that content in meta-phosphor:

meta-openembedded/
meta-virtualization/
meta/
bitbake/
meta-phosphor/

What do you think of all this?  There is a lot of change here, so some
staging would be required.  Obviously all ideas are debatable.

>=20
> I began working on the workflows that a typical dev would do to check =
code in and have Jenkins automatically update the top level repo with =
the new additions, but run into troublewith a merge commit.
>=20
> 1. git clone openbmc-openbmc
> 2. #make changes
> 3. git add
> 4. git commit...
> 5. git subtree push --prefix=3Dpath/to/local/subtree =
ssh://openbmc.gerrit/openbmc/<subtree_name> HEAD:refs/for/master

Looks good to me.  This should be pretty similar to the workflow
for OE-Core -> Poky right?

>=20
> At this point, the build CI would run it's normal operations and code =
review would take place.
> Following a +2 and submit, Jenkins would:
>=20
> 1. cd openbmc-openbmc
> 2. git pull
> 3. git subtree pull --prefix=3Dpath/to/subtree --squash <remote> =
master #For all given subtrees

I think I read somewhere that Poky has another verification and approval
step here, before merging OE-Core/bitbake patches into Poky.  Do we want
to be like Poky and require testing and/or maintainer approval here?

>=20
> However at this point, I end up with two commits in the parent repo, =
one with the squashed changes, and a merge commit.
> I don't know how to do this operation without ending up with a merge =
commit, do you have any advice here?

To avoid the merge you can skip the subtree pull (which does a merge) =
and
instead generate a patch:

git cherry-pick =E2=80=94strategy=3Dsubtree -Xsubtree=3Dpath/to/subtree =
<squash-commit>

>=20
> I could be totally overthinking the whole strategy,

I don=E2=80=99t think so.  Its par for the course I think for an OE =
based distribution.

> so any advice and direction is much appreciated!
> Along those same lines, is subtree still the correct tool?

I think so.  I had a look at Combo-layer awhile back=E2=80=A6it seems to =
do the
same thing as git cherry-pick, that is, generate patches and apply them
to the parent repository.  It does layer some features on top of that
but I haven=E2=80=99t missed those yet.  They are similar enough I feel =
we could
switch back and forth if need be.  I=E2=80=99m guessing Combo-layer was =
written
before subtrees had the support they do today in Git.

> I hear repo works for a lot of projects, Yocto uses =
https://wiki.yoctoproject.org/wiki/Combo-layer.
>=20
> Thanks,
> -Dave

Thanks for kicking off this conversation!

-brad

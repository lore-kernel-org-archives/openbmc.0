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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mffb0slMzDr5r
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 06:16:37 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id B351812992E;
 Thu,  9 Aug 2018 16:16:32 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Managing openbmc with subtree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <8b4c11b3-d6d7-c586-5d10-9c028d3fefb2@linux.intel.com>
Date: Thu, 9 Aug 2018 16:16:32 -0400
Cc: openbmc@lists.ozlabs.org, prashanth.giri@dell.com, sachit_bakshi@dell.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <27F75378-E985-47F6-8516-086CF8197D85@fuzziesquirrel.com>
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
 <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
 <54643fe1-d382-3df7-8630-bb5e01ea2edb@linux.intel.com>
 <8E5317F7-E0B1-4A2F-B047-52B77E1AD13F@fuzziesquirrel.com>
 <9b967642-9c97-c7e5-7114-c024ada10a4f@linux.intel.com>
 <7B99FD60-9493-4A17-ABF0-D1315D86B1CB@fuzziesquirrel.com>
 <8b4c11b3-d6d7-c586-5d10-9c028d3fefb2@linux.intel.com>
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
X-List-Received-Date: Thu, 09 Aug 2018 20:16:40 -0000


> On Aug 8, 2018, at 6:14 PM, Dave Cobbley =
<david.j.cobbley@linux.intel.com> wrote:
>=20
>=20
>>> On Aug 7, 2018, at 1:16 PM, Dave Cobbley =
<david.j.cobbley@linux.intel.com> wrote:
>>>=20
>>> I do agree that we can find a scriptable solution to this, however, =
I feel using the OWNERS plugin provides a much easier workflow for all =
developers, i.e. nothing changes from their perspective.
>> Hrm, while I agree that the OWNERS plugin preserves the existing =
workflow
>> I=E2=80=99m not convinced that is the best path forward.
> I suppose it does only give us one of the two goals, where as moving =
straight to subtrees fulfills all of the goals.
>>=20
>>>> This gives us the same process for all subtrees, whether or not =
they are
>>>> openbmc hosted subtrees.  It also does not require people hacking =
on a
>>>> subtree to clone OpenBMC when it doesn=E2=80=99t make sense for =
them to do that,
>>>> such as someone just using the Aspeed BSP layer.
>>=20
>> I still have these concerns.
> I understand your concerns and agree

Is this an agreement to my proposed workflow?

For reference the proposal was distro hackers could have an =
openbmc/openbmc repo
with multiple remotes, one for the distro and one for each subtree and =
then:

>>>> $ git checkout -b phosphor-master meta-phosphor-gerrit/master
>>>> $ git cherry-pick =E2=80=94-strategy=3Dsubtree =
-Xsubtree=3Dmeta-phosphor <openbmc/openbmc-sha>
>>>> $ git push meta-phosphor-gerrit HEAD:refs/for/master
>=20
> - Here is what I would propose for the subtree folder structure:
>=20
> Splat * represents a subtree
>=20
> Yocto & more:
> import-layers/
>     *meta-openembedded/
>     *meta-virtualization/
>     *poky/
>     *meta-security/

Would it make sense to put meta-* directly in the root, along with all =
our other
subtrees?  I don=E2=80=99t see the point in calling them out as upstream =
trees - I=E2=80=99d like
to see some or all of our project meta trees become hosted elsewhere =
someday,
much in the same way as meta-virt for example.

>=20
> BSP:
> meta-openbmc-bsp/
>    *meta-ibm/
>    *meta-aspeed/
>    *meta-nuvoton/
>    *meta-raspberrypi/

lgtm

>=20
> MACHINES:
> meta-openbmc-machines/
>    meta-arm/
>        *meta-qualcomm/
>    meta-openpower/
>        * meta-ibm/
>        * meta-ingrasys/
>        * meta-inventec/
>        * meta-rackspace/
>    meta-x86/
>        *meta-intel/
>        *meta-mellanox/
>        *meta-portwell/
>        *meta-quanta/

I=E2=80=99d like to get away from this and just put the company subtrees =
at the root.
That way meta-xyzcorp could support both an x86 and an arm server.

>=20
> REFERENCE:
> meta-phosphor/

I=E2=80=99d suggest the arch metas here, at the root.  Honestly I=E2=80=99=
d like to get to a point
where all the arch layers are just merged into meta-phosphor and we can =
say
meta-phosphor supports x86, power, and arm servers (along with TORSes).  =
But we can
save that for another day.

>=20
>=20
> -Dave

So to net these all out:

*poky/

*meta-openembedded/
*meta-virtualization/
*meta-security/
*meta-arm/
*meta-openpower/
*meta-x86/
*meta-phosphor/

*meta-aspeed/
*meta-nuvoton/
*meta-raspberrypi/

*meta-intel/
*meta-mellanox/
*meta-portwell/
*meta-quanta/
*meta-ibm/
*meta-ingrasys/
*meta-inventec/
*meta-rackspace/
*meta-qualcomm/=

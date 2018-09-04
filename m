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
 by lists.ozlabs.org (Postfix) with ESMTPS id 424dVz4ZNTzF37H
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 06:20:27 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C747A6DD32;
 Tue,  4 Sep 2018 16:20:24 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Proposals for commit log policy
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345836D0F@ORSMSX114.amr.corp.intel.com>
Date: Tue, 4 Sep 2018 16:20:24 -0400
Cc: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Andrew Geissler <geissonator@gmail.com>,
 Alexander Amelkin <a.amelkin@yadro.com>, "Tanous, Ed" <ed.tanous@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5755FBD3-3D78-4E3A-8F50-D4976EE3B2B2@fuzziesquirrel.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
 <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
 <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
 <359bcf51-5732-a65b-4b7e-dba2df0dd375@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345836D0F@ORSMSX114.amr.corp.intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 04 Sep 2018 20:20:28 -0000



> On Aug 28, 2018, at 6:20 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>=20
>>=20
>> I object too. I don't think the benefit of manual bumps is worth the =
effort.
>>=20
>=20
> Another vote for "I don't think it's worth the effort".
>=20
> Automatic bumps keep us up to date and make breakages happen and get =
fixed faster.  I would actually prefer that every gerrit review creates =
a manual bump to make sure the complete system builds with their given =
component change, but I realize this is hard to do.
>=20
> -Ed

The autobump script stopped working when we switched to yocto-style =
subtrees.

I fixed it up (by re-writing it in python=E2=80=A6it was in Perl) and =
re-deployed, given
all the objections.

-brad=

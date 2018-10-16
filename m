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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42YyRx5cX0zF1pS
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 12:30:37 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 3CDFC6DC97;
 Mon, 15 Oct 2018 21:30:34 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Loss of several MB of run-time memory
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8XdS78mTtqqNUW_YbbwKYWbcpiaBnfU7AOe3QSMGr-ZkNQ@mail.gmail.com>
Date: Mon, 15 Oct 2018 21:30:33 -0400
Cc: Patrick Venture <venture@google.com>, Ed Tanous <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Kun Yi <kunyi@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7E1120BC-07AD-44B9-8E6A-41CCD5DE9480@fuzziesquirrel.com>
References: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
 <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
 <CAGMNF6V6eo3G8WSHdpcy5g9e56tYW_C7g_tBA0bRyfByJrTHiQ@mail.gmail.com>
 <CACPK8XdS78mTtqqNUW_YbbwKYWbcpiaBnfU7AOe3QSMGr-ZkNQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3445.9.1)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2018 01:30:38 -0000



> On Oct 9, 2018, at 6:25 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Wed, 10 Oct 2018 at 03:38, Kun Yi <kunyi@google.com> wrote:
>>=20
>> A somewhat tedious way to test would be to build and boot with =
'bitbake core-image-minimal' to ensure no phosphor-daemons are loaded, =
and then compare the kernel memory footprint.
>>=20
>> On Tue, Oct 9, 2018 at 10:01 AM Tanous, Ed <ed.tanous@intel.com> =
wrote:
>>>=20
>>> Was this only the kernel version jump, or did you jump in =
openbmc/phosphor levels as well?  There have been quite a few daemons =
added in the last 6 months or so that could explain your memory =
footprint increase.
>=20
> HI team. Just a reminder about email etiquette on the mailing lists
> that Brad posted a while back:
>=20
> =
https://fedoraproject.org/wiki/Mailing_list_guidelines#Proper_posting_styl=
e
>=20
> In particular the top posting bit, which makes it hard to reply to =
this thread.
>=20
> Back to the issue at hand:
>=20
>>>> On Oct 9, 2018, at 9:54 AM, Patrick Venture <venture@google.com> =
wrote:
>>>>=20
>>>> Just jumped from 4.7 kernel to 4.18 running the latest openbmc =
image
>>>> on the quanta-q71l board.  And I see now I have ~20MiB of RAM free =
for
>>>> stuff once things are settled, whereas before I could have up to
>>>> 35MiB.
>=20
> Are you able to boot the new kernel with the old userspace? This will
> allow you to compare like for like (even if the system is not fully
> functional in that state). Alternatively, boot it with a small
> non-openbmc initrd to allow comparisons as Kun suggested.
>=20
> The kernel has grown a bunch of new drivers. Most of them should not
> probe, and therefore won't allocate memory at run time, but there may
> be some new ones.
>=20
> I've not spent much time looking at runtime memory usage, so if these
> suggestions don't provide answers we might need to investigate a bit
> deeper.
>=20
>>>> This matters for a few reasons:
>>>> 1) my memory chip is too small to be practical and I need all the
>>>> bytes I can get.
>>>> 2) I need at least 32MiB to load a new firmware image.
>>>>=20
>>>> I dropped all the python except the mapper, and I dropped the newer
>>>> daemons from my build to clear out that difference.  It was =
originally
>>>> about 16MiB difference, so I was thinking that something is now =
being
>>>> mapped by default that wasn't before, such as part of a flash =
image.
>=20
> I initially thought you were confusing RAM with flash size, but on a
> second read I now understand.
>=20
> There has been recent work to create phosphor-tiny, is that relevant =
here Brad?

No, at least not yet.  At the moment all phosphor-tiny does is remove =
all the python
source (leaving just the bytecode) - so flash footprint only.

>=20
> Cheers,
>=20
> Joel

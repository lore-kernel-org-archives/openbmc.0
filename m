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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kPkc35fPzDsFP
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 06:27:35 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 619AB6DC87;
 Mon, 29 Oct 2018 15:27:32 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: Should we tag master?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notwRaJcdiD8KnbB_pe3k=v6BFZXGnrEcxBH-29LZ=pGL6A@mail.gmail.com>
Date: Mon, 29 Oct 2018 15:27:32 -0400
Cc: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <674AECB5-F797-477D-B4CA-A7A257310CE8@fuzziesquirrel.com>
References: <b955c4bf-7605-945d-c7dd-ac3669809cee@linux.vnet.ibm.com>
 <CAO=notwRaJcdiD8KnbB_pe3k=v6BFZXGnrEcxBH-29LZ=pGL6A@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.100.39)
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
X-List-Received-Date: Mon, 29 Oct 2018 19:27:37 -0000



> On Oct 13, 2018, at 5:13 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> On Sat, Oct 13, 2018 at 2:09 PM Gunnar Mills =
<gmills@linux.vnet.ibm.com> wrote:
>>=20
>> I think we should tag in the next week or two with a v2.4. I know it =
is
>> pretty arbitrary when we tag, but I have heard several companies use =
it.
>> The last time we tagged was July 12th and there have been over 600
>> commits since then. The last few tags have been every ~3 months, so =
we
>> are due by that schedule. The Release Planning Group is planning a =
2.6
>> release in January but until then I vote we continue to tag every 3
>> months. There was some discussion on the mailing in August about =
this:
>> https://lists.ozlabs.org/pipermail/openbmc/2018-August/012922.html
>=20
> My only thought is, it might benefit to wait until the great renaming
> is done or closer to done so that when downstream distros (like ours)
> rebase, they will be rebasing onto a more stable version.  I expect
> Brad and I will be done in a couple weeks, so I'm not anticipating
> needing a long delay on this.
>=20
>>=20
>> Thanks,
>> Gunnar
>>=20

This was discussed on the community call today.  I=E2=80=99ll start =
limiting
meta-phosphor content to fixes only on 11/11 and then I=E2=80=99ll do a =
v2.4 tag
on 11/16.

thx - brad=

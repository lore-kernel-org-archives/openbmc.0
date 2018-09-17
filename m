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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DYfN3mVtzF310
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 03:54:19 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 53E67E269B;
 Mon, 17 Sep 2018 13:54:15 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: New repository Request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notz2r=s3+Odk5x9i-d_VSD0m8q5VnmmHzQ4pnDuQtzpmgA@mail.gmail.com>
Date: Mon, 17 Sep 2018 13:54:15 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4FC9A818-10BF-4383-8508-38AA81FCF9E0@fuzziesquirrel.com>
References: <CAO=notxkKpZMyPktPjJ+HeYYuOnwcGMvV6ewdEvdMBUqioLvGg@mail.gmail.com>
 <62B77266-3919-48A4-91E1-BF6EACDC4E47@fuzziesquirrel.com>
 <CAO=notz2r=s3+Odk5x9i-d_VSD0m8q5VnmmHzQ4pnDuQtzpmgA@mail.gmail.com>
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Mon, 17 Sep 2018 17:54:21 -0000



> On Sep 17, 2018, at 1:20 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> On Mon, Sep 17, 2018 at 7:03 AM Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>>=20
>>=20
>>=20
>>> On Sep 14, 2018, at 7:57 PM, Patrick Venture <venture@google.com> =
wrote:
>>>=20
>>> Brad;
>>>=20
>>> Please create: google-ipmi-sys -- this is to hold OEM IPMI commands =
we
>>> want to share with the community and vendors, but dont' expect to be
>>> picked up by OpenBMC at large, similar to intel-ipmi-oem.

google-ipmi-sys created.

>>=20
>> All the existing OEM IPMI repositories end with -ipmi-oem.  Does that =
not
>> make sense here?
>=20
> So phosphor-ipmi-blobs and phosphor-ipmi-flash are both ipmi-oem
> libraries.  As well as phosphor-ipmi-ethstats.  My thinking was having
> -ipmi- in the name was conveying sufficient information related to
> this.

ok.

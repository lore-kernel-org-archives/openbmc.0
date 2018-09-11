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
 by lists.ozlabs.org (Postfix) with ESMTPS id 428jm815N0zF38Y
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 21:45:58 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id CB134EA23E;
 Tue, 11 Sep 2018 07:45:54 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: tiny package --
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notxDMD=CokqnGPUg6uw9Py9WuTLA70di8EU0XSCcUkN_bg@mail.gmail.com>
Date: Tue, 11 Sep 2018 07:45:54 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A978AFE3-4EA9-41A7-A96D-88D9533FAF87@fuzziesquirrel.com>
References: <CAO=notxW6Yq+uct7quRtNjFfp0DeyrsqXuYJh1uuBx-cDEa_MQ@mail.gmail.com>
 <5D7FB144-D237-41CF-B911-CB2A9818A91A@fuzziesquirrel.com>
 <CAO=notxDMD=CokqnGPUg6uw9Py9WuTLA70di8EU0XSCcUkN_bg@mail.gmail.com>
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Tue, 11 Sep 2018 11:46:00 -0000



> On Sep 10, 2018, at 12:05 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> On Mon, Sep 10, 2018 at 5:39 AM Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>>=20
>>> On Sep 8, 2018, at 12:01 PM, Patrick Venture <venture@google.com> =
wrote:
>>>=20
>>> I was looking at publishing a single-header file from a package
>>> containing only that header file.  In this case, "oemgoogle.hpp" =
into
>>> the same place that phosphor-host-ipmid installs its headers so that
>>> any google-ipmi-* packages could store their OEM numbers in one file
>>> (upstream).
>>=20
>> Why is the number hardcoded at all?  Could it be a configure option =
or
>> command line option?
>=20
> I could definitely add the number to each daemon or library, however
> having a single source of the numbers is valuable to avoid accidental
> collisions.

Agree to disagree I guess.  You could define it once in your layer and
be done=E2=80=A6

>=20
>>=20
>> If those don=E2=80=99t work, as a fall-back can we just put the =
header in the
>> upstream phosphor-host-ipmid repository as you=E2=80=99ve done =
downstream?
>=20
> I started with this approach and it was rejected by the maintainers,
> because the numbers reserved for Google code (even shared upstream)
> "didn't belong" in phosphor-host-ipmid.

I think we should push back on this.=

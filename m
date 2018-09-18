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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FHXf4R5XzF3HZ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 08:21:53 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 89789E5CF6;
 Tue, 18 Sep 2018 18:21:49 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: New Repository Request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notx9KnTNNC1UnL=DQkfpgqaUmKsbMeAG1H8CkodXGDVQ4Q@mail.gmail.com>
Date: Tue, 18 Sep 2018 18:21:49 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A951F86E-51B1-49DB-8219-592A9236E59A@fuzziesquirrel.com>
References: <CAO=noty_TQ2jvQw-Yxb-RYe+0xOXa4F39ozF11r9PN1w2Qt_Dw@mail.gmail.com>
 <C385EBD1-871A-4E5B-8FDE-80146795CC6D@fuzziesquirrel.com>
 <CAO=notx9KnTNNC1UnL=DQkfpgqaUmKsbMeAG1H8CkodXGDVQ4Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Sep 2018 22:21:55 -0000



> On Sep 18, 2018, at 11:47 AM, Patrick Venture <venture@google.com> =
wrote:
>=20
> On Fri, Sep 14, 2018 at 6:00 AM Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>>=20
>>=20
>>> On Sep 13, 2018, at 1:55 PM, Patrick Venture <venture@google.com> =
wrote:
>>>=20
>>> Brad,
>>>=20
>>> I'd like to set up a new repository in openbmc to store a google oem
>>> ipmi library I'd like to share with everybody.  It allows grabbing
>>> ethernet device statistics over IPMI.
>>=20
>> As far as where the code is hosted I=E2=80=99m good one way or the =
other.
>> Will wait a couple days for objections and create =
openbmc/phosphor-ipmi-ethstats.
>=20
> Please go ahead and create openbmc/phosphor-ipmi-ethstats

done!=

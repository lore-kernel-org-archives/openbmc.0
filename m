Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zBXDB3ZXkzDqmD
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 00:42:17 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2018 05:42:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,501,1508828400"; d="scan'208";a="192048263"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.255.24.156])
 by fmsmga006.fm.intel.com with ESMTP; 03 Jan 2018 05:42:15 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Andrew Geissler'" <geissonator@gmail.com>
Cc: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <000001d37d41$925b7590$b71260b0$@linux.intel.com>
 <CALLMt=oeRyF543vtsNuNdrqafz641B16KzYf5JhyK5b9ve5h8Q@mail.gmail.com>
In-Reply-To: <CALLMt=oeRyF543vtsNuNdrqafz641B16KzYf5JhyK5b9ve5h8Q@mail.gmail.com>
Subject: RE: Is there any tool to query dbus interface property?
Date: Wed, 3 Jan 2018 21:42:14 +0800
Message-ID: <000001d38498$aab65d90$002318b0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQLz84i+7sGsa0hkvuTdU9LuEkB7VwC8nFu5oRtkwlA=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjU4YTY4MWMtYWFlNS00ZWVkLTg1ODUtMTM1NDdjODBiMjM4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlFpRDZKajhHUEFlbXlVNkt4RWJqTTM1MVdPcFpvbmlPTjAwdm1mQWdNUWc9In0=
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jan 2018 13:42:19 -0000

Thanks for your information.

What I want is to wait for a property to be an expected value.=20
For example, wait for pgood to be 1, to make sure the power is on.

Let me check on the mapper wait command......

Thanks,
Yong

-----Original Message-----
From: Andrew Geissler [mailto:geissonator@gmail.com]=20
Sent: Wednesday, January 3, 2018 9:37 PM
To: Yong Li <yong.b.li@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Is there any tool to query dbus interface property?

On Sun, Dec 24, 2017 at 11:31 PM, Yong Li <yong.b.li@linux.intel.com> =
wrote:
> Hi All,
>
>
>
> I would like to query a dbus property and make different actions based =

> on the property.

Just querying a property can be done via the busctl tool: busctl =
get-property xyz.openbmc_project.State.BMC
/xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC =
CurrentBMCState

> Just like the pgood_wait.c in skeleton, but it only supports the pgood =

> property. Is there any a common tool can support query/wait different=20
> dbus interface/objects?

Waiting on a dbus service can be done via the mapper tool: mapper wait
/xyz/openbmc_project/state/bmc0

And this can also all be done in the application code itself using =
sdbusplus interfaces to mapper and the objects you're interested in.

>
>
> If not, I would like to create one based on the pgood_wait.c
>
>
>
> Thanks,
>
> Yong
>
>

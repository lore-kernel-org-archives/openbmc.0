Return-Path: <sharad.khetan@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DLX76hQTzDqhS
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 11:33:25 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2018 16:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,340,1539673200"; d="scan'208";a="100484720"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga008.jf.intel.com with ESMTP; 10 Dec 2018 16:33:23 -0800
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 10 Dec 2018 16:33:23 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.28]) by
 fmsmsx120.amr.corp.intel.com ([169.254.15.52]) with mapi id 14.03.0415.000;
 Mon, 10 Dec 2018 16:33:23 -0800
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Andrew Geissler <geissonator@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Upstream Reference System(s)
Thread-Topic: OpenBMC Upstream Reference System(s)
Thread-Index: AQHUkLt+NMetXXQI1UimtLHjV4cGp6V4sMef
Date: Tue, 11 Dec 2018 00:33:22 +0000
Message-ID: <EA6DEA68-3D8C-4F2D-AA2D-71C8EC28F91B@intel.com>
References: <CALLMt=qWJemCvKW-5VBgPTbjfwb2WTw-YitFJYicRTz5oXNNAA@mail.gmail.com>
In-Reply-To: <CALLMt=qWJemCvKW-5VBgPTbjfwb2WTw-YitFJYicRTz5oXNNAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 11 Dec 2018 00:33:29 -0000

Hi Andrew,=20
I would like to see (and will support) an Intel platform. It may be Wolf Pa=
ss or something else. I am not sure if the requirements and expectations of=
 supporting such a platform.=20
I will discuss internally and get back.=20
Thanks,
-Sharad

> On Dec 11, 2018, at 12:36 AM, Andrew Geissler <geissonator@gmail.com> wro=
te:
>=20
> Greetings,
>=20
> One thing that has come up a few times, and was touched on in last weeks
> Infrastructure workgroup (and todays community meeting), was what is our
> community reference system(s)? i.e. What do we as a community test agains=
t
> and guarantee works when we do a tag or release?
>=20
> If you look at something like https://openpower.xyz/job/openbmc-build/ yo=
u
> will see a variety of systems. Romulus is put through QEMU CI and another=
,
> Witherspoon, is put through HW CI currently. This list has been mostly cr=
eated
> by IBM, and so it brings up the question of what's our future plan here.
>=20
> First, what's the criteria for adding a system to officially being suppor=
ted by
> the upstream community?
> - Covers as much OpenBMC function as possible?
> - Is on hardware that anyone can easily (and cheaply) get their hands on?
> - Has consistent upstream support and a person or company to support HW C=
I?
>=20
> The witherspoon and romulus systems definitely are well supported by IBM =
in
> the upstream community but they are not all that cheap. There was a rasbe=
rry
> pi port out there that would be cheap and easy to get access to but not c=
over
> as much OpenBMC function. There's something like
> https://www.raptorcs.com/content/TLSDS3/intro.html which is a bit more
> accessible but I don't believe the code has been upstreamed.
>=20
> One point made in last weeks Infrastructure workgroup is we should shoot
> for a minimum amount of hardware that covers as much function as possible=
.
> So a matrix of some sort that covers our major functional areas. In gener=
al,
> having a system on the upstream support list is like getting your code
> upstreamed,
> once in, you have a guarantee that all future code will support it, so ma=
ybe
> this is more of a community reward to get your system on the list?
>=20
> Just throwing ideas out there, input and ideas appreciated.
>=20
> Andrew
>=20
> References:
> https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

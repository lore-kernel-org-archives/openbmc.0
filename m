Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zc5B1K0dzDq5k
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 01:59:09 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2018 08:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,295,1531810800"; d="scan'208";a="258413781"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by fmsmga006.fm.intel.com with ESMTP; 27 Aug 2018 08:59:07 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX106.amr.corp.intel.com ([169.254.1.57]) with mapi id 14.03.0319.002;
 Mon, 27 Aug 2018 08:59:07 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>, "eajames@linux.vnet.ibm.com"
 <eajames@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: KVM Support?
Thread-Topic: KVM Support?
Thread-Index: AQHUO7lUeASCSKYkH0Gc28tAnBmHq6TPOweAgARsioCAABuygA==
Date: Mon, 27 Aug 2018 15:59:06 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345835D1C@ORSMSX114.amr.corp.intel.com>
References: <tencent_5D1EDC1D8DB78D128D29AA554AADF300AE08@qq.com>
 <004c4dee-ada1-61f8-6c6c-653be2b3e57f@linux.vnet.ibm.com>
 <tencent_54C0BC7D36D43C257F35D6C9@qq.com>
 <17c12028-a8c5-7b39-aa17-afa80b0ec0da@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345835528@ORSMSX114.amr.corp.intel.com>
 <3d92122e8c42452caee0ece1769ee147@NTHCML01A.nuvoton.com>
In-Reply-To: <3d92122e8c42452caee0ece1769ee147@NTHCML01A.nuvoton.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmQxYjljYzItYmU5OS00ZTJiLThmYWEtYTFhY2NlNmVmOTIxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNzh0XC9ERzRINUw1T0M0OXhCSnZYWXpWdkN1R21HdWczcnNDc09FTVlMS2xGMzB2UkEyTDN4d3JySVlhV3JRWnAifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 27 Aug 2018 15:59:11 -0000

>=20
> Do you have any plan to support non-jpeg video stream in obmc-iKVM?=09
I'm not sure about Eddie, but I don't think we have  a need for non-jpeg kv=
m.  With that said, everything is just running RFB underneath, so basically=
 anything should be possible that's possible over VNC.

> It is possible some platforms don't have hardware JPEG engine, instead ha=
ve
> the RGB video stream.
> If possible to support RGB video stream, I think it would be better if yo=
u can
> add the video frame differentiation in obmc-iKVM because we don't need to
> send the full screen to VNC client on every request, it can reduce the bu=
ffer
> size at least. (libvncserver already has the video frame differentiation)

While I agree it would be nice, I don't think it's a priority 1 for impleme=
ntation (at least for us).  Our current AST2500 products send full buffer u=
pdates for every frame, and while in theory it's less efficient, we haven't=
 really gotten any complaints.  With that said, if differential mode is ava=
ilable and works well, I'm sure we'd use it.

>=20
> Also, I have implemented a KVM application for our platform(nuvoton evb-
> npcm750) which has hardware video frame differentiation and hardware
> hextile engine.
> https://github.com/Nuvoton-Israel/obmc-ikvm
> https://github.com/Nuvoton-
> Israel/linux/commit/7e90f572323e56e9425b85aafe86dfa5a35c4e7d
>=20
Cool.

> I also enabled ED's KVM webui and added kvmws proxy in python web
> server.
> https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-
> addon/commit/140771b7e898dd5ca8f0364290cce669609088ac
>=20

I've got patches for bmcweb as well that I can get posted today.  I was rea=
lly hoping to have a discussion around how we want to implement the web por=
tion beforehand, but it looks like you've already done a lot of work, which=
 is great.

>=20
> Regarding the larger binary size, I think we need to review all configura=
tions
> of libvncserver and check which functions should be disabled.
>=20
I think the most important question here is how small of a binary we can ge=
t out of libvncserver, and whether or not we can afford to have an unauthen=
ticated socket open with full control of the host system.

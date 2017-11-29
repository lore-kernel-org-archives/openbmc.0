Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ymjsj1mDjzDrbN
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 12:40:40 +1100 (AEDT)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2017 17:40:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,470,1505804400"; d="scan'208";a="1249711254"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.178])
 by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2017 17:40:35 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>
Cc: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <000001d3641d$3e482120$bad86360$@linux.intel.com>
 <1ABEA804-8141-49CA-AFBF-B47C8D0ABD31@fuzziesquirrel.com>
In-Reply-To: <1ABEA804-8141-49CA-AFBF-B47C8D0ABD31@fuzziesquirrel.com>
Subject: RE: chassis_control.py in skeleton
Date: Wed, 29 Nov 2017 09:40:34 +0800
Message-ID: <000001d368b3$0d4644e0$27d2cea0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQEnWNhYOTmVBHgckrDmAtguUsiWLAGhGP9epHWg/vA=
Content-Language: en-us
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTA5MzY1NDktMzI2MC00MjA3LWIwODktOGVhYWQ1MDlhMTlkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlRsTlNsRnFLdnBZU3c4aExJZmlaRXNJWlgrZzFcL1M5TmF2ZWx0KzU5cUlFPSJ9
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
X-List-Received-Date: Wed, 29 Nov 2017 01:40:43 -0000

Thanks Brad for your message!

I studied on these state-manager services, It seems that the =
chassis_control.py can be replaced by chassis_state and host_state .cpp =
files. I will perform some tests to check if there any changes needed.

I also found that some of .cpp services  still need these apps in =
skeleton. Below is an example, it needs the =
skeleton/op-pwrctl/power_control.obj.c:
https://github.com/openbmc/phosphor-state-manager/blob/master/chassis_sta=
te_manager.cpp#L56

I would like to start to modify/rewrite these buton/power(gpio control =
related) tools in skeleton, using C++ and sdbusplus, and support multi =
platforms(X86). Could you share some comments/suggestions?
Create a new project such as power-button-manager, or add them into this =
phosphor-state-manager?=20

Thanks,
Yong Li

-----Original Message-----
From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]=20
Sent: Wednesday, November 29, 2017 4:53 AM
To: Yong Li <yong.b.li@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Li, Yong B =
<yong.b.li@intel.com>
Subject: Re: chassis_control.py in skeleton


> On Nov 23, 2017, at 12:38 AM, Yong Li <yong.b.li@linux.intel.com> =
wrote:
>=20
> Hi All,
>=20
> Based on my understanding, these chassis control/system manager=20
> related projects in skeleton should be initial/reference code, and=20
> will be

This is correct.  The intent is to remove them eventually.

The replacement for the chassis manager is =
https://github.com/openbmc/phosphor-state-manager

The functions of the system manager have gradually been replicated =
elsewhere.  For instance its state management functions were moved to =
phosphor-state-manager or systemd.  Other functions were distributed =
amongst configuration files and other applications.

They have not been removed from the current systems because they all =
need to be scrubbed for any remaining usage.

> rewritten/reimplementation. I would like to know if there is any plan=20
> or on-going projects on them?

The plan is to scrub the existing systems and eliminate use of these =
programs.  This means identifying any functional gaps in the =
replacements and implementing those.  I don=E2=80=99t think anyone is =
working on that at the moment.

Ideally any new layers/platforms being added would just not use these =
programs, but I understand if that requires replacement function that =
isn=E2=80=99t available and wouldn=E2=80=99t want that to hinder =
upstreaming of a new platform.

If I were to begin to work on this, I would start by building images for =
the current systems, remove these applications from the image and see =
what breaks.=09


>=20
> Thanks,
> Yong Li


-brad=3D

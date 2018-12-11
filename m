Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DpL00nThzDqXd
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 05:26:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2018 10:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,343,1539673200"; d="scan'208";a="302967804"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by fmsmga005.fm.intel.com with ESMTP; 11 Dec 2018 10:26:05 -0800
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 11 Dec 2018 10:26:05 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.59]) by
 ORSMSX155.amr.corp.intel.com ([169.254.7.85]) with mapi id 14.03.0415.000;
 Tue, 11 Dec 2018 10:26:04 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Stewart Smith <stewart@linux.ibm.com>
CC: Emily Shaffer <emilyshaffer@google.com>, Supreeth Venkatesh
 <supreeth.venkatesh@arm.com>, Dong Wei <Dong.Wei@arm.com>, "Naidoo, Nilan"
 <nilan.naidoo@intel.com>, David Thompson <dthompson@mellanox.com>, openbmc
 <openbmc@lists.ozlabs.org>
Subject: Re: Initial MCTP design proposal
Thread-Topic: Initial MCTP design proposal
Thread-Index: AQHUjeMoz/OZMMO9LECq6P2/6Li6c6VzQZoAgADH+QCAABz5AIAFIZ6AgACaAv8=
Date: Tue, 11 Dec 2018 18:26:03 +0000
Message-ID: <AE14EF95-D354-48C6-AB76-95ADF6568951@intel.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <94639b69-3f3c-a606-ae68-f7e1461097e9@linux.vnet.ibm.com>
 <f8fe02f703ab7c11bf5871605364821688266667.camel@arm.com>
 <CAJoAoZkPO+dU9VpzCm3C0y1aEFUS_MXBQsTaD_t=gNZN0JHg6A@mail.gmail.com>,
 <87efaoj244.fsf@linux.vnet.ibm.com>
In-Reply-To: <87efaoj244.fsf@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="Windows-1252"
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
X-List-Received-Date: Tue, 11 Dec 2018 18:26:16 -0000


> On Dec 10, 2018, at 5:15 PM, Stewart Smith <stewart@linux.ibm.com> wrote:
>=20
> If we were going to bring a not-C language into firmware, I'd prefer we
> look at something modern like Rust, that's designed to not have
> programmers marching around with guns pointed at their feet.
> (I have C++ opinions, most of which can be summarised by NAK :)

Rust seems like an interesting language, but when I last evaluated it for B=
MC use while looking at the redfish implementation, it suffered from a few =
killer problems that would prevent its use on a current-generation BMC

1. The binaries are really big.  Just an application with the basics (DBus,=
 sockets, io loop) ends up at several megabytes last time I attempted it.  =
Most of our c++ equivalents consume less than half that.  I know rust as a =
community has worked on the size issue, and is making progress, but given t=
he size constraints that we=92re under, I don=92t think 2MB minimum applica=
tions are worth the space they take.  For reference, the project is working=
 to make it possible to build an image without python to save ~3MB from the=
 final image.
2. Rust is relatively new.  Finding =93seasoned=94 rust developers, especia=
lly ones that have that in combination with embedded skills is difficult.  =
I don=92t believe we have anyone active on the project today that has built=
 rust applications at the scale the OpenBMC project is at these days.  At t=
his point there are a few commercial products that use rust, so at least so=
meone has ripped of that band aid, but I don=92t know if any high reliabili=
ty, embedded products that have taken the plunge yet.  If we want to be the=
 first, we should evaluate what that=92s going to cost for the project.
3. The supposed safety in rust is only guaranteed if you never call into a =
c library or native code.  While there=92s pure rust based equivalents for =
a lot of the things we use, most of our code is stitching together calls be=
tween libraries, and northbound interfaces.  There might be one or two exam=
ples of where we could use rust without any c libraries, but I=92m going to=
 guess there=92s only that .  Given that, are we better off having a given =
application written in one language or two?

In short, I=92m interested to see how the rust ecosystem progresses, and I =
wait with baited breath for something to emerge that=92s better than C/C++,=
 but today, I don=92t think rust applications in OpenBMC would have my supp=
ort.=

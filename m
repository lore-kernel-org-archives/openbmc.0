Return-Path: <marta.mazur@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=marta.mazur@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dD8c4HG1zDqN1
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 00:59:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 07:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,325,1549958400"; d="scan'208";a="334864151"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
 by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2019 07:59:04 -0700
Received: from irsmsx156.ger.corp.intel.com (10.108.20.68) by
 IRSMSX151.ger.corp.intel.com (163.33.192.59) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 15:59:02 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.30]) by
 IRSMSX156.ger.corp.intel.com ([169.254.3.53]) with mapi id 14.03.0415.000;
 Mon, 8 Apr 2019 15:59:02 +0100
From: "Mazur, Marta" <marta.mazur@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: bashisms in meta-phosphor scripts
Thread-Topic: bashisms in meta-phosphor scripts
Thread-Index: AdTIhU2ViXH+UOPAScyXHmtEIdawTgMaIXUABkrapwA=
Date: Mon, 8 Apr 2019 14:59:01 +0000
Message-ID: <57D4E00C36C60342B4DF4D5243A0FFBF4F96955D@IRSMSX103.ger.corp.intel.com>
References: <57D4E00C36C60342B4DF4D5243A0FFBF4F8E41A1@IRSMSX103.ger.corp.intel.com>
 <20190307135822.4l4pxg2hfmpbslep@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190307135822.4l4pxg2hfmpbslep@thinkpad.dyn.fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzVkM2UyZDctNmM2My00NmJkLThiNDUtZjk4ZjNkYmM1NTAwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicGhJMGxDKzBqU1F4bkhcL1FkcWxMb1drU29USU1FY3h5MEorQjQzZGVNT0pSc2VrenU2RzJcL0pWYmc2S2xleDVRIn0=
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [163.33.239.181]
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 08 Apr 2019 14:59:13 -0000

Hi Brad,
Sorry for the delayed response. We plan to start working on this in near fu=
ture. I'll open a github issue as you suggested. =


Thanks,
Marta

-----Original Message-----
From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com] =

Sent: Thursday, March 7, 2019 2:58 PM
To: Mazur, Marta <marta.mazur@intel.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: bashisms in meta-phosphor scripts

On Tue, Feb 19, 2019 at 07:08:00PM +0000, Mazur, Marta wrote:
>Hi all,
>
>We have to cut out bash from our system and use busybox ash as the only sh=
ell. I found several scripts in the meta-phosphor layer that are not POSIX =
compliant and therefore are unusable without bash.
>
>Has anyone run into this problem? Does anyone have plans to remove bash de=
pendencies from this layer?

No plans that I am aware of, but I am in favor of being bash-free.
Thanks!
>
>Or maybe we could patch those scripts and submit the patches to upstream? =
It should increase portability to systems with any POSIX shell.

That would be great!  Do you plan to work on this?  While not required, if =
you open a github issue for it and tag it with a release, we can note that =
this work occurred in the release notes.

You might also consider adding something to the docs/anti-patterns.md for t=
his to really solidify that we want to be POSIX compliant in meta-phosphor.

Thanks!

-brad
--------------------------------------------------------------------

Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek
przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by
others is strictly prohibited.

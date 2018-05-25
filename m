Return-Path: <pawel.rapkiewicz@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=pawel.rapkiewicz@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sdfs4YY3zF1fW
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 17:48:49 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 May 2018 00:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,439,1520924400"; d="scan'208";a="58924756"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2018 00:48:44 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.241]) by
 IRSMSX109.ger.corp.intel.com ([169.254.13.176]) with mapi id 14.03.0319.002;
 Fri, 25 May 2018 08:48:42 +0100
From: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
To: Yugi Mani <yupalani@microsoft.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Request for review: Redfish OEM extensions
Thread-Topic: Request for review: Redfish OEM extensions
Thread-Index: AdPzltrM33ibQy9QQmKXV4lisgoMpAAWBQDwAANemuA=
Date: Fri, 25 May 2018 07:48:42 +0000
Message-ID: <53D123781965AE42A2ABEE982B242E41899FC7E5@IRSMSX106.ger.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E82169933A0BC863@ORSMSX114.amr.corp.intel.com>
 <MWHPR21MB086427F0296C47E1C18BBF6AD6690@MWHPR21MB0864.namprd21.prod.outlook.com>
In-Reply-To: <MWHPR21MB086427F0296C47E1C18BBF6AD6690@MWHPR21MB0864.namprd21.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzViMTJkNjgtYjI2ZS00ZTcxLTk3OTQtMWIzZDZhN2EzMWM4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidTZxWjZLeVZKMTloajBZbDEzSmVhdFNNYmVPM2RlSTdNUitOTDRXNG83VlkybGdmcU9HYVNqeE40bGF5dlwvT3UifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.239.181]
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2018 07:48:54 -0000

Hi,

Here is a correct link to the gerrit review:
https://gerrit.openbmc-project.xyz/#/c/10813/

The one sent by Ed was created since I was not able to commit changes to th=
e official OpenBMC one.

Regards,
Pawel

-----Original Message-----
From: openbmc [mailto:openbmc-bounces+pawel.rapkiewicz=3Dintel.com@lists.oz=
labs.org] On Behalf Of Yugi Mani
Sent: Friday, May 25, 2018 8:12 AM
To: Tanous, Ed <ed.tanous@intel.com>; openbmc@lists.ozlabs.org
Subject: RE: Request for review: Redfish OEM extensions

Ed, =


Is your gerrit server accessible from outside? Browser (chrome) couldn't re=
ach the server's IP address. =


Yugi

-----Original Message-----
From: openbmc <openbmc-bounces+yupalani=3Dmicrosoft.com@lists.ozlabs.org> O=
n Behalf Of Tanous, Ed
Sent: Thursday, May 24, 2018 12:43 PM
To: openbmc@lists.ozlabs.org
Subject: Request for review: Redfish OEM extensions

The document we discussed last week in the Redfish call is open for review =
and comment.  It attempts to propose a solution to the "How do I extend red=
fish in OpenBMC?"  Pawel would very much appreciate comments a broader audi=
ence.

https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit-amr-=
2.devtools.intel.com%2Fgerrit%2F%23%2Fc%2F130414%2F&data=3D02%7C01%7Cyupala=
ni%40microsoft.com%7C6a04083be7ff41e398fe08d5c1aee6b9%7C72f988bf86f141af91a=
b2d7cd011db47%7C1%7C0%7C636627879299887599&sdata=3DN9%2FJlO36maY7cI0yexYHlO=
dh3Hm%2BfDQo2Ezu3BsT%2Fgg%3D&reserved=3D0

Along with looking at the review, if anyone has input on any of the followi=
ng, we'd love to hear about it.
1. Requirements for redfish OEM extensions in OpenBmc 2. Specific use cases=
 that aren't covered by OpenBMC today (for example, uploading an ssl certif=
icate) 3. Performance concerns and extension concerns 4. Requests for schem=
a support not already in review

Thanks,

-Ed
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

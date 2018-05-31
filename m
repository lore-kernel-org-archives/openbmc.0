Return-Path: <mkbrown32@hotmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.0.106; helo=nam01-bn3-obe.outbound.protection.outlook.com;
 envelope-from=mkbrown32@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="WDtt6IHD"; 
 dkim-atps=neutral
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092000106.outbound.protection.outlook.com [40.92.0.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xZR24j6mzDrbk
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 03:37:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WajABRh8p5HFiwUFbpqG9f01XdEvRBaKyKV/GdtBqzw=;
 b=WDtt6IHDAPlMRDCmsPEhf+uA8bWujyeBTRrtY+6dXojFHi+Ro67Efb3hv/hWU73G4HmAbld3uq0WFjnUEp6ivqredTES97u1jQvtAjjK7KQfGnT5f+lsn6kMEq+zrhQkjGVVlTrpfHSZ6uicWDMHwD6RDPM0bbbpSkdMPcR2oqoHFcMlh6U/hY0OPZGRuJE9LA327XWK7W6U5B1P6lTvL3opPcgYNbZ8nYJ3/Flqij6dNGLMrSsSWru8TlO5ntgzC40Vw9jXeFB/Wgo0jB3Q35/gOUKTP9AHjTS14Rbivuu7b3q5ywJK5kwQtwD+3fTgUyVyvaBAGtvbueXDsYXRSw==
Received: from BN3NAM01FT061.eop-nam01.prod.protection.outlook.com
 (10.152.66.51) by BN3NAM01HT162.eop-nam01.prod.protection.outlook.com
 (10.152.66.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.20.820.8; Thu, 31
 May 2018 17:36:44 +0000
Received: from MWHPR02MB2320.namprd02.prod.outlook.com (10.152.66.54) by
 BN3NAM01FT061.mail.protection.outlook.com (10.152.66.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.20.820.8 via Frontend Transport; Thu, 31 May 2018 17:36:44 +0000
Received: from MWHPR02MB2320.namprd02.prod.outlook.com
 ([fe80::65c6:2abe:3b49:9542]) by MWHPR02MB2320.namprd02.prod.outlook.com
 ([fe80::65c6:2abe:3b49:9542%14]) with mapi id 15.20.0797.017; Thu, 31 May
 2018 17:36:44 +0000
From: Mark Brown <mkbrown32@hotmail.com>
To: "Lakesh.Sharma@dell.com" <Lakesh.Sharma@dell.com>, "mine260309@gmail.com"
 <mine260309@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: openbmc build err "internal compiler error'
Thread-Topic: openbmc build err "internal compiler error'
Thread-Index: AdPzf/BfFD8XbX/RS/y0bRg59wQL0QASZekAAU4/PQAAAMrqhA==
Date: Thu, 31 May 2018 17:36:43 +0000
Message-ID: <MWHPR02MB2320468019D310BACB2B3E7AAE630@MWHPR02MB2320.namprd02.prod.outlook.com>
References: <90852837c20b4169a7d4d66efaca7399@ausx13mpc109.AMER.DELL.COM>
 <CAARXrtmp_MdKe44q-dgMyO-P=FQRWH5JQ7zMVWVZSj=_HGykmQ@mail.gmail.com>,
 <0928cde3464f4377be4f58f114486543@ausx13mpc113.AMER.DELL.COM>
In-Reply-To: <0928cde3464f4377be4f58f114486543@ausx13mpc113.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A77AFC5F9C527236F4C431ED21AB8796ADCD8A8A19256DFF151A4689E10CE59E;
 UpperCasedChecksum:572ECF5588840F30F56AED1DAB6B07A51D0E6B0DC3E5D1068417F3FB2BDFDDB7;
 SizeAsReceived:7444; Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [z1yWuYkkIp3NzTN+z6vi0jiVm3rUNVLF9+bR4VvmYyp9QWUKp06p+LC29L8Lpgsm/cUlAkioQds=]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN3NAM01HT162;
 7:qJXRfhStPuH3k4/xnTimJfnB0YLs7TLGhtzO4lY2gdk/AWvWO00dq5Y+pqZ6Xsq9Lwoa7gjerY+IW31Xgkhy8v7SzQCrFo1si2jOQv8977QBdYSEn73hrulBn7J5MvJMzPPgausDTAhQRX8O8/tK8gKFdW38WZL3FRxJs0KX+W9LOCMghcAk0JmAd9Trrli0/Hdu24rMPBsHTjQEu3yYxvorz1bVOtzf3ME3yFuo9QBcnJp0WmlvZdfPIBm27GuE
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1603101448)(1601125466)(1701031045);
 SRVR:BN3NAM01HT162; 
x-ms-traffictypediagnostic: BN3NAM01HT162:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(444000031);
 SRVR:BN3NAM01HT162; BCL:0; PCL:0; RULEID:; SRVR:BN3NAM01HT162; 
x-forefront-prvs: 06891E23FB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(7070007)(199004)(13464003)(189003)(8666007)(20460500001)(87572001)(102836004)(2900100001)(5660300001)(305945005)(68736007)(110136005)(81156014)(76176011)(53546011)(6506007)(8936002)(6346003)(83332001)(11346002)(476003)(3660700001)(486006)(3280700002)(5250100002)(8676002)(59450400001)(2501003)(25786009)(97736004)(106356001)(446003)(105586002)(4326008)(39060400002)(6246003)(99286004)(55016002)(14454004)(7696005)(229853002)(104016004)(33656002)(73972006)(74316002)(82202002)(6436002)(9686003)(46003)(86362001)(15852004);
 DIR:OUT; SFP:1901; SCL:1; SRVR:BN3NAM01HT162;
 H:MWHPR02MB2320.namprd02.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:; 
received-spf: None (protection.outlook.com: hotmail.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mkbrown32@hotmail.com; 
x-microsoft-antispam-message-info: lH65SqFkcusjsQF82bVIhg+dnLZbV3NgZH07czgMQW9NwRF2DfzQJR5lH2/B6JQf6lgihfhyGQG78IMEJCr5eU0LpPN/cpFOEtZqIdC+7BLop19rGPLHxGHADCG1KdqQqL0Feyfyfx27w1eCylSmB+VnmDHJvaOvtbo++fvWuf16acSHy9oVToFUsgBhDuEK
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 40388731-6f29-42c5-94d8-08d5c71d13ae
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-Network-Message-Id: 40388731-6f29-42c5-94d8-08d5c71d13ae
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2018 17:36:44.0043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM01HT162
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
X-List-Received-Date: Thu, 31 May 2018 17:37:20 -0000

What was the earlier VM Memory size and what is the current VM Memory size =
?

________________________________________
From: openbmc <openbmc-bounces+mkbrown32=3Dhotmail.com@lists.ozlabs.org> on=
 behalf of Lakesh.Sharma@dell.com <Lakesh.Sharma@dell.com>
Sent: Thursday, May 31, 2018 10:12 AM
To: mine260309@gmail.com
Cc: openbmc@lists.ozlabs.org
Subject: RE: openbmc build err "internal compiler error'


Thanks, I increased the memory of VM, and after that it seems to progress o=
k. I see  zImage, fitImage and few other binaries in images folder.
However I also saw following err message in build log. Could it be due uboo=
t archive was not available or it could not download it ?
Should I attempt rebuild, and if see same err then probably put uboot archi=
ve manually in build/download, if so which ver ?

| dd: failed to open ?/home/lsharma/open_bmc_evb/ws/openbmc/build/tmp/deplo=
y/images/evb-ast2500/u-boot.bin?: No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_generate_static (log file is located at /home/=
lsharma/open_bmc_evb/ws/openbmc/build/tmp/work/evb_ast2500-openbmc-linux-gn=
ueabi/obmc-phosphor-image/1.0-r0/temp/log.do_generate_static.29415)
ERROR: Task (/home/lsharma/open_bmc_evb/ws/openbmc/meta-phosphor/common/rec=
ipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static) failed with=
 exit code '1'
NOTE: Tasks Summary: Attempted 3396 tasks of which 2082 didn't need to be r=
erun and 1 failed.

Summary: 1 task failed:
  /home/lsharma/open_bmc_evb/ws/openbmc/meta-phosphor/common/recipes-phosph=
or/images/obmc-phosphor-image.bb:do_generate_static
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


-----Original Message-----
From: Lei YU [mailto:mine260309@gmail.com]
Sent: Thursday, May 24, 2018 6:42 PM
To: Sharma, Lakesh
Cc: OpenBMC Maillist
Subject: Re: openbmc build err "internal compiler error'

On Fri, May 25, 2018 at 12:55 AM,  <Lakesh.Sharma@dell.com> wrote:
> I am seeing following build err.
>
> =93arm-openbmc-linux-gnueabi-g++: internal compiler error: Killed
> (program cc1plus)=94
>

I guess g++ is killed due to using too much memory, maybe you can check you=
r system log to see if there is any oom.
It is known issue that building phosphor-host-ipmid (more precisely, the ge=
nerated sensor-gen.cpp) consumes too much memory.

Possibly increase the RAM for your VM, e.g. my 16GiB VM is fine.

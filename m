Return-Path: <mkbrown32@hotmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.0.10; helo=nam01-bn3-obe.outbound.protection.outlook.com;
 envelope-from=mkbrown32@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="e50dkwjN"; 
 dkim-atps=neutral
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092000010.outbound.protection.outlook.com [40.92.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RS9M734GzF21W
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 15:24:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=s13tz/DCryFQvBKPMeEr4Wrcw5QGvrWam6oTlOMnP6I=;
 b=e50dkwjNfxJTWlIxORmYp61FimaKm/il6hOL3i7Gmn+PZHQL+UWfNFa5Mhi/BoLterRy/jLUjVHghaJrFofe/C+d/6TMiKr1jD1qEdDr0Aw5rhkfVWS+50R8brY3G6vzg5vF5Ve5zF1QlTg5OwqbRfF17RdmIZNWB5pFvT2c7iE66xKh2kDE4nFqgp/Zf+ks6ncrxYWMTV6Y0g01zLSYsXoe+k9TzzbNwSfHDL2WEhBjtcQo0fot+XiG3MoX30fYufw1NP21tMFzs/ZsmzTck0Kfi19TNHdWqtKhVy6tQwMlDNRdBErA8fh1VSGEV+BiMcsyjYQKJ1KgbrCTDrMuiA==
Received: from BN3NAM01FT028.eop-nam01.prod.protection.outlook.com
 (10.152.66.56) by BN3NAM01HT200.eop-nam01.prod.protection.outlook.com
 (10.152.66.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.675.14; Thu, 19
 Apr 2018 05:24:49 +0000
Received: from BY2PR02MB1330.namprd02.prod.outlook.com (10.152.66.56) by
 BN3NAM01FT028.mail.protection.outlook.com (10.152.67.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.675.14 via Frontend Transport; Thu, 19 Apr 2018 05:24:49 +0000
Received: from BY2PR02MB1330.namprd02.prod.outlook.com
 ([fe80::4471:ff0c:38cc:55fa]) by BY2PR02MB1330.namprd02.prod.outlook.com
 ([fe80::4471:ff0c:38cc:55fa%9]) with mapi id 15.20.0696.013; Thu, 19 Apr 2018
 05:24:49 +0000
From: Mark Brown <mkbrown32@hotmail.com>
To: Lei YU <mine260309@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Thread-Topic: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Thread-Index: AQHT05RPMBfvkwn4bEqBfGfPCQgvYKQHjtWAgAAEb6s=
Date: Thu, 19 Apr 2018 05:24:49 +0000
Message-ID: <BY2PR02MB1330876176E682C90130B503AEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
References: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>,
 <CAARXrtmD2-BDutebA2ahwzf+LQ2J-BuAUKHBzudR-LW3Jmwaog@mail.gmail.com>
In-Reply-To: <CAARXrtmD2-BDutebA2ahwzf+LQ2J-BuAUKHBzudR-LW3Jmwaog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:CC3F586A81B4CE768A3A204172BCA6320CB07A68BE7D610DD88E7FD846DEE19B;
 UpperCasedChecksum:3742E625B74879E3BF02058A8C40BEE2C6EFF92A6987E3C196E5A94DC9140894;
 SizeAsReceived:7330; Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Vcw9cXbZXwB7nqE4Xt3cYnZFayuRUQs7rTV56q6Fbg8i7JdsSBIF/1fY8sOfi8CU]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN3NAM01HT200;
 7:zIwAa8H5y7MxB92Au6tpHr4z43DFiRQLZare2Zk61h89q+wmF7krsGaxEhQDchWVti7Xsw+KXVikEzrm4vYteQIHvIQmk6zcX5N5aCAyoKNotWQ8bZvNNUOz4L6xlLGFtWNtzcSM6d+jwGyUnskXFTLXnSEzkhZV59T1yyLF1wvqtOyl/bI5TEaF/0kZ8DZkjNUNf2jVI9NcP8Y+Xwn4pnvf8P5wk/cUa4ZT9Puz4jdumoAuioPYPlfIz32q0svh
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1601125374)(1603101448)(1701031045);
 SRVR:BN3NAM01HT200; 
x-ms-traffictypediagnostic: BN3NAM01HT200:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(444000031);
 SRVR:BN3NAM01HT200; BCL:0; PCL:0; RULEID:; SRVR:BN3NAM01HT200; 
x-forefront-prvs: 0647963F84
x-forefront-antispam-report: SFV:NSPM; SFS:(7070007)(98901004); DIR:OUT;
 SFP:1901; SCL:1; SRVR:BN3NAM01HT200; H:BY2PR02MB1330.namprd02.prod.outlook.com;
 FPR:; SPF:None; LANG:; 
x-microsoft-antispam-message-info: V6ugYbT6Ju8A21KeYb5v1KsHmt5zuzCwBgs+aatxYGXMnzcgZuj6bRCq1NF2JrsDTmSG86zqc/6iDkifH+eG7GsSXqC1Z6GgTtjqJVN4kbjinXrmO3WPovj9U/pGyieKikGHrgW+/w0XLHn8AMUQEooz6V4vEXi3dV5xs7GlFND530atunFaIjAoibjc48BS
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 9ad910b5-5d75-49a9-8e03-08d5a5b5df47
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad910b5-5d75-49a9-8e03-08d5a5b5df47
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2018 05:24:49.5414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM01HT200
X-Mailman-Approved-At: Thu, 19 Apr 2018 16:00:57 +1000
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
X-List-Received-Date: Thu, 19 Apr 2018 05:24:57 -0000

In my Ubuntu 16.04.4, I used Vboxmanage to increase to 40GB (33GB sda1),=20
which was not enough,
so I doubled it to 80GB (73GB sda1) and=20
then it ran through approximately 3,000 of the 4,000 tasks,
then had an Error "/bin/sh"..."not found"..."quilt".
whereis shows that "quilt" is installed, so this makes no sense.
I am running Ubuntu 16.04.4, not 14.04 .
Any ideas ?

________________________________________
From: Lei YU <mine260309@gmail.com>
Sent: Wednesday, April 18, 2018 9:58 PM
To: Mark Brown
Cc: openbmc@lists.ozlabs.org
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build

On Sat, Apr 14, 2018 at 10:10 AM, Mark Brown <mkbrown32@hotmail.com> wrote:
> I do not see anywhere in your documentation information on
> how much storage should be allocated to the
> /Windows 7 64/VirtualBox/Ubuntu 16.04 .vdi.
> Also, do you know if it is possible to increase the storage of the Ubuntu=
 .vdi
> or does the user have to start over again, creating the .vdi ?

You can create a new volume, attach and format it, then you have extra spac=
e.
E.g. I have ubuntu.vdi as the system storage, and extra.vdi mounted at /ext=
ra
to put the large data.

>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> Virtualbox reports  Virtual Size: 10.00 GB    Actual Size: 8.12 GB .
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> meta-palmetto        =3D "master:acff95b917b051a71ca3979793cccfff724a5821=
"
> Initialising tasks: 100% |###############################################=
####################################| Time: 0:00:31
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: The free space of /home/mark/openbmc/build/sstate-cache (/dev/sd=
a1) is running low (0.972GB left)
> ERROR: No new tasks can be executed since the disk space monitor action i=
s "STOPTASKS"!
> WARNING: The free space of /home/mark/openbmc/build/tmp (/dev/sda1) is ru=
nning low (0.972GB left)
> ERROR: No new tasks can be executed since the disk space monitor action i=
s "STOPTASKS"!
> WARNING: The free space of /home/mark/openbmc/build/downloads (/dev/sda1)=
 is running low (0.972GB left)
> ERROR: No new tasks can be executed since the disk space monitor action i=
s "STOPTASKS"!
> NOTE: Tasks Summary: Attempted 102 tasks of which 0 didn't need to be rer=
un and all succeeded.
> Summary: There were 3 WARNING messages shown.
> Summary: There were 3 ERROR messages shown, returning a non-zero exit cod=
e.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Mark Brown

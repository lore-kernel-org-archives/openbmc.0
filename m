Return-Path: <mkbrown32@hotmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.11.51; helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=mkbrown32@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="gvPAoQe3"; 
 dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092011051.outbound.protection.outlook.com [40.92.11.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40V7sK6gzwzF24D
 for <openbmc@lists.ozlabs.org>; Tue, 24 Apr 2018 00:20:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3sfV7rFGZS8BXNn8Q8jaoZtyxeZ3OintuRcwW+/hJBk=;
 b=gvPAoQe3mnCPmMdiibjNDP5W5SSJUuplu7UTU7UF+jrV08iZoZ2gUfbTwTCdXwGpDpuyx9TkOJ0jwmtDLOyetHzBqEqAjpHS9wxZvcNWawgVci1eYlnrhqBu2TEgx2Ks0J/9pH4VFY3FQ5idbKfoXv+MS+/7NI2/MMXMk1gdKusWY0pNNARw/OlZ7xGKFSKeqeUxUjhlKrrEAUMXaGdKB5wlzjHoasnQka22V4guaWXetBMrm8kIuDRZb/YBzSMh2nKUuP5LJK5TiSYFXVHR8G5WPZfC8/Ilk875FAMujB1KFtwydy1jvmOG1rDBrq1sJf/6Fav8LiM64MgthMedeQ==
Received: from SN1NAM04FT046.eop-NAM04.prod.protection.outlook.com
 (10.152.88.51) by SN1NAM04HT008.eop-NAM04.prod.protection.outlook.com
 (10.152.88.138) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.20.696.11; Mon, 23
 Apr 2018 14:20:14 +0000
Received: from BY2PR02MB1330.namprd02.prod.outlook.com (10.152.88.51) by
 SN1NAM04FT046.mail.protection.outlook.com (10.152.89.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.20.696.11 via Frontend Transport; Mon, 23 Apr 2018 14:20:14 +0000
Received: from BY2PR02MB1330.namprd02.prod.outlook.com
 ([fe80::4471:ff0c:38cc:55fa]) by BY2PR02MB1330.namprd02.prod.outlook.com
 ([fe80::4471:ff0c:38cc:55fa%9]) with mapi id 15.20.0696.013; Mon, 23 Apr 2018
 14:20:13 +0000
From: Mark Brown <mkbrown32@hotmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, Lei YU <mine260309@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Thread-Topic: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Thread-Index: AQHT05RPMBfvkwn4bEqBfGfPCQgvYKQHjtWAgAAEb6uAAA8cAIAEF9GhgAHanACAAN4jTw==
Date: Mon, 23 Apr 2018 14:20:13 +0000
Message-ID: <BY2PR02MB1330F06CDBE6D6F4D032E829AE890@BY2PR02MB1330.namprd02.prod.outlook.com>
References: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>
 <CAARXrtmD2-BDutebA2ahwzf+LQ2J-BuAUKHBzudR-LW3Jmwaog@mail.gmail.com>
 <BY2PR02MB1330876176E682C90130B503AEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
 <1524118080.2476417.1343258432.7A83D343@webmail.messagingengine.com>
 <BY2PR02MB133046D3DBACC3E265285909AE8B0@BY2PR02MB1330.namprd02.prod.outlook.com>,
 <1524445018.4090665.1346967888.78991B5B@webmail.messagingengine.com>
In-Reply-To: <1524445018.4090665.1346967888.78991B5B@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:053B7749C5AA44CFB718C4C01EDAF4866217D6BD88A7EA1FE92914F0B9DC292B;
 UpperCasedChecksum:DCA53625EDDBC561C3E7E368E7BF106AEC0E83A78911F616E1AC3B2A4DE2789E;
 SizeAsReceived:7707; Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [lUKY6cqntF605CJh+a3qRhx69yRq/RWdUZ21emEyxXsw97Wsct3sFpr3jjAd3NR4WHf8jFiq9Jk=]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN1NAM04HT008;
 7:1Fxe5zTaMfQNa6vvJZR4vh3lLy8oGey1VXjWSSHeNs1RDH8g1rojDEuyv9ApH6JRf34MkzJZQ0EIpY+H6Fi4lFt7jvqibcYJbEBQV+3dMA2KPnhTPegl8J4lt9S/TPQyE9ACyph6SNs17XibDwq9KGEJ24l/dKJfTLuTpzw1WfCsjZz2jaOvxC3jFzRZf9c5duW0cwphngRX8pl8CP0mSjpEHV65sdRbivx4s43NeLLnJwTKsMXR5zH3yEihNjfg
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1603101448)(1601125374)(1701031045);
 SRVR:SN1NAM04HT008; 
x-ms-traffictypediagnostic: SN1NAM04HT008:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(444000031);
 SRVR:SN1NAM04HT008; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM04HT008; 
x-forefront-prvs: 06515DA04B
x-forefront-antispam-report: SFV:NSPM; SFS:(7070007)(98901004); DIR:OUT;
 SFP:1901; SCL:1; SRVR:SN1NAM04HT008; H:BY2PR02MB1330.namprd02.prod.outlook.com;
 FPR:; SPF:None; LANG:; 
x-microsoft-antispam-message-info: 3CZbmSuliM0fo12Q6JsB/9btQAVtHzgkIF76LSJOABc5Qwo8zILWuI6d+IBOENtrPYtZDCd9eveUSdxx02X45e2xnuOLGKGLJx7NCCAXUJN6+wVx/H5RDGOFkJ1mo09w0H66e9owOAPKdf9mnky0NWyWRH6LDZDK09ydKpQ2HCK9/HflBCk6U3iYo/91Pb7Z
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: bbe598be-04ae-4eae-c22e-08d5a9255487
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe598be-04ae-4eae-c22e-08d5a9255487
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2018 14:20:13.8809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM04HT008
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
X-List-Received-Date: Mon, 23 Apr 2018 14:20:29 -0000


________________________________________
From: Andrew Jeffery <andrew@aj.id.au>
Sent: Sunday, April 22, 2018 5:56 PM
To: Mark Brown; Lei YU
Cc: openbmc@lists.ozlabs.org
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build

On Sun, 22 Apr 2018, at 06:22, Mark Brown wrote:
> Still have not generated a clean build yet,
> in the //Windows 10//Virtualbox//Ubuntu 16.04.4// world.
>
> I have enclosed a log of the several Warnings and then the final Error,
> for someone to point out what might be wrong here.
> I turned on line numbering in my text editor and it says
> there are 630 lines in this file, so optimal commentary
> should be addressed to particular line numbers.
> Thanks.
>
---------------------------------------------------------------------------=
-------------------------------------------------

| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_generate_static
| 32768+0 records in
| 32768+0 records out
| 33554432 bytes (34 MB, 32 MiB) copied, 0.173358 s, 194 MB/s
| dd: failed to open '/home/mark/openbmc/build/tmp/deploy/images/palmetto/u=
-boot.bin': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_generate_static (log file is located at /home/=
mark/openbmc/build/tmp/work/palmetto-openbmc-linux-gnueabi/obmc-phosphor-im=
age/1.0-r0/temp/log.do_generate_static.23730)
ERROR: Task (/home/mark/openbmc/meta-phosphor/common/recipes-phosphor/image=
s/obmc-phosphor-image.bb:do_generate_static) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3966 tasks of which 18 didn't need to be rer=
un and 1 failed.

So there's a bug in the image preparation, it could be a race condition or =
something more fundamental. Please open an issue against openbmc/openbmc wi=
th the log you attached and the other referenced logs  (e.g.  /home/mark/op=
enbmc/build/tmp/work/palmetto-openbmc-linux-gnueabi/obmc-phosphor-image/1.0=
-r0/temp/log.do_generate_static.23730). We'll continue the discussion there=
 - it seems you've got the process right and so the issue tracker is a more=
 appropriate place to resolve this than the mailing list.

Finally if you could link to the issue in a reply here that would close the=
 loop nicely.

Cheers,

Andrew

---------------------------------------------------------------------------=
---------------------------------------

What I want to know is whether it is the //Windows 10//Virtualbox//Ubuntu_1=
6.04.4//
configuration which is contributing to these  warnings/error  or  do these =
warnings/error
occur when you perform builds on a   dedicated Ubuntu (14.04) system ?
Also, where are the Aspeed AST2400/AST2500 PDFs for download ?

Mark
---------------------------------------------------------------------------=
----------------------------------------

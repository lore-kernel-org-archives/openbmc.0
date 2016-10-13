Return-Path: <arjun.padmanabhan@microsemi.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam01on0055.outbound.protection.outlook.com [104.47.32.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svrd76STCzDt0J
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 00:08:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b=mni6q+1t; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=I5JKl5xKv9xTM2wwh4DdpJz113FrUeF1DanwJZEKKkQ=;
 b=mni6q+1tvfROey/nZV/Q53A8jTR3TcCj74dba5yLibIGt1MQUjgtTNx7aGNMYefWrDvC+H7y0WvnhI6sXRDkSm9Rcqp0flZbhAvAiJaDj+FJcZHy6L2eOtCpMTw2wfyag3yVHtrf/CQQFf5ilLGwLFFb3t7IpYtFQJoLGO76LOs=
Received: from BLUPR02CA026.namprd02.prod.outlook.com (10.160.23.144) by
 CY1PR02MB1232.namprd02.prod.outlook.com (10.163.16.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.649.16; Thu, 13 Oct 2016 13:08:05 +0000
Received: from BN1AFFO11FD041.protection.gbl (2a01:111:f400:7c10::152) by
 BLUPR02CA026.outlook.office365.com (2a01:111:e400:8ad::16) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.659.11 via
 Frontend Transport; Thu, 13 Oct 2016 13:08:04 +0000
Authentication-Results: spf=none (sender IP is 208.19.100.20)
 smtp.mailfrom=microsemi.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=microsemi.com;
Received-SPF: None (protection.outlook.com: microsemi.com does not designate
 permitted sender hosts)
Received: from avsrvexchhts2.microsemi.net (208.19.100.20) by
 BN1AFFO11FD041.mail.protection.outlook.com (10.58.52.252) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.1.629.5 via Frontend Transport; Thu, 13 Oct 2016 13:08:04 +0000
Received: from AVSRVEXCHMBX2.microsemi.net ([fe80::a552:1d60:6960:9da4]) by
 avsrvexchhts2.microsemi.net ([::1]) with mapi id 14.03.0301.000; Thu, 13 Oct
 2016 06:07:31 -0700
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: [openbmc] Adding new recipe qa error
Thread-Topic: [openbmc] Adding new recipe qa error
Thread-Index: AdIlUZHsLfG+MoINTl2KA7QqFTZrMg==
Date: Thu, 13 Oct 2016 13:07:30 +0000
Message-ID: <C160D2872FE0DE4683E1910F9BF829414846E409@avsrvexchmbx2.microsemi.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.34.10]
Content-Type: multipart/alternative;
 boundary="_000_C160D2872FE0DE4683E1910F9BF829414846E409avsrvexchmbx2mi_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:208.19.100.20; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(199003)(189002)(55846006)(101416001)(68736007)(16236675004)(102836003)(6116002)(3846002)(33656002)(790700001)(86362001)(586003)(71926001)(7846002)(626004)(260700001)(19625215002)(512954002)(356003)(7736002)(2920100001)(450100001)(97736004)(107886002)(2930100002)(19580395003)(2900100001)(11100500001)(69596002)(81156014)(1730700003)(81166006)(19300405004)(189998001)(5660300001)(7696004)(15975445007)(104016004)(110136003)(8676002)(4001430100002)(105586002)(92566002)(6916009)(106466001)(8936002)(2906002)(4326007)(50986999)(54356999)(53416004)(87936001)(2351001)(84326002)(9326002)(229853001)(9686002)(5250100002)(49446005)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1232; H:avsrvexchhts2.microsemi.net;
 FPR:; SPF:None; PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD041;
 1:YSjnl0Flf/Jg5eTXM3iBkEjMaJFQoM5LnA1IymXgNk9OXLj16UCcmN32CImabscXv9m5TtNua1CVrTnBj8mns6bnN822apOMGnHSXZDQRP3HHvUF0bZyy73dYrN4XNj4zpNdC9vQAaZlS6yQJZnacAD1zV6d/6+cMCiIpIXLpZYk1EOBqku8Gka51ENik4Sasb9EhYAEIyZQIJoocrdB869K5Jz8cUKCuMfA5edvlGnMdtCP1CPZMG1aCDO55/J3tB1eJl0zuM8f+ekcj6sjsojNy+32Dqq/uQa5UunPAc4AcI54e2/+ITaJWbZ6E3wiuVQEGSf25Uk/CFr4mtiDHh7w4o2Evts7QPeVfvYcUDVxFgD8AG6uTm9ollz7F5JkIALj+TUYES/Ik94UV2fIWD995DuqizA5+tTBTEcg/hNkAlO/PtNPVBpjkJTFwzZUmbdTj1jFThFyYuHx4AKmO7xI44JT0ppxRHn2RyXPwCbDYSgWdnLRVX6jj13hyv0ZaaZehBPNDqpTPMnEtLECxQ==
X-MS-Office365-Filtering-Correlation-Id: b87b1bdd-2992-4d81-825e-08d3f369f7ce
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1232;
 2:EthYYwZNZZ2ouPNGzqGafh4Kdi7xZunwqKpmvF7ChaRLwHfldFu06bmr5EsaPFxT3EMIoB+GLZi4kNhUEq9kTvyihKVaSH8BRxaLYNGPoYA73N50jkcnwoT6GYIRdEuo087F16dyzvPJaiFOGU1uyDiyom06ZBP94XavCMCDqsgHdszB1kfIx8kIQPBV/bi81CrExeqSyfFy6s4eb2shMQ==;
 3:ye9qmGbfVbQ+ATPGmSjSuzDdNuE3pmJj1AqWbKcAakwfm9O4t02LOC9gcmk/peR8BkgO/1j3A2m67zvMYcosR1T7/ajGoUfWAa3yBW7cKr4yq36mYEU01Upc7VAkOoxrJ6bgAYZxqZdUFTddppo0xGCbnQZiz/0of780yY84jxyrnno+0W/vQ/3W3mgezkC1ZBUav2ddqbgEGCnGC6TMbEqdxx8nHgyKCWS2QE4lzpScs1SjjLgz1hGLMfp3qZ0M;
 25:wr/avjYY31Ggwhx95o9ROYOewBJJMUeThBwnhUe+QE1LMh+RHnn2nxVXx4ol3qjxT19GskGfMMcOPqtwYhdlbcG9kDIRfOPTD0/d/ICoCacs1uNlwTDnb0DB2MUGt5R771ZnOmLLTQDrE3IntMOdRUkKGodbJhDxPei4WGMeYJWgBnc3pno8H1keLYoSYh8A2818UwHdavYbDSOnHIQhKDECF2TEv40Gb0e8E8m/TuA8i4Y467z1gM5x4+tDmlzntbxts2Dqy7+oJtZar9w/ZXONofs3QGWxN0LGistsAKEWfwbduenDcv8t8yv9CzNsvgQy07aOz6SDncP1C+EAGQEchceXyGOjngnGnz/ug8GyC9UpDkb6phuwrbvrse79VY3pAFKFK86ix342rWn5FWxgi/TUvF9gvYg6N+lUA5wSMVMeNmYlvGM9RN8ol0jA
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR02MB1232;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1232;
 31:reh3lqiPa06aYpmRA+xXHNsGfGfAsFgWzMD3Ea+7bMZEDCXe2jqTYGChOQ2k0scXC+mBnKfVPX5Ooq1TMhUhnqiYWlSRdc5icC0ToTv8EQCmzVmXFucFjP0IIkn555vdTF+HK8csMSikE0JYKEVHZSSMlLj9KCG7naj5LkS5hmWB9sUF9BJOt3CdHZvR6EbhgTH8kMyjj1dxo5KTeBvClh07dtn551GJeBkLyCWV5lXwcmZPopz1NKulx8PMQTOj;
 20:YTcpIQdZMsht8+UJMDeBktA/JarITs37+OQEEEkgcHZxrknroZvMjZo3L5rNkXi/iIfI39Rrm1CpbcDW74z8Qiqw6HzRZJ04TqXmSmE5EruMhTOrX7TmAIbHW/VE8KkYAmjTFmaCVl+SHnbKvvvYPP/+cBXQhx9gKmj9bVS8zlBjDg+6Hzk0MBC/sK0cvrznpV6Kaj3mq4tmaZCzZ9OVqyg9xT6+vc2vJjL9+10HpVgBockWUhmIJpOEfi3SCDK01Jc5Vz4KwPKW1WnCnz+47VB+lGjRNKtQBuvMVSlAp+0WlgzqgaCjAl5UDwxSmOkeDfrPpz7ehCfyxsFJzk8zK1u4sEV/9HKEvEsZS1exqFHb8s9t7D80zzZcJvFyd3uP4SccOhIONlPGTwwtrP1a05owd4x+a2sNy1JgV0TRnnq5sPuhFdWQfuF25/5kRh3hXCj6FQKjWcphDzxSGFEdd6fs6u72rKJwrhqnkhpqtLsGUsPuA/MfZyRHZbhfsuAz
X-Microsoft-Antispam-PRVS: <CY1PR02MB12323CCF43B35CABB1D8F199E2DC0@CY1PR02MB1232.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(21748063052155);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040176)(601004)(2401047)(13016025)(13024025)(13023025)(13018025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
 SRVR:CY1PR02MB1232; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1232; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1232;
 4:mOWgiX0Axqr9u6LtZBKzavBr/vU5YqGpKiu+wNb5X23F3aGhOQCojZGHSfgHiHHw+WGNBCVPRlVxhZIBrCKnL1mhSzYqsfqEPyHnDYo0r0YV93mJLrm9yZKlSwyP0/09xqnipYPYh7n4d4+YdieD9+FFFbmJY4QNI1Tv1pvfzZWCvCjkB9iqIgkrtHVLpumT7i1EGE7UOzVs3rjQWh9LCTF3hJoLiN9Cgo0NO+AL12KNlU9v41+217UOEH0BQAoJwV+DKuqLyf4k4AmTdI0zf5zWJANjV2EKeoIY0uJIbvdzhNz5eIXw5p47jq+uCGhadeOFVXBTEzZJEbpAd/afX90qTrEbAtsDzGoRMXQCdDtiYCnX29hG4Q37hNbr02CQ3frs9KUnIlKj9AYwBjof8iZKp5wWm9tsMvlVN6KUGZAP6GvMpNGADiitoY/8WiX9x2uKcr40Oj1AYcNoXDAjn4k7qgG4AptF5+SJcaRp1hDnvhsHk8PNkHV20wSKQJm7HsnpafZ8sd5/hQP2RC5d1n6si+xNKq2zO7zpNcboLFY=
X-Forefront-PRVS: 0094E3478A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1232;
 23:0FWTGK+syZoIpZd9d/J3n0FFgqNRQuMnty2/r4mc+?=
 =?us-ascii?Q?qs2xXDfYz5CQ0B1PX/3U5AOXvgnUHmb+YlAoGstVEjlTt3qg9DpsrhIfhx7b?=
 =?us-ascii?Q?o5s9Ijf+r9pPT+IrOLffm7d0q1wwfsSLx3Bna6x40ltpoADKmVcWZTnq5/XQ?=
 =?us-ascii?Q?5l0UmoZpT/Tl55VsBxITeVHSSDjY0CXaj4OwzySg4yuxU/6etLgn6UGx99ge?=
 =?us-ascii?Q?bJmQbyocX4xgSFP2w6JcB6RIa3xNQLEUVwAFyj77Qt5A0PHzqeH+UrSwipCy?=
 =?us-ascii?Q?4U8BBR4PDvGLEA81cc2jKvwVnTpRJtVpGPiO3OhJ5Botwub2aBmHn2XKdxKl?=
 =?us-ascii?Q?amxgyjkTjQ0A5g3jaEjNNyHdHx1Jm6bKWnKClUcrfyMtlqwy9SMxJf3PEW2h?=
 =?us-ascii?Q?W4RXWwDSXfDURnAiyIZg1UMkMvE30sfGDdQZ4HRaeYh/2DQKk8KNg3cO9aQ/?=
 =?us-ascii?Q?OwkyYXP5a+iHrPVJqYUyCP8MK7Pv2MxTjsULhEpnRR2xis3zxNXdm8qRuMuH?=
 =?us-ascii?Q?mkaG+E9YReqmQCRRxb2dzj9y/dCBh+j+1VZHJS9M2im26FP0zVdbmaMLddWg?=
 =?us-ascii?Q?BwoOj1vftTRrnYFPQcQ8c9odB9v16JqC0N5gDkC6+BXTSCu7c99FFEl8uWK5?=
 =?us-ascii?Q?bKxTlUwUKqLARSPDPp8JgoscnYhbnVKhii6zGpubd0U/yp9ln0wqBNplZuGa?=
 =?us-ascii?Q?UT2JTupSUABPmNTxi5Cfw6fsH7vsm3uftJObu7esG+2Gj8j3x8YzHFltRnbi?=
 =?us-ascii?Q?DdIMyiAKMznMOfkX7JopElUJH60VMD9nm7K+QiUnLlItdIOVs05O+N0DTdPp?=
 =?us-ascii?Q?vj2qbWHrLprALK1i0u7NOaiRMgJzFxsmNxLZ9Nbm8iiIAoyne6jDaD8NMMYT?=
 =?us-ascii?Q?IdcOs8rbYXwJPMWvOyzGyw4GNWpXiy3KSn3QthaIgNfsiAAmUIuJae1ESfHK?=
 =?us-ascii?Q?2AhgOKdDGDQVICienuQeXyTrtGuNTd4qNQbdN5ByRpu6QM1ZhTwSnct5XVTc?=
 =?us-ascii?Q?ZymQYx5itx03NT6mOdA7vFbWUtRE6BmjeFViYhePb0AuuFcgRD0GtF6qL7cO?=
 =?us-ascii?Q?uBPHFtTKbzej/4Z5UKYURz1D2QMQ0CJpeVL4Q+4r77WrwmmAiupfWPZxXd7r?=
 =?us-ascii?Q?i+EdTPlraPZDwcTEbnSKfS8dYdsbneqn2qzHvLOOeAU2KVtjQhgZUg8ks6Fd?=
 =?us-ascii?Q?9FzW4R8tnbLPQ8wMNwqFFJYZuzpRkxb99zNk+UphD3ULfKrQWLAEiR5gW8RV?=
 =?us-ascii?Q?ptOFhPcCreGyyPgEKvO3ZPtkH/gPF/IiulQyeqoBcFND8f4Ys+CfOq62tNLA?=
 =?us-ascii?Q?OmHE8M57jUnCYmGoJ+TzzEIsi62o39yAcCDcdfCM6j8UubSLIvi4DQWvbyX7?=
 =?us-ascii?Q?APGXH4/7TZn8u47SqYjs8UPNQdx4DRJYwMX+1+gulDLkzrk1Vd5UdIlLb1iA?=
 =?us-ascii?Q?olXu2Xcm2cuAEgUfKWe0+jmGB3kjsJbboUSeG72y3lPKZsxid16z6vnIBgHf?=
 =?us-ascii?Q?0KiN6Pcfdc/5l7vylRap29SRkeUIsZ4vj1mIpUWI6flsKF0yrIQkd6H?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1232;
 6:kmXg+J6p7gEre0i7kzN0vOODsCSUTLBL5jx9q1NR7aJpVFUrW9KvZkevjeN3FTYsGGbv1cDxATtDzbNmTQBlc9ERgLvzEykEwAmYjV0SLS//SrHHY6oKLYAwq9Gau3w3/Oyc35INR1Jpdyj7FikzB49hsLjeTGYSL+oNAhMmXdJGRJ89PgSyHtwZwQLz92enl07CtiILgkH+tspgeIFnFq1bjFS6e8vTzwP5TWsYOjXP3+a4pQNkfFBEwvRRsh6FLH2Ej8/GDJwEhT1PD1oFdaTLTnCMQGERmpzEu4koN5sQ+P5eiZ0LZHYYu9eaH4eLW2gRLtkMhTCnVo0jrWy4MGVij6hjY7vhtm6klVqhMcA=;
 5:478v3XAiYAa2btlWI9dyGgKNx1NFaZx27UVh71DrpCE8+Np2dGyHOjENjhjFdhBdwfkPnEYSIRDexpj6S7Ptmvj+4d7nrsHPsmizILwwZYvXtl3dGvOJEWnOcxy+JwZf//zDRYSmWqJ7IBRQmCGOTMNAAIB8VjOH5pEuki34z6c=;
 24:b9OrSTNQvhlNznls5MHq6O9u1mUlePJLBlDq6RimM/Ea/Rw0I8Uh562zJmSZiEE3fPkc0Vr784xIM3PaohwuahgbewINmkBgPiZybcmbxp4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1232;
 7:FTF+at756tpW+g805/6rsHD43bc3LVxGPjLEo10Fxo0lCJhDuOpT8tAu6Ko9KhpbbwwnCLOW5+fqIPBUHVXZRWHy3szCcu0OIzImmyeBQwyBlixjx5jXQ2EO6ivxh+8QP8TDsR+mkZI/bxj9TiPNnY6v9yhu/Cgy0dVL1syo/ISpkCNNWbSsS1FkWO+81A/0HRCVaTkYtgFsihKahEB66+NskrUSMnERVZPunZm6qVmUsv4M9p67zYypGvBbPVJWOMU/KpyAjcl8b5kQ/w+tahEEKVn5S+yZbW7pVs9244JqL2CbonJdNG9Ss4CD9lLQpAzSSwat3LzLtkhxLd9l6v4jAnQJo5VdIFnvpPRj/6E=
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2016 13:08:04.0093 (UTC)
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.20];
 Helo=[avsrvexchhts2.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1232
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2016 13:08:13 -0000

--_000_C160D2872FE0DE4683E1910F9BF829414846E409avsrvexchmbx2mi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I was using host usb passthorugh for testing my application in emulated env=
ironment when using qemu-x86-64.  I could access host usb by adding "-usb -=
device usb-host,hostbus=3Dx,hostaddr=3Dy" to qemu. Usb will be added in /mn=
t/.

Same command is not working as expected in qemuarm emulated environment. Co=
mmand is passing but I could not access usb in emulated environment. When e=
xecuting qemu command, usb is getting ejected from host system.

-Anyone have idea on emulating a host usb in qemuarm environment?

As an alternative way, I am adding a custom recipe which includes my applic=
ation. Application folder structure includes cross-compiled *.a and *.so.

I am getting following errors while do_package_qa().


-          Mycode-1.0-r0 do_package_qa: QA Issue: non -staticdev package co=
ntains static .a library ...............

-          Mycode-1.0-r0 do_package_qa: QA Issue:No GNU_HASH in elf binary =
.......................

-Is there any way to include static library in my recipe to openbmc image b=
y getting past qa issue?

-Is there a way to skip GNU_HASH check in so files which is in my custom de=
velopment recipe?

-          A way I found while searching through google was to add export L=
D=3D"${LD} --hash-style=3Dgnu" before compiling my binaries. Is there any o=
ther way where I can disable GNU_CHECK for my recipe?


Thanks and Regards
Arjun Padmanabhan
Software Design Engineer
Microsemi Storage Solutions India Pvt. Ltd.








--_000_C160D2872FE0DE4683E1910F9BF829414846E409avsrvexchmbx2mi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:305470554;
	mso-list-type:hybrid;
	mso-list-template-ids:-1579357706 1993132948 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1267806244;
	mso-list-type:hybrid;
	mso-list-template-ids:-173393092 -691754692 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was using host usb passthorugh for testing my appl=
ication in emulated environment when using qemu-x86-64. &nbsp;I could acces=
s host usb by adding &#8220;&#8211;usb &#8211;device usb-host,hostbus=3Dx,h=
ostaddr=3Dy&#8221; to qemu. Usb will be added in /mnt/.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Same command is not working as expected in qemuarm e=
mulated environment. Command is passing but I could not access usb in emula=
ted environment. When executing qemu command, usb is getting ejected from h=
ost system.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Anyone have idea on emulating a host usb in qemuarm=
 environment?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As an alternative way, I am adding a custom recipe w=
hich includes my application. Application folder structure includes cross-c=
ompiled *.a and *.so.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am getting following errors while do_package_qa().=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Mycode-1.0-r0 do_package_qa: QA Issue: non &#8211;s=
taticdev package contains static .a library &#8230;&#8230;&#8230;&#8230;&#8=
230;<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Mycode-1.0-r0 do_package_qa: QA Issue:No GNU_HASH i=
n elf binary &#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;..<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Is there any way to include static library in my re=
cipe to openbmc image by getting past qa issue?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Is there a way to skip GNU_HASH check in so files w=
hich is in my custom development recipe?<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>A way I found while searching through google was to=
 add export LD=3D&quot;${LD} --hash-style=3Dgnu&quot; before compiling my b=
inaries. Is there any other way where I can disable GNU_CHECK for my recipe=
?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks and Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Arjun Padmanabhan<o:p></o:p></p>
<p class=3D"MsoNormal">Software Design Engineer<o:p></o:p></p>
<p class=3D"MsoNormal">Microsemi Storage Solutions India Pvt. Ltd.<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_C160D2872FE0DE4683E1910F9BF829414846E409avsrvexchmbx2mi_--

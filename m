Return-Path: <dukh@lenovo.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.5; helo=mail1.bemta24.messagelabs.com;
 envelope-from=dukh@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4432s053N9zDqBY
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 23:16:02 +1100 (AEDT)
Received: from [67.219.250.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.us-west-2.aws.symcld.net id 10/C3-15712-002AA6C5;
 Mon, 18 Feb 2019 12:16:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleJIrShJLcpLzFFi42JJl3ulp/t/YVa
 MwY3z5hZLb15hszjV8oLFgcnj9vYmdo/zMxYyBjBFsWbmJeVXJLBmbJmxibWgn71i99mz7A2M
 H1i7GDk5hASeMUocWGsBYS9glDi3zB3EZhNQktj89A4biC0ioCtxrbmFEcRmFrCU2PzxEjuIL
 SygIXH4RxsLRI2mxMaZP5ghbCOJ5ddOANVwcLAIqEocu8gBEuYV8JG4u+UCC8SqColb15Yzgd
 icAuYSHa9+gtmMArIS0x7dZ4JYJS5x68l8MFtCQEBiyZ7zzBC2qMTLx/9YQcZLCMhLbJklCFG
 uI7Fg9yc2CFtbYtnC18wQawUlTs58wjKBUWQWkqmzkLTMQtIyC0nLAkaWVYwWSUWZ6RkluYmZ
 ObqGBga6hoZGuobGINpcL7FKN1GvtFi3PLW4RNdIL7G8WK+4Mjc5J0UvL7VkEyMwilIKmkp3M
 F5Znn6IUZKDSUmUV2lBVowQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV59YFQKCRalpqdWpGXmAO
 MZJi3BwaMkwisCkuYtLkjMLc5Mh0idYlSUEuf1A5kpAJLIKM2Da4OlkEuMslLCvIwMDAxCPAW
 pRbmZJajyrxjFORiVhHk1QcbzZOaVwE1/BbSYCWjxWs4MkMUliQgpqQbG/f827t5yeYHZ4i9b
 VuyYsdRUcZftXM5rK5yurVXxbz91KVznZOA8JcY1iXnPLn5yK07rMsleyaA05//MhXsNT0pfv
 X2PoaTCes6rs/X7Lh1Id867vc0nZsGanT5X/SRkS04mebh9LAoQf7XDi1Hg9vvQ9uytH+9YzJ
 yQ8pfHa6mHcop959Izd5VYijMSDbWYi4oTAZXPTkMcAwAA
X-Env-Sender: dukh@lenovo.com
X-Msg-Ref: server-2.tower-326.messagelabs.com!1550492154!1915325!1
X-Originating-IP: [103.30.234.46]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25570 invoked from network); 18 Feb 2019 12:15:59 -0000
Received: from unknown (HELO apsmtp03.lenovo.com) (103.30.234.46)
 by server-2.tower-326.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 18 Feb 2019 12:15:59 -0000
Received: from CNMAILEX04.lenovo.com (unknown [10.96.80.4]) by
 apsmtp03.lenovo.com with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-SHA384)
 id 511e_0275_7d9685a5_ac4c_4e70_b076_78b6327a377d;
 Mon, 18 Feb 2019 20:15:52 +0800
Received: from CNMAILEX03.lenovo.com ([169.254.11.88]) by
 CNMAILEX04.lenovo.com ([192.168.1.124]) with mapi id 14.03.0415.000; Mon, 18
 Feb 2019 20:15:53 +0800
From: Duke KH Du <dukh@lenovo.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [External]  Re: Lenovo CCLA
Thread-Topic: [External]  Re: Lenovo CCLA
Thread-Index: AQHUvxd+VL+A3lTEpkaIdBzVn4j916Xlh5JA
Date: Mon, 18 Feb 2019 12:15:52 +0000
Message-ID: <9F16AAB7177A1645BBAFF66396C46B0E7A2F2DDF@CNMAILEX03.lenovo.com>
References: <9F16AAB7177A1645BBAFF66396C46B0E7A2DDFFB@CNMAILEX03.lenovo.com>
 <20190207190132.penuqrg4iceznnom@thinkpad>
In-Reply-To: <20190207190132.penuqrg4iceznnom@thinkpad>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.19.89]
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
X-List-Received-Date: Mon, 18 Feb 2019 12:16:05 -0000

Hi Brad,

Thanks for your approval.

And could you help create the meta-lenovo repo?

Thanks.



-----Original Message-----
From: Brad Bishop <bradleyb@fuzziesquirrel.com>=20
Sent: Friday, February 8, 2019 3:02 AM
To: Duke KH Du <dukh@lenovo.com>
Cc: openbmc@lists.ozlabs.org
Subject: [External] Re: Lenovo CCLA

On Fri, Feb 01, 2019 at 08:34:56AM +0000, Duke KH Du wrote:
>Hi Brad Bishop and all,
>
>OpenBMC community now is growing so fast, more and more engineers and comp=
anies are working on it.
>As a company who is always working on the new and innovative technology,  =
Lenovo would like to join in the OpenBMC community for the OpenBMC developm=
ent.
>
>And we also went through the CONTRIBUTION.md, and knew an agreement need t=
o be signed first.
>The attachment is Lenovo signed version CCLA for this purpose.
>
>Could you help review it?

Your signed CCLA has been accepted.  Welcome!

thx - brad

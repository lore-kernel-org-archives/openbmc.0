Return-Path: <ryan_chen@aspeedtech.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43w1nv3hZxzDqJ2
 for <openbmc@lists.ozlabs.org>; Thu,  7 Feb 2019 13:04:02 +1100 (AEDT)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x1721gwP099518;
 Thu, 7 Feb 2019 10:01:42 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 7 Feb
 2019 10:03:38 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 7 Feb 2019 10:03:38 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Secure boot for BMC
Thread-Topic: Secure boot for BMC
Thread-Index: AQHUvV46qPt5j8Xb4Ei0sx6zd+2y9KXTlyLQ
Date: Thu, 7 Feb 2019 02:03:37 +0000
Message-ID: <bbd6db33f3c9447a9c3b37dee4589768@TWMBX02.aspeed.com>
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
In-Reply-To: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x1721gwP099518
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
X-List-Received-Date: Thu, 07 Feb 2019 02:04:04 -0000

Hello Brad,
	I would like join this. =20

Cheers,

Ryan

-----Original Message-----
From: openbmc [mailto:openbmc-bounces+ryan_chen=3Daspeedtech.com@lists.ozla=
bs.org] On Behalf Of Brad Bishop
Sent: Tuesday, February 5, 2019 10:14 PM
To: openbmc@lists.ozlabs.org
Subject: Secure boot for BMC

Hi everyone

Does anyone have plans to provide a secure BMC boot implementation to OpenB=
MC in the 2.7 or 2.8 timeframe?  Just trying to get a feel for who all want=
s to collaborate on this before I submit a design template.

thx - brad

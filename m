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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YmsV1j8FzDqQN
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 20:18:50 +1100 (AEDT)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x089IOvV067733
 for <openbmc@lists.ozlabs.org>; Tue, 8 Jan 2019 17:18:24 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 8 Jan
 2019 17:18:40 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Tue, 8 Jan 2019 17:18:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: intel-ipmi-oem_git.bb compiler error
Thread-Topic: intel-ipmi-oem_git.bb compiler error
Thread-Index: AdSnM1LrzGnw9YiESouRH4ckpqRbZg==
Date: Tue, 8 Jan 2019 09:18:39 +0000
Message-ID: <bcd8a8d63a0141929785d792135a4a2f@TWMBX02.aspeed.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x089IOvV067733
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
X-List-Received-Date: Tue, 08 Jan 2019 09:18:54 -0000

Hello OpenBMC,

	When I build meta-s2600wf, it get following compiler error, does there hav=
e some patch for fix it?

	ERROR: intel-ipmi-oem-0.1+gitAUTOINC+52341e8543-r0 do_compile: Function fa=
iled: do_compile (log file is located at /home/ryan/work/project/ast/openbm=
c/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+git=
AUTOINC+52341e8543-r0/temp/log.do_compile.15094)
ERROR: Logfile of failure stored in: /home/ryan/work/project/ast/openbmc/op=
enbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+52341e8543-r0/temp/log.do_compile.15094

Ryan=20

Return-Path: <a.soldatov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.soldatov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="fWBpx+Wv"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bNHt4dmTzF3KV
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 19:58:28 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E90194120A;
 Thu, 18 Oct 2018 08:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1539853103; x=1541667504; bh=NxTTr+tNvFnexBHxhFjNkhHBr
 Uv1g24K6DBSi0wGxy0=; b=fWBpx+WvIg0ytowe1oyTLV57ewo4DsGG2TQHzJgNx
 NM/sNjGVallPsfktX9RQAjBk/llfEN6uXGUzj43cxI078/dBccDT1Rm4VZtwFWLE
 Wad+Xcaqh66X1ONAjs4XNW2sYS8MlxwYFxY/3i0tFMA+41Izu+YIRI3QfMbQvb+y
 t0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ie5gDf6xVgad; Thu, 18 Oct 2018 11:58:23 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1039041206;
 Thu, 18 Oct 2018 11:58:23 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 18 Oct 2018 11:58:22 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895]) by
 T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895%14]) with mapi id
 15.01.0669.032; Thu, 18 Oct 2018 11:58:22 +0300
From: Alexander Soldatov <a.soldatov@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Total server power consumpion
Thread-Topic: Total server power consumpion
Thread-Index: AQHUZr6W7jzza3bfT0uYScd+KmtVjQ==
Date: Thu, 18 Oct 2018 08:58:22 +0000
Message-ID: <0b3c953807d24f4ca154c766fe22eaea@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.4.87]
Content-Type: text/plain; charset="windows-1251"
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
X-List-Received-Date: Thu, 18 Oct 2018 08:58:35 -0000

=A0 Hi all,
  We have faced with the problem of showing total server power consumption =
in the webui. Total power consumption is calculated as sum of the PSUs inpu=
t powers. Input power values are read from PSU using PMBus protocol and are=
 published in the Linux sysfs.  We are using our proprietary PSU driver. So=
 I have an idea. Driver should create virtual hwmon device with total power=
 parameters. We could use standart phopshor-hwmon to publish total power in=
 DBus.
=A0 But the phosphor-hwmon requires the physical device path (calloutPath).=
 This parameter is transmitted using %p option of the udev. There is no pat=
h for the virtual device. The phosphor-hwmon does not get calloutPath and e=
xits with error.
=A0 There are some questions:
=A0 1. How is this problem solved in other projects (the Witherspoon etc.)?
=A0 2. The Witherspoon server has 2,2 kW PSUs. The maximum value of power i=
n linux sysfs on the 32 bit system is 2147483647 =B5W. How the correct powe=
r view is solved?
=A0 3. How does the phosphor-hwmon use calloutPath besides logs info output=
?
=A0 4. Does it make sense to give the phosphor-hwmon an ability to work wit=
h virtual devices?=A0=A0=20
   Regards,
=A0=A0 Alexander Soldatov.

    =

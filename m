Return-Path: <xiaoting.liu@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.18; helo=barracuda02.hxt-semitech.com;
 envelope-from=xiaoting.liu@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
Received: from barracuda02.hxt-semitech.com (unknown [223.203.96.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Y59k5wTTzDqFG
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jan 2019 17:30:34 +1100 (AEDT)
X-ASG-Debug-ID: 1546842616-107606139f134ca0001-mgJK9t
Received: from HXTBJIDCEMVIW01.hxtcorp.net ([10.128.0.14]) by
 barracuda02.hxt-semitech.com with ESMTP id DZJl4vMJpzdnrWIm (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Mon, 07 Jan 2019 14:30:16 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 7 Jan 2019 14:30:10 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Mon, 7 Jan 2019 14:30:10 +0800
From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Yang, Shunyong"
 <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng"
 <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Thread-Topic: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
X-ASG-Orig-Subj: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Thread-Index: AQHUpAvy8GAMUOOpLkCuSbjbkhrxsA==
Date: Mon, 7 Jan 2019 06:30:09 +0000
Message-ID: <d3a77a2f9b1741a28f5a2b394b517ea2@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <20190105170518.GA1879@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.98]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.14]
X-Barracuda-Start-Time: 1546842616
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.102:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 1898
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4991 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65257
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-List-Received-Date: Mon, 07 Jan 2019 06:30:37 -0000

Hi Guenter Roeck,

Thanks for your reply.

On 2019/1/6 1:05, Guenter Roeck wrote:
> On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
>> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
>>
> Misleading subject. While the DPS650AB may ber a power supply,
> it is a PMBus hwmon driver, and should be marked accordingly in the subje=
ct.
>
> Guenter

We will change the subject as "dt-bindings: hwmon: Add dps650ab
documentation", is that okey?

Thanks,

Xiaoting.

>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
>> ---
>>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> --
>> 1.8.3.1
>>
>>
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Docu=
mentation/devicetree/bindings/hwmon/dps650ab.txt
>> new file mode 100644
>> index 000000000000..bbd601100e66
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>> @@ -0,0 +1,11 @@
>> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
>> +
>> +Required properties:
>> +- compatible : "dps650ab"
>> +- reg        : I2C address, one of 0x58, 0x59.
>> +
>> +Example:
>> +       dps650ab@58 {
>> +                   compatible =3D "dps650ab";
>> +                   reg =3D <0x58>;
>> +       };





This email is intended only for the named addressee. It may contain informa=
tion that is confidential/private, legally privileged, or copyright-protect=
ed, and you should handle it accordingly. If you are not the intended recip=
ient, you do not have legal rights to retain, copy, or distribute this emai=
l or its contents, and should promptly delete the email and all electronic =
copies in your system; do not retain copies in any media. If you have recei=
ved this email in error, please notify the sender promptly. Thank you.

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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dHm50WdzzDqQD
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 13:41:23 +1100 (AEDT)
X-ASG-Debug-ID: 1547433674-107606139f18abc0001-mgJK9t
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by
 barracuda02.hxt-semitech.com with ESMTP id tp8x8fpV40bBIN5A (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Mon, 14 Jan 2019 10:41:15 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 14 Jan 2019 10:41:04 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Mon, 14 Jan 2019 10:41:04 +0800
From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
To: Rob Herring <robh@kernel.org>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net"
 <linux@roeck-us.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Yang, Shunyong"
 <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng"
 <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Thread-Topic: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
X-ASG-Orig-Subj: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Thread-Index: AQHUpAvy8GAMUOOpLkCuSbjbkhrxsA==
Date: Mon, 14 Jan 2019 02:41:04 +0000
Message-ID: <d51a1a5fe99b4227a596ff66c05ad67c@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <20190111193612.GA23166@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.98]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.15]
X-Barracuda-Start-Time: 1547433675
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.102:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 1899
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5000 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65646
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
X-List-Received-Date: Mon, 14 Jan 2019 02:41:27 -0000

Hi Rob Herring,=0A=
=0A=
Thanks for your reply.=0A=
=0A=
On 2019/1/12 3:42, Rob Herring wrote:=0A=
> On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:=0A=
>> Bindings for DPS650AB power, voltage, temperature, and fan monitering.=
=0A=
> s/monitering/monitoring/=0A=
=0A=
I delivered the latest v3 patch and updated the subject. you can refer=0A=
to the following link:=0A=
=0A=
https://patchwork.ozlabs.org/patch/1022664/=0A=
=0A=
>=0A=
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>=0A=
>> ---=0A=
>>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++=
=0A=
>>  1 file changed, 11 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Docu=
mentation/devicetree/bindings/hwmon/dps650ab.txt=0A=
>> new file mode 100644=0A=
>> index 000000000000..bbd601100e66=0A=
>> --- /dev/null=0A=
>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt=0A=
>> @@ -0,0 +1,11 @@=0A=
>> +Bindings for DPS650AB power, voltage, temperature, and fan monitering=
=0A=
>> +=0A=
>> +Required properties:=0A=
>> +- compatible : "dps650ab"=0A=
> Needs a vendor prefix.g=0A=
Add vendor delta on v3 patch.=0A=
>=0A=
>> +- reg        : I2C address, one of 0x58, 0x59.=0A=
>> +=0A=
>> +Example:=0A=
>> +       dps650ab@58 {=0A=
>> +                   compatible =3D "dps650ab";=0A=
>> +                   reg =3D <0x58>;=0A=
>> +       };=0A=
>> --=0A=
>> 1.8.3.1=0A=
>>=0A=
>>=0A=
>>=0A=
>>=0A=
>> This email is intended only for the named addressee. It may contain info=
rmation that is confidential/private, legally privileged, or copyright-prot=
ected, and you should handle it accordingly. If you are not the intended re=
cipient, you do not have legal rights to retain, copy, or distribute this e=
mail or its contents, and should promptly delete the email and all electron=
ic copies in your system; do not retain copies in any media. If you have re=
ceived this email in error, please notify the sender promptly. Thank you.=
=0A=
> We can't accept emails with these clauses.=0A=
>=0A=
> Rob=0A=
=0A=
Delete the message on v3 patch.=0A=
=0A=
Thanks,=0A=
=0A=
Xiaoting=0A=
=0A=
=0A=

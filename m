Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="jUHEgf4k"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Fbn221WKzDqq8
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 20:33:42 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id F3260404CD;
 Wed, 19 Sep 2018 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mta-01; t=1537353217; x=
 1539167618; bh=mu5NheCMBnrXLmyP/dpY7Dahtk0Slw0cIfpaMTUgc0I=; b=j
 UHEgf4kNYQTKx/v6bAACZZWXWz5L/KUP9MXVHrc+kIKwKIBmyfPFddT0YulqwB4y
 j56dTAzyt7O9lAmNYwhn9FzdPxZuU7/yM3rW8nhW2PIJt/a26uXfzhLQQCv8hXTI
 cGYgiOlsg99u70Ftdopw8ii2RcCZf1+fyZSt2pxkRs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcRUAiO9E_0L; Wed, 19 Sep 2018 13:33:37 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A11DD404CF;
 Wed, 19 Sep 2018 13:33:37 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 19 Sep 2018 13:33:37 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895]) by
 T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895%14]) with mapi id
 15.01.0669.032; Wed, 19 Sep 2018 13:33:37 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Lei YU <mine260309@gmail.com>, Sivas Srr <sivas.srr@in.ibm.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Version and Functional FRU fields for motherboard and membuf
Thread-Topic: Version and Functional FRU fields for motherboard and membuf
Thread-Index: AQHT1+fLzKHm4NzT2kySmots3h2gWaS/vmwAgADa7ICAN74x0Q==
Date: Wed, 19 Sep 2018 10:33:37 +0000
Message-ID: <0c38bf32fc3c43f79a4356170fe23df0@yadro.com>
References: <11b98338b00640daa3cbeba50c6ef324@yadro.com>
 <33ffdf42-0d9d-0331-0e14-2898cd1a1e73@yadro.com>,
 <CAARXrtmmeixPcYx4U11Zy19fm0GnOLbvUD2MTpZOEp-ytQ9T2g@mail.gmail.com>
In-Reply-To: <CAARXrtmmeixPcYx4U11Zy19fm0GnOLbvUD2MTpZOEp-ytQ9T2g@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.250]
Content-Type: text/plain; charset="koi8-r"
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
X-List-Received-Date: Wed, 19 Sep 2018 10:33:42 -0000

>> It's actually "Verify FRU Properties" and it's a part of openbmc-test-au=
tomation test suite, see here:
>>
>> https://github.com/openbmc/openbmc-test-automation/blob/ac687c43ddc7f639=
a4607ad89dd5ae462dcf65c9/tests/test_inventory.robot#L184
>>
>> As I see, Palmetto's yaml config does not have Version or Functional pro=
perty for motherboard and membuf, so I do not think they will have such pro=
perties.
>>
>> So, does the test case pass for Palmetto?

> @Sivas Srr Could you check this?

Sivas, Lei? Any chance to get an answer to this? The test still fails for u=
s and we can't decide whether we should disable the test or add thos proper=
ties to motherboard and membuf objects.

By the way, what is at all the meaning and purpose of the 'Functional' prop=
erty? Is it an indicator of a component functioning properly, or is it a 'h=
andle' to turn a component off before hot removal/replacement?
There is no description anywhere that we could find.

Thank you.
Alexander.=

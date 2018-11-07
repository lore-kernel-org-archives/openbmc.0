Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="FnOmxvpQ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qdRf74h6zF3Fj
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 18:32:43 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2F1B04120A
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1541575955; x=1543390356; bh=BO/9EAi4s1Bd3HJaZPFkUxYm5
 HjFqMb1QLzEkh2OGP4=; b=FnOmxvpQiUb1wDNqqrpeAd37rQ/9j+HpJo98bxoyk
 Cvy7WsSFz/5pM7kWuWLZGkBi2GHgw6wRdKm5IiY0snVBtyfua6SHY0wqmnF1kPKB
 ULseiJIXGhqlC9RfE0EY7T0M9UlcEQlnizkwmnaTXR2F23fwBYvSFC1SglyiM4xR
 ag=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1Nh3L8_TGYg for <openbmc@lists.ozlabs.org>;
 Wed,  7 Nov 2018 10:32:35 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4E7C4411FB
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 10:32:35 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 7 Nov 2018 10:32:34 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895]) by
 T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895%14]) with mapi id
 15.01.0669.032; Wed, 7 Nov 2018 10:32:34 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: pull request to the u-boot-aspeed
Thread-Topic: pull request to the u-boot-aspeed
Thread-Index: AQHUdms1fdBLenHzmkOwOFO/q9XDLg==
Date: Wed, 7 Nov 2018 07:32:34 +0000
Message-ID: <3ff8d429943e44139b73cb16199a560e@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [172.17.15.155]
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
X-List-Received-Date: Wed, 07 Nov 2018 07:32:47 -0000

Hello everybody,

I would like to publish for review and discussion our implementation of the=
 aspeed i2c driver and the VPD parser for the u-boot-aspeed, but the gerrit=
 said that it have no such repository.

Which the best way to do that?

--
Regards,
Alexander Filippov
Software Engineer, YADRO. =

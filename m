Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="dLbOb8Al"; 
 dkim-atps=neutral
X-Greylist: delayed 570 seconds by postgrey-1.36 at bilbo;
 Fri, 20 Apr 2018 00:20:54 AEST
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Rh3p53nCzF1pY
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 00:20:54 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 06BE751969
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1524147074; x=1525961475; bh=4n1wxVG6/ayR0q/NpZI1mS1hj
 yiyXZnDS95mwyScVT0=; b=dLbOb8Al727sbLmDq3L2UVO3egY4knTG1PEy8H9FG
 NOyCvuEL4SLDvofcHimsOqsgezJZ7rsVg3lQhqWUm4XI604tdDhs4gLzfk7L7qQv
 BH1AVSuuhSXVJ3FS/TGlstNAPUoW4x2IXzDQ1O6OQLe+bRUns4uaWA/OUfAeX5oo
 yc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nm21pIvqMplZ for <openbmc@lists.ozlabs.org>;
 Thu, 19 Apr 2018 17:11:14 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1B720507EB
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 17:11:13 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 19 Apr 2018 17:11:13 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::c87c:3169:a2ee:3f8]) by
 T-EXCH-02.corp.yadro.com ([fe80::c87c:3169:a2ee:3f8%14]) with mapi id
 15.01.0669.032; Thu, 19 Apr 2018 17:11:13 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Version and Functional FRU fields for motherboard and membuf
Thread-Topic: Version and Functional FRU fields for motherboard and membuf
Thread-Index: AQHT1+fLzKHm4NzT2kySmots3h2gWQ==
Date: Thu, 19 Apr 2018 14:11:13 +0000
Message-ID: <11b98338b00640daa3cbeba50c6ef324@yadro.com>
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
X-List-Received-Date: Thu, 19 Apr 2018 14:20:55 -0000

Hello everyone,

We get a failure running the "Validate FRU Properties Fields" test
because in our system we do not have "Version" and "Functional"
properties in the following nodes:

   /xyz/openbmc_project/inventory/system/chassis/motherboard
   /xyz/openbmc_project/inventory/system/chassis/motherboard/membuf*

However, we've examined the corresponding yaml files available in the
master branch for palmetto and witherspoon, and have not been able to
locate any mentions of those properties either.

Assuming that the aforementioned test passes for those systems, our
question is: where do those properties come from for them?

--
Alexander=

Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNsvZ6BVQzDqJC
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 13:33:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="Iq+50jZO"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xNsvZ3DGSz9s7g;
 Fri,  4 Aug 2017 13:33:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1501817594; bh=xEiIJ2O87gH1U+gypDLR9cjTHRBhLY8OBeSXIFu48hQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Iq+50jZO6ylEaPuz4eazZj1kA/PjP1Dfo3BQDPP0//js+41siG/G9LK6kXuuDiByP
 DD2cBBFtK0plytHoe3WKhnh5zA+6Ufjg7kGE1jvCAYcGFHvQOSCz3Mfi2ey78U5FWh
 Gu9vvYfjhWa/NVqABlLf1WhR+9uQkAyebAfx2HBw20qY5XxYJ2e/0Bs/JIrd1ukHNP
 Ob5GKyAhEkpgdDxe7mrkAtcMyRC1AAAuYbPLFhK7m7rzlC/yaOkTcJf0tcZayvYbew
 SNBcd+yjanimJK27AicTdavU9ZcvmLTeto5p1M8Np8fvX7FPvm8IrF3xgM27y7UKBp
 ZtYYMqy5w+mqw==
Subject: Re: [PATCH linux dev-4.10 v2 3/3] fsi: core: Add check for master
 property no-scan-on-init
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
References: <20170804032622.88674-1-cbostic@linux.vnet.ibm.com>
 <20170804032622.88674-4-cbostic@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <4e9e5404-c8f7-51f0-f886-46010d5bfe68@ozlabs.org>
Date: Fri, 4 Aug 2017 11:33:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170804032622.88674-4-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 04 Aug 2017 03:33:15 -0000

Hi Chris,

> Prior to scanning a master check if the optional property
> no-scan-on-init is present.  If it is then avoid scanning.  This is
> necessary in cases where a master scan could interfere with another
> FSI master on the same bus.

Looks good to me. We may need to be flexible with the property name
(based on feedback from the DT folks, when we send to them for review),
but that should be fine regardless.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy

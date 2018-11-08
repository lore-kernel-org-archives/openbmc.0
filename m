Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="HAsgoblQ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rN0S1rcJzF3MV
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 23:30:15 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 17747418F9;
 Thu,  8 Nov 2018 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:content-type:content-type:mime-version
 :references:message-id:subject:subject:from:from:date:date
 :received:received:received; s=mta-01; t=1541680212; x=
 1543494613; bh=m0AnPZbU6C2cTALul3spq3XCwwQOG9aQM+0PiGyERK8=; b=H
 AsgoblQ5pXa+4iHO80XjoHC4duUjUx2HT3qk/sU3YldoGbPgENNyuyRzaQ5K+Oc3
 dsVBPqFHFxA7rbJg7jL2MLjAs+bLcbgPclmtz/NsQ8OIYEk6sxML+DZiSAgCRtrB
 LWAI3wl1JqJW5LMBLYJmGatrPEbDxqxL9cUr4w3NAc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZ4GC8YYAbSi; Thu,  8 Nov 2018 15:30:12 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4C22541203;
 Thu,  8 Nov 2018 15:30:12 +0300 (MSK)
Received: from localhost (172.17.15.155) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Nov
 2018 15:30:11 +0300
Date: Thu, 8 Nov 2018 15:30:11 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Joel Stanley <joel@jms.id.au>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>
CC: <openbmc@lists.ozlabs.org>
Subject: Re: pull request to the u-boot-aspeed
Message-ID: <20181108123011.GA8718@bbwork.lan>
References: <3ff8d429943e44139b73cb16199a560e@yadro.com>
 <3D1C8267-BC6F-44F1-B12F-020E147B225B@fb.com>
 <a6ba63dc-eecc-9a24-e479-8036d53804bd@fb.com>
 <CACPK8Xf6hD9ne530ZLWgE-Tuc9MCXiHrFpx-zJ_SdsDV81Lohw@mail.gmail.com>
 <c59de915-9608-4c44-adc3-82d83d6e279a@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c59de915-9608-4c44-adc3-82d83d6e279a@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [172.17.15.155]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Thu, 08 Nov 2018 12:30:17 -0000

Thanks to all for replies.

On Thu, Nov 08, 2018 at 11:06:22AM +1030, Joel Stanley wrote:
> 
> I'd encourage you to submit the i2c driver for review to upstream
> u-boot. Cedric and I have spent some time recently in improving
> upstream u-boot support for the aspeed SoCs.
> 

The upstream already has the implementation of the aspeed i2c driver.
So, I had to look there before taking up our implementation...


On Thu, Nov 08, 2018 at 08:12:03AM +0100, Cédric Le Goater wrote:
> 
> i2c is already available from mainline U-Boot. But mainline does
> not have ast2400 support (dram training is missing) only ast2500
> was implemented. 
> 

Is it the reason why the OpenBMC still use v2016.07?


Thanks,
Alexander.

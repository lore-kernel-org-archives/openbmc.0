Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ot3qfArL"; 
 dkim-atps=neutral
X-Greylist: delayed 573 seconds by postgrey-1.36 at bilbo;
 Fri, 01 Mar 2019 23:53:51 AEDT
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449q9W4gr3zDqD9
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 23:53:51 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 58B9841977;
 Fri,  1 Mar 2019 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1551444252; x=1553258653; bh=kRa0rAAH5cFX1it6y6sNzvxA5Txe4LK52Zy
 xabrGV98=; b=ot3qfArLkZqr8QQ/G7JYnrbhR0xSrZmVRrz16oZ9577OF7utYGV
 4vBg3J+EjHsuOdx25JzZVEZHmAIsN8CdEkDAEzT7SRSY2jEpo9ka3LCRHxjgK9E6
 oVRwZtQfjbL294m40TYrhsxJr/eXDN/b5Ctgmn1jcRr3k8gDFKMlnSn4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ff_94IKGmNZP; Fri,  1 Mar 2019 15:44:12 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id EE9CB41976;
 Fri,  1 Mar 2019 15:44:11 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 1 Mar
 2019 15:44:11 +0300
Date: Fri, 1 Mar 2019 15:44:11 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Static layout PNOR support in openpower-pnor-code-mgmt
Message-ID: <20190301124151.GA16731@bbwork.lan>
References: <CAARXrtmaOQJ9a224iosU1m+5FSryC4TM7qgBT3n9MYPWzZiQrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAARXrtmaOQJ9a224iosU1m+5FSryC4TM7qgBT3n9MYPWzZiQrQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Originating-IP: [172.17.14.115]
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
X-List-Received-Date: Fri, 01 Mar 2019 12:53:52 -0000

On Thu, Feb 28, 2019 at 03:15:17PM +0800, Lei YU wrote:
> As a follow up of [VPNOR discussion][1], the static layout PNOR
> support in openpower-pnor-code-mgmt is implemented and pushed to gerrit
> starting from https://gerrit.openbmc-project.xyz/#/c/openbmc/openpower-pnor-code-mgmt/+/18747/
> 
> Code reviews and tests are welcome.
> 
> To test the feature:
> 1. Pick the above gerrit commits and build with --disable-ubifs_layout
> 2. Generate pnor in static.tar.gz format, by below command:
>     ./generate-squashfs <xxx.pnor>   # xxx.pnor.static.tar.gz will be generated
>    This tar.gz will be used to do the code update.
> 3. Do code update, gard reset, factory reset the same as VPNOR, described in
>    [host-code-update.md][2] and [REST-cheatsheet.md][3]
> 
> I only tested it on Romulus, and will test it on Palmetto. Hopefully it will
> be tested on other OpenPOWER machines before the patches are merged.

It's really very nice work! Thanks!

I've tested it on our VESNIN hardware. Some things don't work as expected, 
so I am going to add some comments in that regard to Gerrit.

But still, it's very cool.

> 
> Note: image verification feature is not implemented yet.
> 
> [1]: https://lists.ozlabs.org/pipermail/openbmc/2019-February/015104.html
> [2]: https://github.com/openbmc/docs/blob/master/code-update/host-code-update.md
> [3]: https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md

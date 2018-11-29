Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="TlwlFIQR"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43593x3XJHzDqvK
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 19:02:37 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6CD7341999
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1543478553; x=1545292954; bh=b/PHE1Eeal0loSSB2s3lzM4HmE5Ov3udW91
 JH9pEwZc=; b=TlwlFIQRegT3JEG7Kc6uojBKKU3EJb55e1N1lqPv+enuHucxMxa
 ogpYhTsf8cv3ZuS8T3HTBbjTwkX11VRFWhXPC5Dd2yLxySClX/TyG5CuXYxhr6eA
 LmGQk47N1Nrb76L+Be8MNDpYxXsiZZsnVh46MixMyhhHPEDN3PP4ALnI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r9zNtrE8adhS for <openbmc@lists.ozlabs.org>;
 Thu, 29 Nov 2018 11:02:33 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8DE0141953
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 11:02:33 +0300 (MSK)
Received: from localhost (172.17.15.155) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 29
 Nov 2018 11:02:33 +0300
Date: Thu, 29 Nov 2018 11:02:32 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Add TARGET_MACHINE to /etc/os-release
Message-ID: <20181129080232.GA26099@bbwork.lan>
References: <mailman.11506.1542344002.668.openbmc@lists.ozlabs.org>
 <966f717c-59a9-7f88-7b37-91edb9d72276@charter.net>
 <FA5A8B03-6706-4072-A1A9-EE8B1BC1575F@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <FA5A8B03-6706-4072-A1A9-EE8B1BC1575F@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 29 Nov 2018 08:02:38 -0000

Hi all,

On Wed, Nov 28, 2018 at 01:36:37PM -0500, Brad Bishop wrote:
> 
> Just FYI - MACHINE winds up in uname -a:
> 
> root@palmetto:/var/lib/systemd# uname -a
> Linux palmetto 4.18.12-b29e57c654b8d7cfa15d632fbc0ebfe0897b8203 #1 Thu Nov 15 21:52:09 UTC 2018 armv5tejl GNU/Linux
> 
> Perhaps this meets your need without additional code?
> 
> -brad

Brad, it is the hostname. For example in my case it looks like this:

root@malevich:~# uname -a
Linux malevich.dev.yadro.com 4.18.20-d608acfd4ac3fe17f3081bee8fcd4dcd896c2ffa #1 Thu Nov 29 07:19:11 UTC 2018 armv5tejl GNU/Linux

--
Cheers,
Alexander

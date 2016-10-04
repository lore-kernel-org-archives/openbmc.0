Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sp6ss3l5WzDrL5
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 16:29:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uw03n1Vx; 
 dkim-atps=neutral
Received: by mail-vk0-x22e.google.com with SMTP id y190so148846520vkd.3
 for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2016 22:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XVYIg5HuzdshSbZz4CtGfKL0dU8LAylxQilYIFUVrR8=;
 b=uw03n1VxmDHdKyKGyAWlYRkkqGtdBGujNwbYY79SdgVlATYJluu3j4KDQRMFirLuID
 vBtDhrEcSBxaqOsJtwCmrKx6z999tNEQJw7KpM4Rjmcn70x/jiY/kVmXy3kvoCykHiYr
 1/xmNK9PUzqI4+RZ9z7/36wyFr6ntbJkql/jiokcUumrUECm4hh0LBQJlvzLVnVLgLdS
 5QvktTeprXmy6FCz+2XiktkbHA8IjkZsCrElWm3hLCqzC/e129XeJZKaaJf6HORBHt8L
 FzmF15gzTMzeOurwa3K5RZgaW20O9hwa4HK5HG60JaXrzNo5vetUluvAjMsEcgrss11Q
 5a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XVYIg5HuzdshSbZz4CtGfKL0dU8LAylxQilYIFUVrR8=;
 b=iOK5/E6I/GnkrgeXRNGQW0LHCa49iNTp7vKfZyuxf4aRVYkOpyDNzM5r8gK3aEbWTF
 /dP/GDNRNSSwE/3gjHBdXlfKIGzGd2IvOMJpu65XDZMYnNp+0jkYlFitaHuPfUzzx/HQ
 z3NI+iDfjRU+ZzrvfVW8qlvI1qrvJdDKzi0jdeTdZSrPC38MVxHicoCetoVERhCLJ0zB
 gLlCMlNnrrjGRMimnEopF5vCTiYypQJQnTSqB+JDEgFxu0+5cO0CtqaMzWZ8e2bWmTrG
 BXrb1c7CJCFSmVxTz3MgeA536VdzdRrEgXFKmringWMX0XZwPyFIHxqjPHf2TWtnowJg
 YXyQ==
X-Gm-Message-State: AA6/9Rn041Bu11KdT7AfJKKuPZj4iB5ElamOLNoj8wc/xEKNSuKGzpN9qH+Exfwd5XdLMd1g4STkLx0CJwtR1A==
X-Received: by 10.31.183.78 with SMTP id h75mr1037410vkf.148.1475558958583;
 Mon, 03 Oct 2016 22:29:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 3 Oct 2016 22:28:58 -0700 (PDT)
In-Reply-To: <20161004003626.GA309@gwshan>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <20161004003626.GA309@gwshan>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Oct 2016 15:58:58 +1030
X-Google-Sender-Auth: FaT1beUr1X36tF2MJq2aqnTqgZE
Message-ID: <CACPK8Xcx7vNOsT6rdLYVJQHwvN6yFyrogOhpPyczU1jMQ8r2rw@mail.gmail.com>
Subject: Re: [PATCH v2 4.7 0/8] NCSI Fixes
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 04 Oct 2016 05:29:22 -0000

On Tue, Oct 4, 2016 at 11:06 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> On Thu, Sep 29, 2016 at 11:38:43AM +1000, Gavin Shan wrote:
>>
>
> Joel, please hold merging this series because I try pushing this series
> upstream firstly. It's always good to keep code sync'ed between 4.7.x
> with upstream regarding NCSI stack. I will post a updated version if
> it can be upstream in time. Thanks again for your review and comments.

Okay, will do. Thanks Gavin.

Cheers,

Joel

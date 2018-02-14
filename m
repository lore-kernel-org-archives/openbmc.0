Return-Path: <a.amelkin@yadro.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="tocsa+4T"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhBpw3rDzzF1Gx
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 19:07:52 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EE63E53AFD;
 Wed, 14 Feb 2018 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1518595666; x=1520410067; bh=EaD
 OXAsJ8IyAqNApgXzdZgl1BVi8XYAIr5oV9mVBUIA=; b=tocsa+4TEKit6TOJuDB
 iZfvBWE1HxK9143Eea3BFOAcIYRhml+meOla79Jnb/cTTcyrApOZbVhtGnEO6p2E
 KWwVCfdY6ZarEkpu9z/ZxU+ikscW2hG+n8tFFTd3mBLNUyEzJVXEyWwbY7q+l6NS
 r5BkIU5dcbmGvTsb70xdn7bQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxJlOr09HgM1; Wed, 14 Feb 2018 11:07:46 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 170CD5396C;
 Wed, 14 Feb 2018 11:07:45 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 14
 Feb 2018 11:07:45 +0300
Subject: Re: Proprietary task references in commit logs
To: Stewart Smith <stewart@linux.vnet.ibm.com>, Patrick Venture
 <venture@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <560ecebf-d449-b7e7-675b-03ec3c6f4212@yadro.com>
 <CAO=notw8DrRUP7MiFmDcQ9jqypeFqs6xmwXxPYt_jPf+dtP0DQ@mail.gmail.com>
 <87o9ksfdso.fsf@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <06aeaea6-cee0-8f57-654c-5d34f5319905@yadro.com>
Date: Wed, 14 Feb 2018 11:07:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <87o9ksfdso.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Wed, 14 Feb 2018 08:07:53 -0000

14.02.2018 06:30, Stewart Smith wrote:
> I've been poked at this for other firmware too, and I tend to dislike
> non-public bug tracker IDs in public repositories.
>
> I have an idea of using git-notes to have a local tree of `fixes` (even
> added retroactively) that could then be queried/modified that would suit
> this kind of use case.
>
> Of course, finding enough time to write the couple of hundred lines of
> python to do that has been elusive :)
Exactly! This is all about extra work to do, no time to do it, and 
elusive profit of that effort.
Adding a non-public ID takes almost no effort, as well as ignoring it in 
the logs just like most people ignore those strange lawyer-induced 
"Signed-off-by" lines or purely technical "Change-Id" lines.

Creating a separate 'bug' in OpenBMC bugtracker (unless we start to 
require a formal 'bug' for each commit) and adding its ID to the local 
bug-tracker is a useless waste of time, IMO.

Each commit would at max have just one extra company tracker reference 
line. Is that really a problem?

Alexander.

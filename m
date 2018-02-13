Return-Path: <a.amelkin@yadro.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ZwVxDLRm"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgjdv3g3NzF0yf
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 00:13:23 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0307F53AEF
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:received:received:received; s=mta-01;
 t=1518527598; x=1520341999; bh=vmbOcOxz06Edu/EUscuHWLRffF7SxP27
 NPuL+VE+VMI=; b=ZwVxDLRmx0ztZMVsCA6N19qPO8uA7DRygjZfy1QHClLeQx+o
 vK2CeFQKp2MVr1ttnRQwNGwPvh7lfWcH51HvaqavoaqeAmLEYtINLgtlp3kdTQUS
 zXBRCK+0dcNl7IlLsec6cXZeOTRAcQu2GO8oJ8OS3cBu/M37djh+ffK+x+Y=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rs43esSR4ccQ for <openbmc@lists.ozlabs.org>;
 Tue, 13 Feb 2018 16:13:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2A3675396D
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 16:13:17 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 13
 Feb 2018 16:13:17 +0300
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Proprietary task references in commit logs
Message-ID: <560ecebf-d449-b7e7-675b-03ec3c6f4212@yadro.com>
Date: Tue, 13 Feb 2018 16:13:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 13 Feb 2018 13:13:24 -0000

Hi all.

Do you think it is acceptable to have a reference to a proprietary task 
ID in a commit log?

We're using JIRA and would like to see related commits displayed in the 
corresponding issue. That requires putting the issue ID into the commit 
log, so the log would look something like this:

===========

Fix some bug (less than 50 chars as usual)

Long description goes here.
Multiple lines, each less than 72 characters, as usual.

Company Ref: KEY-1234

Change-Id: I5e0f94d168a61b6d82214779aa6ebd9796dc37b2
Signed-off-by: The Author <t.author@company.tld>

===========

Any comments are welcome.

Return-Path: <a.amelkin@yadro.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="fUPwxiB7"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgCSW00bPzF0QY
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 04:33:27 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 20A145396C
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:received:received:received; s=mta-01;
 t=1518456801; x=1520271202; bh=iDU2SfOUB75idit1jv9sxhFgmuv82tLu
 jp0o6EW0bFM=; b=fUPwxiB7Qi+FMDeFDSx+Yl17UXKodyVaX3prQEoJ5znwIEao
 pv+Gh1DWw43h2n3GCztAh6tQKZI5c1h+IajgonxJbc6VaLPObPZUVVUrBy+hUbJ3
 Yq3jLS1aTNTw1WnRSCCYwpLDm3sebI57uF1Z8i75wdxHdJnDd9P0Eoo06tQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lci-1BN0LlQQ for <openbmc@lists.ozlabs.org>;
 Mon, 12 Feb 2018 20:33:21 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8FCEE53644
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 20:33:21 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 12
 Feb 2018 20:33:21 +0300
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: System health monitoring
Message-ID: <3ab513f4-ab10-dabd-430b-8a73c27aa7b2@yadro.com>
Date: Mon, 12 Feb 2018 20:33:21 +0300
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
X-List-Received-Date: Mon, 12 Feb 2018 17:33:31 -0000

Hi everyone!

Could you please tell me if there is a commonly used mechanism in 
OpenBMC for system health monitoring and indication?

I know there is a LED Manager and that there are LED groups, but it is 
unclear if there is any entity that somewhat universally can control 
those LED groups. I would expect it to be somewhere near PEF processing 
if we at all have PEFs. Do we?

Who is expected to send events to trigger those LED groups? Does each 
vendor create their proprietary solution or is there anything public?

Thank you.

With best regards, Alexander.

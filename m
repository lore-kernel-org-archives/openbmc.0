Return-Path: <i.mikhaylov@yadro.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Aqak1ytg; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm7FY1LmjzDqK3
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 00:43:57 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 664DB5714B;
 Tue,  8 Sep 2020 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1599576231;
 x=1601390632; bh=ejEzD5jr9FV3/hlWqfEWFX/rGFFZ3cIzRwFPCAb+D7I=; b=
 Aqak1ytga+sorGGL8KUPypWw2E7L6uod6C6LLQrUrjNAvhMpAeeCYqjY/5P/cGYM
 k8eIM1ATaiBuHWkXGS5xEyyGcBUWuP8Qi3ZXtOSUte54jESV2C2A36r0yvpc3yl0
 O0yi8DBss0Fvbu9Q4s0zD8u3bgbt1T67RcAPm6VxNjo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9H7v2tutmHm; Tue,  8 Sep 2020 17:43:51 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 23DBF4C866;
 Tue,  8 Sep 2020 17:43:50 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.190) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 8 Sep 2020 17:43:50 +0300
Message-ID: <a140b8dd494792d0d814cd20e6e4ab4b2714c16c.camel@yadro.com>
Subject: time control on wolfpass BMC
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Ed Tanous <ed@tanous.net>, James Feist <james.feist@linux.intel.com>
CC: <openbmc@lists.ozlabs.org>
Date: Tue, 8 Sep 2020 17:47:10 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.190]
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
X-List-Received-Date: Tue, 08 Sep 2020 14:44:02 -0000

Hey James, Ed, Is there any way to control RTC/PCH time inside BMC on
wolfpass?In intel-bmc rep there is the pch-time-sync service which is doing
sync.
The service just reads out date via i2c regs and do the sync with system time. I
didn't find any other utilities or something which can help with time set from
BMC.

Thanks.

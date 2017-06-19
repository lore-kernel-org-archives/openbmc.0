Return-Path: <ilya@yadro.com>
X-Greylist: delayed 462 seconds by postgrey-1.36 at bilbo;
 Tue, 20 Jun 2017 00:56:04 AEST
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="CjfGFPJL"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wrvDh47DYzDq7c
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 00:56:04 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4764E41185
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:content-disposition:content-type:content-type
 :mime-version:message-id:subject:subject:from:from:date:date
 :received:received:received; s=mta-01; t=1497883696; x=
 1499698097; bh=Ax2P0AK0CVouhude9S0LrNFCVSdROjYezqdeYPn3jd0=; b=C
 jfGFPJLClK+vs8GB8mswuMkpS7kWzOExWHrAfSZp0gYPgyjK7iUSbx/4t41mScui
 JlNWOJwpqmc3pEzJVwfLM8ZTlbYprVczuJqI9CJHEGsjL9ohxBrtgjc+T9ziGzMk
 Ph/t/lkDCGKK540hFUmoersW2TnEcb2ZuXLHRIlZos=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1CNDXVV4dew for <openbmc@lists.ozlabs.org>;
 Mon, 19 Jun 2017 17:48:16 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 803C0404CF
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 17:48:16 +0300 (MSK)
Received: from localhost (172.17.14.158) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 19
 Jun 2017 17:48:16 +0300
Date: Mon, 19 Jun 2017 17:44:45 +0300
From: Ilya Kuznetsov <ilya@yadro.com>
To: <openbmc@lists.ozlabs.org>
CC: Vlad Vovchenko <v.vovchenko@yadro.com>
Subject: phosphor-net-ipmid
Message-ID: <20170619144445.xpoo5x2sbt3ct22p@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
User-Agent: NeoMutt/20170609 (1.8.3)
X-Originating-IP: [172.17.14.158]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Mon, 19 Jun 2017 14:56:06 -0000

Hello,
we would like to help with phosphor-net-ipmid and have volunteer. For us main 
priorities are sensors and sel. Obviously work is in progress there and we don't 
want to duplicate it, so please share tasks with us and tell how we can 
contribute?
Thanks!

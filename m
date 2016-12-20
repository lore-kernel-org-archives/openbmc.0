Return-Path: <ilya@yadro.com>
X-Greylist: delayed 336 seconds by postgrey-1.36 at bilbo;
 Wed, 21 Dec 2016 07:38:13 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="bd94iv1w"; 
 dkim-atps=neutral
Received: from mx3.yadro.com (mx3.yadro.com [89.207.88.220])
 by lists.ozlabs.org (Postfix) with ESMTP id 3tjqP12zsZzDwTM
 for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2016 07:38:13 +1100 (AEDT)
Received: from mx0.yadro.com (unknown [172.17.0.6])
 by mx3.yadro.com (Postfix) with ESMTP id 9B7A03C86F
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 23:32:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx3.yadro.com 9B7A03C86F
Authentication-Results: mx3.yadro.com;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=yadro.com
 header.i=@yadro.com header.b=bd94iv1w
Date: Tue, 20 Dec 2016 23:30:29 +0300
DKIM-Filter: OpenDKIM Filter v2.10.3 mx0.yadro.com 4FC2424818F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mx0;
 t=1482265952; bh=TTSbo4PAQpSQbzrw9FOTf2VADrLwPtf85SEUlKKszIk=;
 h=From:To:Subject:From;
 b=bd94iv1wd5dhmeLU7fN79UNsjggIKZVPUkjuQsTIdH98uM+POtVsOpe5ttY8zb/9X
 AH6BLOP3txLYER2dWhsXoxdfS3mXZ2xMvuSibtXha7zMdlwjqJwlhfjYSV/AH/bQrk
 WzsYhXPqoQjwVYllmJIh/3A4KrbOsqhBlb5/egCY=
From: =?utf-8?B?0JjQu9GM0Y8g0JrRg9C30L3QtdGG0L7Qsg==?= <ilya@yadro.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Why OpenBMC not ready for production?
Message-ID: <20161220203029.arqocnjnpdtan4bt@yadro.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
User-Agent: NeoMutt/20161126 (1.7.1)
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
X-List-Received-Date: Tue, 20 Dec 2016 20:38:15 -0000

Hello,
Could you please advice if there are any architectural problem in OpenBMC design or current implementation issues which do not allow use it in end-customer environment?
What significant efforts should be applied to get it ready? It is rather rhetorical question, but still I would like to hear opinion of development team.
I apologize if here is not well place for asking such kind of question. If so, please let me know where to start discussion?
Thank you in advance!

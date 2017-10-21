Return-Path: <d.mueller@elsoft.ch>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=elsoft.ch
 (client-ip=212.243.197.30; helo=mail.hostpark.net;
 envelope-from=d.mueller@elsoft.ch; receiver=<UNKNOWN>)
X-Greylist: delayed 522 seconds by postgrey-1.36 at bilbo;
 Sat, 21 Oct 2017 20:06:05 AEDT
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJxbd5gsyzDq5v
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 20:06:05 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id AA3AF16576
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 10:57:15 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10124)
 with ESMTP id KIgWK_WibCz3 for <openbmc@lists.ozlabs.org>;
 Sat, 21 Oct 2017 10:57:15 +0200 (CEST)
Received: from [192.168.11.10] (unknown [185.137.174.251])
 by mail.hostpark.net (Postfix) with ESMTPA id F1DB216575
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 10:57:14 +0200 (CEST)
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Subject: PECI API?
To: OpenBMC <openbmc@lists.ozlabs.org>
Organization: ELSOFT AG
Message-ID: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
Date: Sat, 21 Oct 2017 10:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:51.0) Gecko/20100101 Firefox/51.0
 SeaMonkey/2.48
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Oct 2017 09:06:06 -0000

Hello

Is anyone working on an API definition for PECI?


Dave

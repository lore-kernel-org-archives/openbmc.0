Return-Path: <d.mueller@elsoft.ch>
X-Greylist: delayed 484 seconds by postgrey-1.36 at bilbo;
 Sat, 22 Jul 2017 18:41:06 AEST
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xF1Lp2NgszDqy0
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jul 2017 18:41:05 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 8F65C1679C
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jul 2017 10:32:55 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10124)
 with ESMTP id oym1a9sKpIng for <openbmc@lists.ozlabs.org>;
 Sat, 22 Jul 2017 10:32:55 +0200 (CEST)
Received: from [192.168.11.10] (80-219-76-43.dclient.hispeed.ch [80.219.76.43])
 by mail.hostpark.net (Postfix) with ESMTPA id D719E16799
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jul 2017 10:32:51 +0200 (CEST)
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Subject: How to define pins as open-collector?
To: OpenBMC <openbmc@lists.ozlabs.org>
Organization: ELSOFT AG
Message-ID: <0077221b-4d1d-26b5-ccf6-ede3b474443c@elsoft.ch>
Date: Sat, 22 Jul 2017 10:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:49.0) Gecko/20100101 Firefox/49.0
 SeaMonkey/2.46
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Sat, 22 Jul 2017 08:41:07 -0000

Hello

On our design we have several signals between the BMC and the rest of
the system which are driven by more than one source, therefore the
correspondig pins have to be defined as open-collector.

How can I define a pin as open-collector in the OpenBMC board wiring
conf file?


Dave

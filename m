Return-Path: <d.mueller@elsoft.ch>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=elsoft.ch
 (client-ip=212.243.197.30; helo=mail.hostpark.net;
 envelope-from=d.mueller@elsoft.ch; receiver=<UNKNOWN>)
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLrGH1NBpzDqR8
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 22:12:37 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 6F9B12951B;
 Tue, 24 Oct 2017 13:12:32 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10124)
 with ESMTP id WXedr7ugbcGg; Tue, 24 Oct 2017 13:12:32 +0200 (CEST)
Received: from [192.168.11.10] (unknown [185.137.174.251])
 by mail.hostpark.net (Postfix) with ESMTPA id 73DE129509;
 Tue, 24 Oct 2017 13:12:31 +0200 (CEST)
Subject: Re: PECI API?
To: "Tanous, Ed" <ed.tanous@intel.com>
References: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
 <7E9441B1E5EFFD4681F54958E82169932EAECC2A@ORSMSX105.amr.corp.intel.com>
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Organization: ELSOFT AG
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Message-ID: <a90a276b-2fce-fef1-919b-fbce3625af8d@elsoft.ch>
Date: Tue, 24 Oct 2017 13:12:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:51.0) Gecko/20100101 Firefox/51.0
 SeaMonkey/2.48
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932EAECC2A@ORSMSX105.amr.corp.intel.com>
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
X-List-Received-Date: Tue, 24 Oct 2017 11:12:39 -0000

Hello

Tanous, Ed wrote:

> What are you looking at doing with it?

PECI seems to play a major role in the communication between the BMC and
x86 CPUs, as a lot of the system control/status infrastructure is only
accessible by the BMC through PECI.

Possible use cases may be:

- Get CPU temperature.
- Get CPU machine check exception info.
- After a cold boot, delay CPU start until BMC is up and running.


Dave

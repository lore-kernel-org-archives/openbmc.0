Return-Path: <d.mueller@elsoft.ch>
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ6Y64zMBzDrG2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 19:45:46 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 94A8C16575;
 Thu, 27 Jul 2017 11:45:41 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10124)
 with ESMTP id 2O9ls0Xsoe-1; Thu, 27 Jul 2017 11:45:41 +0200 (CEST)
Received: from [192.168.11.10] (80-219-76-43.dclient.hispeed.ch [80.219.76.43])
 by mail.hostpark.net (Postfix) with ESMTPA id 7E79516541;
 Thu, 27 Jul 2017 11:45:40 +0200 (CEST)
Subject: Re: How to define pins as open-collector?
To: Andrew Jeffery <andrew@aj.id.au>
References: <0077221b-4d1d-26b5-ccf6-ede3b474443c@elsoft.ch>
 <1500765535.3132573.1049426776.498A1460@webmail.messagingengine.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Organization: ELSOFT AG
Message-ID: <e662dc30-14df-9e1e-b0ce-abeecfaa9df3@elsoft.ch>
Date: Thu, 27 Jul 2017 11:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:49.0) Gecko/20100101 Firefox/49.0
 SeaMonkey/2.46
MIME-Version: 1.0
In-Reply-To: <1500765535.3132573.1049426776.498A1460@webmail.messagingengine.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 27 Jul 2017 09:45:47 -0000

Andrew Jeffery wrote:

> If you're trying to do this via the python machine config file then it
> looks like you're out of luck, as the GPIO sysfs interface doesn't
> support configuring a pin in single-ended mode.

Looks like we have to redesign our hardware then.

Thanks for your clarification.

Dave

Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmW1X4nXMzDqDS
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 18:29:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3qmW1X3BJmz9t40;
 Fri, 15 Apr 2016 18:29:52 +1000 (AEST)
Subject: Re: [PATCH openbmc 0/3] Re-enable obmc-console and add a ssh endpoint
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>,
 openbmc@lists.ozlabs.org
References: <1460615435-26806-1-git-send-email-openbmc-patches@stwcx.xyz>
 <570FA5F1.1020201@fr.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <5710A67F.3030602@ozlabs.org>
Date: Fri, 15 Apr 2016 16:29:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <570FA5F1.1020201@fr.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2016 08:29:52 -0000

Hi Cédric,

> I tried it on a palmetto. Very nice. This is perfect for me.

Excellent, thanks for testing!

> For my education on the topic, what are the plans for the OpenBMC 
> host console ? Is obmc-console a temporary or a final solution ? 

obmc-console will be the final solution; however, it doesn't mean we
need to always use ssh-based access to the console.

It allows multiple "handlers" for the UART data. At present, we have
two handlers: one that copies to/from stdio (which we then pipe over
ssh), and one that logs the host UART data to a file.

For a websocket, we'd just need a new handler to implement that.

We also have a TODO for a handler to implement redirection back to a
local UART:

 https://github.com/openbmc/obmc-console/issues/3

Cheers,


Jeremy

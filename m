Return-Path: <d.mueller@elsoft.ch>
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rqrNz1LRdzDr13
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2016 19:43:30 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id F181D16B6F;
 Thu, 14 Jul 2016 11:43:24 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10124)
 with ESMTP id Flb-pdjOTSCo; Thu, 14 Jul 2016 11:43:24 +0200 (CEST)
Received: from [192.168.11.10] (80-219-76-43.dclient.hispeed.ch [80.219.76.43])
 by mail.hostpark.net (Postfix) with ESMTPA id A70AA16B37;
 Thu, 14 Jul 2016 11:43:21 +0200 (CEST)
Subject: Re: OpenBMC port to AST2400 on Piestewa Peak CRB?
To: Chris Austen <austenc@us.ibm.com>
Cc: Tian Fang <tfang@fb.com>, Patrick Williams <patrick@stwcx.xyz>,
 openbmc@lists.ozlabs.org, Teddy Reed <teddy@prosauce.org>
References: <57863637.3090405@elsoft.ch>
 <20160713162732.GB12735@asimov.austin.ibm.com> <57866FE0.3030300@fb.com>
 <OF905AF09B.91F8D431-ON86257FEF.007A0E85-86257FEF.007A1B87@notes.na.collabserv.com>
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Organization: ELSOFT AG
Message-ID: <57875EC7.1040103@elsoft.ch>
Date: Thu, 14 Jul 2016 11:43:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:43.0) Gecko/20100101 Firefox/43.0
 SeaMonkey/2.40
MIME-Version: 1.0
In-Reply-To: <OF905AF09B.91F8D431-ON86257FEF.007A0E85-86257FEF.007A1B87@notes.na.collabserv.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jul 2016 09:43:32 -0000

Hi Chris

Chris Austen wrote:

> is that something you would be interested in helping to develop?

Yes.

Some background:

We are currently designing a Intel Broadwell + AST2500 based system, for
which we tinkered with the idea of using OpenBMC.

My idea was to play around with OpenBMC on the Intel CRB to gain some
experience as long as our own hardware is not ready. Seems like it is
not as simple as I hoped.

Dave

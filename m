Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 324861A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 14:28:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id BCF37140BF8;
 Fri, 12 Feb 2016 14:28:01 +1100 (AEDT)
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
To: andrew@aj.id.au, Stewart Smith <stewart@linux.vnet.ibm.com>,
 Chris Austen <austenc@us.ibm.com>
References: <87io1vq04t.fsf@linux.vnet.ibm.com>
 <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1455152677.3153.81.camel@aj.id.au>
 <201602110544.u1B5ilIu004589@d03av01.boulder.ibm.com>
 <87vb5vne33.fsf@linux.vnet.ibm.com> <1455232163.2576.27.camel@aj.id.au>
Cc: openbmc@lists.ozlabs.org, openbmc-patches@stwcx.xyz
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56BD5140.5010409@ozlabs.org>
Date: Fri, 12 Feb 2016 11:28:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455232163.2576.27.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 12 Feb 2016 03:28:02 -0000

Hi all,

> Maybe this should be a separate thread, but anyway: I find the mailing
> -list/github split a little awkward - is there a way we can improve
> this? Use one xor the other?

I'd love to move to single option too - to keep to our
open-source-project roots, my vote is for using the mailing list.

However, the roadblock here is that our developers would need to be able
to email patches in an acceptable format, and I don't think many of our
contributors have to tools and/or infrastructure to do that at the
moment. If that were to be addressed, I think mailing-list based
workflow would be a great benefit to the project.

Regards,


Jeremy

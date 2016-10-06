Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqNly1jBHzDrPc
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 17:58:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sqNlx5x4Lz9s3s;
 Thu,  6 Oct 2016 17:58:37 +1100 (AEDT)
Subject: Re: [PATCH linux 14/15] drivers/fsi: Rename slave to cfam
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-15-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <6e8e9ea9-b728-8deb-8859-73904682b7cd@ozlabs.org>
Date: Thu, 6 Oct 2016 14:58:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475700868-75737-15-git-send-email-christopher.lee.bostic@gmail.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Thu, 06 Oct 2016 06:58:38 -0000

Hi Chris,

> Suggested changes to the patch set so far as provided by Jeremy Kerr.
> Rename slave to cfam to distinguish between the slave engine and its
> containing cfam.

I'm still not 100% on that. As is my understanding, a (hardware) CFAM
contains multiple slaves, and that not what `struct fsi_slave`
represents (it's a single slave).

> A few formatting changes to make checkpatch accept
> patches 0001-0013.

Those would be better split out. If you like, I can then take that
change and re-roll my original skeleton series with that incorporated.

Cheers,


Jeremy

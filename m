Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTyV80h6JzDqGk
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 15:16:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vTyV75LKJz9s7C;
 Fri, 24 Feb 2017 15:16:47 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v4] drivers/fsi: Add hub master support
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170224040626.99777-1-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <75a2465d-10b0-7511-b916-c734d602cd90@ozlabs.org>
Date: Fri, 24 Feb 2017 12:16:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170224040626.99777-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Fri, 24 Feb 2017 04:16:48 -0000

Hi Chris,

> Scan for links off of the mFSI master on CFAM. Add any devices
> detected to the existing list of FSI devices and notify any
> clients.
> 
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Assuming all the inits are correct in hub_master_init(), and the layout
in sysfs is sensible, looks good to me!

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy

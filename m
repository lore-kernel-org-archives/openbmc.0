Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPZ6r004lzDq8X
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 11:44:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vPZ6q4Rljz9s7w;
 Fri, 17 Feb 2017 11:44:51 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: Fix incremeting dev nums
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1487272856-9776-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <87cc8d63-9eb7-a812-c290-85ed73abdee2@ozlabs.org>
Date: Fri, 17 Feb 2017 08:44:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487272856-9776-1-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 17 Feb 2017 00:44:52 -0000

Hi Eddie,

> From: "Edward A. James" <eajames@us.ibm.com>
> 
> both for FSI master and scom client
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/fsi-core.c | 4 +++-
>  drivers/fsi/fsi-scom.c | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index e8a3618..7816482 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -46,7 +46,7 @@ static const int engine_page_size = 0x400;
>  static struct task_struct *master_ipoll;
>  static unsigned int fsi_ipoll_period_ms = 100;
>  
> -static atomic_t master_idx = ATOMIC_INIT(-1);
> +static atomic_t master_idx = ATOMIC_INIT(0);

This will mean that our first master is numbered 1 instead of zero. Not
a huge problem, but it doesn't sound like that's what you wanted to do
here.

>  struct fsi_slave {
>  	struct list_head	list_link;	/* Master's list of slaves */
> @@ -617,6 +617,8 @@ void fsi_master_unregister(struct fsi_master *master)
>  		kthread_stop(master_ipoll);
>  		master_ipoll = NULL;
>  	}
> +
> +	atomic_dec(&master_idx);

This doesn't work. Consider (starting from -1):

  - master_idx at -1
  - master added, assigned index 0, master_idx now at 0
  - master added, assigned index 1, master idx now at 1
  - master 0 removed, master_idx now at 0
  - master added, assigned index 1

now we have two masters with index 1.

Either we need to check for present masters, or use the ida functions
(as greg kh has suggested).

So, nak from me on this.

Regards,


Jeremy

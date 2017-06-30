Return-Path: <clg@kaod.org>
Received: from 5.mo2.mail-out.ovh.net (5.mo2.mail-out.ovh.net [87.98.181.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzcvp6LjyzDr62
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 23:34:45 +1000 (AEST)
Received: from player770.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id EDD949DB93
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 15:34:39 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 023503C013A;
 Fri, 30 Jun 2017 15:34:36 +0200 (CEST)
Subject: Re: [PATCH skiboot/pflash] libflash/libffs: Detect first byte flash
 corruption
To: Cyril Bur <cyril.bur@au1.ibm.com>, joel@jms.id.au, openbmc@lists.ozlabs.org
References: <20170628224041.14315-1-cyril.bur@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e61d5e06-459d-fe75-5ff0-97f407e2dc53@kaod.org>
Date: Fri, 30 Jun 2017 15:34:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170628224041.14315-1-cyril.bur@au1.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6012024027986103042
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrtdeigdeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 30 Jun 2017 13:34:47 -0000

On 06/29/2017 12:40 AM, Cyril Bur wrote:
> This patch is not for upstream but currently this unknown corruption is
> making life difficult.

From what I have seen on a couple of affected systems, the data is 
not corrupted but it's the first byte read which is bogus. After a
reboot, all comes back to normal. 

So we might have an issue with the optimize read settings and/or 
fast-read. This is difficult to corner. 

Has anyone seen this issue on the openbmc 4.7 kernel ? 
 
Thanks,

C.


> Perhaps it can be useful at least temporarily.
> 
> Feel free to remove the option to continue and leave just the
> information message.
> 
> Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
> ---
>  libflash/libffs.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/libflash/libffs.c b/libflash/libffs.c
> index 7ae9050e..dce6237e 100644
> --- a/libflash/libffs.c
> +++ b/libflash/libffs.c
> @@ -260,6 +260,35 @@ int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
>  
>  	/* Convert and check flash header */
>  	rc = ffs_check_convert_header(&f->hdr, &raw_hdr);
> +	/*
> +	 * A bug on witherspoon of currently unknown origin causes
> +	 * corruption of the first byte of flash. This is by no means
> +	 * a fix and should never go upstream but may prove helpful.
> +	 */
> +	if (rc == FFS_ERR_BAD_MAGIC) {
> +		/*
> +		 * We can set the first byte to what we know it should be
> +		 * and try to check and convert header again. If it
> +		 * succeeds there is a very high chance this is the
> +		 * problem.
> +		 */
> +		*(char *)&raw_hdr = 'P';
> +		rc = ffs_check_convert_header(&f->hdr, &raw_hdr);
> +		if (rc) {
> +			/*
> +			 * Turn it back into BAD_MAGIC, the flash obviously
> +			 * has bigger problems.
> +			 */
> +			rc = FFS_ERR_BAD_MAGIC;
> +		} else {
> +			FL_ERR("FFS: Detected corruption of the first byte of flash.\n");
> +			FL_ERR("     Recommend hard power cycling the entire machine\n");
> +			FL_ERR("     Continuing is dangerous!\n");
> +			FL_ERR("     Continuing in 10 seconds\n");
> +			sleep(10);
> +			rc = 0;
> +		}
> +	}
>  	if (rc) {
>  		FL_INF("FFS: Flash header not found. Code: %d\n", rc);
>  		goto out;
> 

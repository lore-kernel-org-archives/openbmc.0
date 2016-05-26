Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFVwY338xzDqZm
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 10:52:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nJLKDptd; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id gp3so184407pac.2
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 17:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fzFeEaFMJ9nm9O1TZFDqhHZ3LWIdFAJSHBsH7PyMXIo=;
 b=nJLKDptdnkUT8E+0iuHVjYH0Eo0NwOR+o2fA615kmPLfZbLzXRvFJEHTZskAwAN9ho
 cs+7dhlSUHn12T1OvaHtkiPCjljy4UVQ3DsDPIueMWzOz8+Q048c7kTt1J7CgCxfzI3U
 k1dWsgEhgNCce1Pm1WhkQqMocAMODCXpR02IBQx8G6O0/KVK98ZmPHTwJVXuvOgMwHGV
 nF0XZjM2I9/MBDqXnvkDFdsGqFOQGJKWi6e7Yz/ad9LnDukPeVU245GaNuyPwVWpus8G
 iyFvEv7ZGWtXnnwhVNgIH0wRPHL+t1gQsCmgckFsO+RJcJhpG7exD1EP+ATQgc7vlxWZ
 FBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fzFeEaFMJ9nm9O1TZFDqhHZ3LWIdFAJSHBsH7PyMXIo=;
 b=nHqEZG4fui8Y/wWI3t8blw9KbCCb7TJQjZ6PnksSX/mKcFu5iz/tcMSoGiwnDI+0Vn
 GDf9Zw7tV8xQrianjIiPKb/RHHTaYcjLYPnl1F7LyfcoB5+Ejqex3sNhzY1goi491Is1
 rbaMNplmCG+tbkNKgP9AyVj6WLDBaDcq0J5ReDchMxJGX5Q0vqH1IaKlukv7RM3cQfgj
 tXBKGuAUXw2cOOA255mABv2t7e0lbUMTirxSqs00J6Resbpkj7RxB3pSXT4OJuqJ6leb
 sid12CqD/PBmxqBhG2Rl8dCV5n8baOgLgtUzY6GnUf1bUvQk4ePW7g9pcbOjd+3mhTp5
 LvAg==
X-Gm-Message-State: ALyK8tL6XjXByx99BrSLt1cBxKZDxF2zrWtGUGHkxiINfBB5mbOqkfZsW0RYwEAkrP26uQ==
X-Received: by 10.66.132.72 with SMTP id os8mr9963805pab.63.1464223931096;
 Wed, 25 May 2016 17:52:11 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b19sm1150280pfb.55.2016.05.25.17.52.09
 (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 25 May 2016 17:52:10 -0700 (PDT)
Date: Thu, 26 May 2016 10:52:02 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Nan Li <bjlinan@cn.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openpower-host-ipmi-oem 2/2] Fix endianness issue5
Message-ID: <20160526105202.22c2a9ee@camb691>
In-Reply-To: <20160524094037.16462-3-openbmc-patches@stwcx.xyz>
References: <20160524094037.16462-1-openbmc-patches@stwcx.xyz>
 <20160524094037.16462-3-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 26 May 2016 00:52:14 -0000

On Tue, 24 May 2016 04:40:37 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Nan Li <bjlinan@cn.ibm.com>
> 
> Make it safe in both little-endian and big-endian bmc chip.
> 

Hi Nan,

Comments below.

> Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
> ---
>  oemhandler.C | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/oemhandler.C b/oemhandler.C
> index 026e0d1..6716618 100644
> --- a/oemhandler.C
> +++ b/oemhandler.C
> @@ -30,8 +30,8 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  	FILE *fp;
>  	int r = 0;
>  	// TODO: Issue 5: This is not endian-safe.
> -	short *recid  =  (short*) &reqptr->selrecordls;
> -	short *offset =  (short*) &reqptr->offsetls;
> +	unsigned short recid  =  ((unsigned short) reqptr->selrecordls) << 8 + reqptr->selrecordms;
> +	unsigned short offset =  ((unsigned short) reqptr->offsetls) << 8 + reqptr->offsetms;

So, what you're trying to do is have recid and offset be in host cpu endian and
the data that reqptr points to is in a fixed and known endian?

I'm not convinced what you have got this right, in the case where the host and
the data are in the same endian, shouldn't this do nothing, but, regardless,
this will do something...

If you look at endian.h `man 3 endian` it provides you with some very nice
convenience conversion functions which ensure you get it right and make it so
much easier to read and understand the code.

By the looks of it you want something like be16toh() or le16toh().

>  	uint8_t rlen;
>  	ipmi_ret_t rc = IPMI_CC_OK;
>  	const char *pio;
> @@ -59,7 +59,7 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  
>      // OpenPOWER Host Interface spec says if RecordID and Offset are
>  	// 0 then then this is a new request
> -	if (!*recid && !*offset)
> +	if (!recid && !offset)
>  		pio = "wb";
>  	else
>  		pio = "rb+";
> @@ -67,10 +67,10 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  	rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
>  
>  	printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
> -		g_esel_path, *offset, rlen);
> +		g_esel_path, offset, rlen);
>  
>  	if ((fp = fopen(g_esel_path, pio)) != NULL) {
> -		fseek(fp, *offset, SEEK_SET);
> +		fseek(fp, offset, SEEK_SET);
>  		fwrite(reqptr+1,rlen,1,fp);
>  		fclose(fp);
>  

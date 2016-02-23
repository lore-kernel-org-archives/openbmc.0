Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com
 [IPv6:2607:f8b0:4003:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9E7B21A0622
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 09:56:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=EOJXKY+l; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=J6mycJKZ; 
 dkim-atps=neutral
Received: by mail-oi0-x22f.google.com with SMTP id x21so706036oix.2
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 14:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=4TdzvX5k1SCdB0ISE9OE/Z6A/YbDKY8Y34SFbffw8go=;
 b=EOJXKY+lfluYHCflMG6Pe1Zlt7gbgEmSRAH3oQUnsA0fld+Fr3lifFm+JB+Qua5y78
 2YzyFD+ntDFKqWWRvEY7h97zg4nK/39HVdzG9y2CcLTLEJxXkF3UR4Lw20aYU22cjp2a
 ku7uxn7kSq6nbvuvo42QkYIBg6tUFIl5PxcOSrMXd3nrMG582sAirp0qARjJZCl1XW4b
 he9suuejvEqpccwg9UnPKIiVppcmt05hGlWoZOwtuzHOVTqkukDIeAHDB2wAw6FLW/bN
 9KCs7SXTUmmQ7fLU6EmSog3tM8x8Y7vOem1bwBYgx+IG2x0AMzyitRjwhLX5sTFqtE6j
 6DuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=4TdzvX5k1SCdB0ISE9OE/Z6A/YbDKY8Y34SFbffw8go=;
 b=J6mycJKZvrF+O6Ubc5KF9GvtdQzzNR+7iTxk2Ic9L/x/6iBVPA8q9lcfHU3YY5HV0/
 rvKZpZicKUWdgxbyq0Y1iJ3q7JAfS2Aas23BcKjo7B4MuBlQQ1fo7Uc3cT2uSJV7YF0s
 6m8Pb+sAHt+qZqQuJ/TXsMgnjh5mUlZfhYg9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=4TdzvX5k1SCdB0ISE9OE/Z6A/YbDKY8Y34SFbffw8go=;
 b=G6fMf56lKg3CcQjlFRdH6bdok1Ejxg2MfbxjcGzU46F7tXoLXLqQiMPXUkTXss1TVB
 epD1ZlLrzEnSMc4zdHbElw15dp/xds4xUpp4gzZz10QB2b+4x5mWJ74h2vJ5EvF1E0IP
 hKgPaxF0i8ISHIhQp4WKnM2FQYxs+Xn0XSGX6STekTqYRd/exGKRExC50dbkY2woQSMh
 LZqnl8KMM/SrEPAHT+MEfPUZAv32lo5VQPTt6oTeezYjAbcN5nzoNhv+zuK2vUPDldDW
 RyL+YuaHEvIepqaZ+78IRwVCLK0XBcA1Ww4B9MgvEaeMdIA7wDF5oVdRbxJPe4mp82zw
 NsfQ==
X-Gm-Message-State: AG10YOStjxUm2HCE5Q5Ie1iCoyVHpWC++Nv9D/lcqwnJh/LC7LjPVcu8xVwQdZfEtcPKd3EqAJ+MIWEnXcZFOg==
X-Received: by 10.202.104.169 with SMTP id o41mr28724337oik.57.1456268175601; 
 Tue, 23 Feb 2016 14:56:15 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Tue, 23 Feb 2016 14:55:56 -0800 (PST)
In-Reply-To: <1456238703-11117-3-git-send-email-andrew@aj.id.au>
References: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-3-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Feb 2016 09:25:56 +1030
X-Google-Sender-Auth: MFkP9vEbN403BHUXxRx-MX2YdXU
Message-ID: <CACPK8XeSaRoLM04GdCJbWpx50j-kmMP-=vMroJag7ye9_=+a4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] obmc-init.sh: Fix FS type in mount failure message
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 23 Feb 2016 22:56:19 -0000

On Wed, Feb 24, 2016 at 1:14 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> index 6750de3..9674765 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> @@ -114,7 +114,7 @@ then
>         msg="$(cat)" << HERE
>
>  Mounting read-write $rwdev filesystem failed.  Please fix and run
> -       mount $rwdev $rwdir -t $rwfs -o $rwopts
> +       mount $rwdev $rwdir -t $rwfst -o $rwopts
>  to to continue, or do change nothing to run from RAM for this boot.
>  HERE
>         debug_takeover "$msg"
> --
> 2.5.0
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

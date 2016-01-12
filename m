Return-Path: <dja@axtens.net>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C3ED61A0050
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 11:00:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=XbXe1hWE; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id pv5so26125821pac.0
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 16:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=5y9f/86tRgy/QaRyZkQFldMCR8Qsa9mtsVv+AyOL/NY=;
 b=XbXe1hWEu2m6H1Z09haLw7qG5bQbTpU1U3ZOH+jbGX+cpLGnM7rlEbpzxPHli6pT27
 +7Ta2KUEx4ICq2PDnvE4irDq8HoPfnU34KSMlhiXyUHC4dFE2tTOuwsUo0lRxP02ffv2
 jUx/Cv65MkhJYeDopJPRTljWXuB3SdHAat97c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=5y9f/86tRgy/QaRyZkQFldMCR8Qsa9mtsVv+AyOL/NY=;
 b=REohziPFsYBc8I4GszSjs1Cn4m/9f4pIW0s+syC30Ub/pJWKmoP6qONG+kfX1I19KS
 Y1/lxVtFcsDfEelC0VRi8RuMfZfFalL8afWCXbdUQNUUOEaVPUgMlkihRfT4YU7ugD2V
 tQgTDZa/mis/e+wSp3HdkeLSgjagx+ZPR9mbKJGAUEC5Sbc3q+7tnOVHRqLzoqAWxPdE
 ON9ycaL3fcU9XsPW5Q+QKW8CaANJ2bfIbH+Y8lKjoBogQiv7mQWMhD2RPknbQ6bjs79n
 FE0hCy1z432WcH8dhwIUtusM833W9wFs/4/KHTRHCcywE4EdVjsQ0/6iMU6FesdsAHQn
 PkfQ==
X-Gm-Message-State: ALoCoQkXptxEtG/ND8MD1V2szOuytY7DZ0v3KnGWAVbYCf/NvuF4jxJBo+W86AyJJ01/W8aO0tvjVY05b14fg4aI2cGg9wvg+Q==
X-Received: by 10.66.236.103 with SMTP id ut7mr38776668pac.4.1452556830306;
 Mon, 11 Jan 2016 16:00:30 -0800 (PST)
Received: from localhost (ppp121-45-193-224.lns20.cbr1.internode.on.net.
 [121.45.193.224])
 by smtp.gmail.com with ESMTPSA id lq10sm105064866pab.36.2016.01.11.16.00.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2016 16:00:29 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc-test-automation 00/60] Pull Manjunath's automation
 repository
In-Reply-To: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Tue, 12 Jan 2016 11:00:19 +1100
Message-ID: <874mej7jl8.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-List-Received-Date: Tue, 12 Jan 2016 00:00:34 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

I don't suppose there's any way we could get this cleaned up to make
review easier?

Maybe merging things like the commits below into commits they fix?
>   fixed review comments
>   fix review comment
>   Modified the doc
>   Fix errors
>   fix review comment
>   Fix errors
>   first commit
>   first commit

And giving these better names?
>   added files
>   added log statement
>   added files
>   added log statement
>   Update README.md
>   Update README.md

If not I guess tests > no tests regardless...

Regards,
Daniel

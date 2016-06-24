Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbNCp1FtQzDqlS
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:52:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=RdYTceHB; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id j2so18986927qkf.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fbf6SJoNxmCJGC9g87lpi6V9Tmm/w9UrKN1RK9GIMh4=;
 b=RdYTceHBszH7tgol+3EDKnn57wMed2s2FZKRWQPJp6mDkT83/tO39KF+UggapYYd6e
 HhqQML6IUGmqI2YHxueiz0nxZaKZxgLR1tl02s+ikqvDiCt9OS4gQytroLPuNkOknbDm
 ExIrryK0JAsQGfc+CCShfTA6YcN8PCP9lUL7QcAL3ZGTGl1/xIBATMi0uP5+ouZowXMC
 PkGiho+wzdQMsxi/cQkLyx1oRsIcN7sjIJxADhb3HB6bRqDD/fn3NXWAQ5/91GUaRzUY
 56jkKzfkfJ703+OTBjWVOI55t3vyQQIrD+Knieqqr8GUqdln73+JDypS56BNYVtLhJIw
 Ig8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fbf6SJoNxmCJGC9g87lpi6V9Tmm/w9UrKN1RK9GIMh4=;
 b=bjUfJMmPYN1OJ0Zr8IEcOlN9Oc9AHA4jJ7p2bpPyribXFSSL/3PrA0VwwVkPcSR3AH
 CyHOE4mU2jq+qaDUhEhzb/QFg3Ti+F7iq4PGdWii2++qNH2Nyk8mW0hwHqa4jMC/7PQt
 PVb9EEK0QhLoNgjJ+mAZpEcTfSARozTEQ3fu6631DhoGEuhK2XTInFiBE09kLOyUmhZe
 kEayqs8w36VLwBCgR3yEP0qFvTuIGnRJKQYMv/qsJm1TpSS6ljFN12e8CvfjYzwOMNnq
 ECmmzGv3RlL0Yzb1zmT8wv508xC8SgjK4W4rxmkzyeug78Uq6E1MKWbqJVM+bupQR84C
 QAAw==
X-Gm-Message-State: ALyK8tJjUWSeWg0xzL4QjENLRGDdJseMOFD57AgYz43oI8eW1OYP+et8OBneHNSUc+BA3v0PsGU9zfJJtsksvw==
X-Received: by 10.55.40.68 with SMTP id o65mr1809973qkh.201.1466736740102;
 Thu, 23 Jun 2016 19:52:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:52:00 -0700 (PDT)
In-Reply-To: <20160623204033.13165-9-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-9-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:22:00 +0930
X-Google-Sender-Auth: 6ArL8EGleOdfC5f7JoTzrpsTSUQ
Message-ID: <CACPK8XfG-PwHDeNSW-=ymYvmPqQtnMrtL4uu4oU1i=YF6X3Hxg@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 08/11] Fix systemd packageconfig
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 24 Jun 2016 02:52:22 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> PACKAGECONFIG is typically set with '??=' in the base recipe.  In our
> systemd append it was being set with += which overrides the weak
> default (??=) so none of the default configure options were used.  This
> patch corrects that and then removes all the default options we don't
> need.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
> index 8b3b25d..9ad6a40 100644
> --- a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
> +++ b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
> @@ -1,4 +1,5 @@
> -PACKAGECONFIG += "networkd"
> +PACKAGECONFIG_append = " networkd"
> +PACKAGECONFIG_remove = "machined hibernate ldconfig binfmt backlight quotacheck localed kdbus ima smack polkit"
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
>  SRC_URI += "file://default.network"
>
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

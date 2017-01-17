Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x244.google.com (mail-ot0-x244.google.com
 [IPv6:2607:f8b0:4003:c0f::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2WLP47xqzDqSY
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 11:33:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eygwRaWA"; 
 dkim-atps=neutral
Received: by mail-ot0-x244.google.com with SMTP id f9so7842042otd.0
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=TAL2dfMN4hJGZxNf/V/qlfTlizrGyW9xRDEoWAp2PN0=;
 b=eygwRaWA/6UgA2Nny60NKxJYorrJXC+mnDTJ9s2s1Q6IUv6jM7y7KDTkVfsm/Ozy5q
 jsD9WvkaQAlUxjYtSV8tqJ+CDGYh1TKJDM5ZcWSWfF6jK12CSEKf2hkklve88xVHNp3V
 a+z61IycIEk5jRCm2miXKhiStgJmmj3Z2GAcQVRWmccfr8JG9UPd481eSqBywM5VbJMh
 B2qMEOd8Yr7/CzaSlruNjgOt7CWUIge8x2cnO7V7kLFrFbdv9vKZw1BgOl6TNUkQlucC
 Zo/rJ9mfqmMcVnmWq0O4oUeETjHm6X2YB842tUCpnz05dV7r4NzPObym8l6lZytFMQOo
 N37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=TAL2dfMN4hJGZxNf/V/qlfTlizrGyW9xRDEoWAp2PN0=;
 b=GbU+cYqJg6BzMKN/JgyHEAZ3wKe9nMjINpI8Q3bgn71I4WMgURofKKKfl5tImcaEFZ
 P3nf3GoZ2ytcDUg0IOiQ7HEj1C/Kwr1ogmmeKpfc+VG4URPoU+awktILnJIv0pMT8vp+
 6IWA6zUQwYKBYf8fuhkHBIedZ5ruFgyS2dq1NQyr151wqVXAHTJoKmUbxhABdrlllizP
 Y595Bj83TyxOURAJxUT6DcpDqFHrndoX5/i2jk0dlSU5yoCNMu6/W+vxEwOZvya3t6zT
 OUNo+TzdiaW1Z5knvkpmZz6T3tKSnwPGvtmNlDaX6G2+L1LGga7H6YT/8j1VCv4pQ4Ta
 /I3w==
X-Gm-Message-State: AIkVDXJlAPgbyStKpCjt2d+7usWZpOvis+XmINM2g6FGzxLrrhkeo5/t8sCXQDgk49s+s8zUDi7rw/ywzUVMzA==
X-Received: by 10.157.17.212 with SMTP id y20mr16804721oty.230.1484613227420; 
 Mon, 16 Jan 2017 16:33:47 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Mon, 16 Jan 2017 16:33:26 -0800 (PST)
In-Reply-To: <20170112021328.27200-3-raltherr@google.com>
References: <20170112021328.27200-3-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Jan 2017 11:33:26 +1100
X-Google-Sender-Auth: zi3jHYY41EEZKTGK0dlAK6q8eFo
Message-ID: <CACPK8Xd3LtSZ3i_r19AZtVMxRLxXnQwOw8oQc+eS7b5iJvWS9A@mail.gmail.com>
Subject: Re: [U-Boot,2/2] aspeed: use FIT-provided ramdisk if available
To: Rick Altherr <raltherr@google.com>, Simon Glass <sjg@chromium.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 17 Jan 2017 00:33:50 -0000

On Thu, Jan 12, 2017 at 1:13 PM, Rick Altherr <raltherr@google.com> wrote:
> If the kernel FIT specifies a ramdisk, use it.  Otherwise, expect a
> ramdisk at 0x20300000.
>
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>
>  include/configs/ast-common.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
> index b39ea33ce7..110c780070 100644
> --- a/include/configs/ast-common.h
> +++ b/include/configs/ast-common.h
> @@ -96,7 +96,11 @@
>  #define CONFIG_ENV_OFFSET              0x60000 /* environment starts here  */
>  #define CONFIG_ENV_SIZE                        0x20000 /* Total Size of Environment Sector */
>
> -#define CONFIG_BOOTCOMMAND     "bootm 20080000 20300000"
> +#define CONFIG_BOOTCOMMAND     \
> +       "fdt addr 20080000; " \
> +       "if fdt get value ramdisk_conf /configurations/conf@1 ramdisk; then " \
> +       "    bootm 20080000; else bootm 20080000 20300000; " \
> +       "fi"

This feels a little clunky. Is this the method upstream suggests to
solve this problem?

Cheers,

Joel

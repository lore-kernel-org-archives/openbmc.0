Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVFPg0XnkzDq6W
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 14:27:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ocbioF0C; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id n5so599583pfn.1
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 20:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rxoMw34u2FQtDTxwq3KTgfKIPBK3eDGsADArcXIZZDc=;
 b=ocbioF0CwgXGS02UEBAt5om5v8dFI2UZogYA29ttV66eQJhlaoawXio3t6xPeY1gbI
 NMItDYDUnsNxBdiO8/L5pbO3U5rszc2xUSCyqyZ9SeLKx+BoCc5mkTsgw16l7mriuKUy
 u2kJPa+8hr5fHwfs/fauLcGEPYlL17zQULLmW7uZtHdYlE5Po2IUyPjG+dA4XPVOuWdG
 m0EQS556Unrffp/O/77UaCUPbBVFERcLkG+S/D+gMcKUI4z6bcfXX4CYLaG8fM3hL4kq
 cQVsQ5Kx9f3ZZmHh0mbvyeQ1zqDKZ4nYeiHvXDOmIppsdWziUIuDTBLiFupteKGh0Scg
 N0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rxoMw34u2FQtDTxwq3KTgfKIPBK3eDGsADArcXIZZDc=;
 b=mcslz0aH3C1VAac7iktbbHxn2A5I5yaDA6P/ySOJhU+Wmj9JYAysqW3lWFZ2QIlFUo
 3ibbf8ysR1xLq8/2jE80IvQMu/P3nDbuAPFRGmHFc0ilNKacqx25ujcOE2YgGIWrtam3
 JVyl6Nny5nMlCNAF8wHTF0zBrlCkAD7yljepgk0k/noFlXF+1suMP+Do0CIsTIfVV5VG
 VxqsHQZBaMILbWB/9YA+qi3GsCCS24cZ1eDJe4EDwM0sdeOHJC0SpDX0Qq65ncrZfkAD
 VVB4QCGyKd2sDwQvUWMCLzJzOmwQlbtQjdUUPVDLrpQAFXBBlpzGv2HZUQjsHDtQgzmb
 0dhA==
X-Gm-Message-State: AD7BkJJeK5G65uqvVsFakEt3H/fGbp67nWk6a4caidz61Cw2Yr/V+hG/cTro15YtThikMw==
X-Received: by 10.98.19.151 with SMTP id 23mr828347pft.31.1458703668609;
 Tue, 22 Mar 2016 20:27:48 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s64sm434963pfi.77.2016.03.22.20.27.46
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 22 Mar 2016 20:27:48 -0700 (PDT)
Date: Wed, 23 Mar 2016 14:27:39 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: Ken <ken1029@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton 5/8] fix info memory leak
Message-ID: <20160323142739.55af7096@camb691>
In-Reply-To: <1458696656-28363-6-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458696656-28363-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1458696656-28363-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Wed, 23 Mar 2016 03:27:51 -0000

On Tue, 22 Mar 2016 20:30:53 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Ken <ken1029@gmail.com>
> 
> ---
>  objects/info.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/objects/info.c b/objects/info.c
> index ab2d98c..d872c3f 100644
> --- a/objects/info.c
> +++ b/objects/info.c
> @@ -42,6 +42,7 @@ static int i2c_open() {
>    fd = open(fn, O_RDWR);
>    if (fd == -1) {
>      LOG_ERR(errno, "Failed to open i2c device %s", fn);
> +    close(fd);
>      return -1;
>    }

Hi Ken,

This hunk is not needed.

>  
> @@ -108,6 +109,7 @@ static int i2c_io(int fd) {
>    rc = ioctl(fd, I2C_RDWR, &data);
>    if (rc < 0) {
>      LOG_ERR(errno, "Failed to do raw io");
> +    close(fd);
>      return -1;
>    }
>  
> @@ -126,6 +128,7 @@ int get_hdd_status(void)
>    }
>  
>    if (i2c_io(fd) < 0) {
> +    close(fd);
>      return -1;
>    }
>  
> @@ -145,7 +148,7 @@ int get_hdd_status(void)
>  
>      g_read_tmp[2]=g_read_bytes[2];
>      g_read_tmp[3]=g_read_bytes[3];
> -
> +    close(fd);
>  }
>  
>  int send_esel_to_dbus(const char *desc, const char *sev, const char *details, uint8_t *debug, size_t debuglen) {

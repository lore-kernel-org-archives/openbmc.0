Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D8Py2qa2"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42dnGW4rM0zDrb6
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 17:50:43 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id u74-v6so31307101oia.11
 for <openbmc@lists.ozlabs.org>; Sun, 21 Oct 2018 23:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ae7VE3JYSCEoki2fmZXON2fKQpxjgNRPZqEDbd3u5VY=;
 b=D8Py2qa2D8lSFuOAtjkQv8vG/NbgVEeoWmq0D0EM3U2oDXORCD5jiPWwvZXBiJl21F
 QupOjqxQ5Qv4q793lvScgs6+HR4mDscn3DOae/hI0ylHgimKqwxMD0e4651Cfo3PPlqU
 jUZmU0SLXtwzdbRq/ZfrgJmxZq6kYAhluxl3CiElYk/1QZUjoVtkUb0hBdOoKDUHy36g
 sGaso5tKjm4BESlTUc9Zv27VX7DmB9vGHludDACwS6tHN2SeW9LTQgoRnYMqCDyIJETX
 woPO+E1m/Q62ViePHe9zjKhXHHH/aLK0rvjhCavi2JhqBDVsPIFP9zosxpKh6UZghKzd
 fzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ae7VE3JYSCEoki2fmZXON2fKQpxjgNRPZqEDbd3u5VY=;
 b=cR2urMg1rZTTEeeFgwtTVZmXNNiSr4nqdaPEaITHlfhjKvFRcysX21nO95BOHNQtZ3
 WD5XGTWKsh+eAQRdIkPHo4J14whfFh6iOqZXCYBc+23GsltI4S4ysmGGI1cymZaNFgcq
 +koAq1HMyKYM5dlMtZ8HIRMxUBPk62zICCBsjmgEh+Wyi3uzthvQgq9llOsvcMVRoKdf
 0vmxO5cvPKFfs96SzIpA/YZIF4GjTnmRKAgzbG6eTgFw9/RprfCq8VX3Kze8Y27HZLIq
 yIHUpgLB1Ti5Q/MMRf9Sc2Ajz/lpwuBe2jzIYQjv8GjUv2czmz2QXNYGCqUtmlRmua6n
 E8eQ==
X-Gm-Message-State: ABuFfohjGNt6FkrSuIy/rpw5GAZ2Ri8tKPXaEyMCKC6EwC7CbVOOV438
 5YFcadQjl/KIiCGT9VgRdR+Tl4Rq0suMudc6Uis=
X-Google-Smtp-Source: ACcGV62gMH4z2kmjE2Zb4Q++O+50fEeIkCssZ2gw+p3WT4d3zyBPFAJ7JKPVxx+JA3oKSxe7IcO6B/bNTp4Hv15QIQ4=
X-Received: by 2002:aca:f0d6:: with SMTP id
 o205-v6mr22207483oih.138.1540191041202; 
 Sun, 21 Oct 2018 23:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLHQWZBkVqNHHt1FFvatP4dxrSgJz39PO4Ogbqg1wdosGw@mail.gmail.com>
In-Reply-To: <CAE33tLHQWZBkVqNHHt1FFvatP4dxrSgJz39PO4Ogbqg1wdosGw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 22 Oct 2018 14:50:29 +0800
Message-ID: <CAARXrt=20s9HgV_FYuEgwt9-CEvdH6Pi1RrNHNuZs6by1ARhZw@mail.gmail.com>
Subject: Re: Read registers in AST-2500
To: AKASH G J <akashgj91@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2018 06:50:44 -0000

On Mon, Oct 22, 2018 at 2:37 PM AKASH G J <akashgj91@gmail.com> wrote:
>
> Hi all,
>
> I used the following code to get the value of the control register 'SCU13C' in BMC Aspeed AST-2500.
>
> #include<stdio.h>
>
> #define SCU13C_ADDR 0x1E6E213C
> int main()
> {
> long reg;
> reg=123;
> reg = *(volatile long *)(SCU13C_ADDR);

This is getting value from virtual address of the process, it is not related
to physical address at all.
You need to use "devmem" tool to read registers, which will handle the memory
mapping.

Note:
1. "devmem" depends on "/dev/mem" device, which depends on kernel config
   "CONFIG_DEVMEM"
2. With the patch
https://lists.ozlabs.org/pipermail/openbmc/2018-October/013665.html,
   you could use "DEVMEM_BOOTPARAM" and add 'mem.devmem' in kernel command
   line to enable the device.

Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 431Pbj2CsrzDqSr
 for <openbmc@lists.ozlabs.org>; Fri, 23 Nov 2018 16:13:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="tCS4mK0O"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 431Pbh5j0mz9ryk;
 Fri, 23 Nov 2018 16:13:36 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1542950017; bh=Fp7F9Q+Rz6JzG+i+S3HlILarxy/1aCSHlNPoX2PgCco=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=tCS4mK0OSNFZ52R7oFwJgPa8N6zRlcRhHC9R7Zay7+wszDx3dDNDCYtBBcewFBMiH
 FbiG1isJu0uhH5qNdgDrACNa6xXDKKNN45H0IfT3tZ+MizcxCRGJGHA2HJkJNLU03O
 PJ7CGdOCjWeZZMDdNRiIWrOpzIK/dk39y8SfvOV/2+DI7WlYe7rsvu02uDgrgLu/Sr
 VZdMDkhFy6d0eFBHimWG/VqnVW0AAgjDOETNb7Q2Y/Dtqa8M7piRTz9IRdx3xYSJkG
 u+omwRJUuMUCENMr+K/LJh6NVVyqWK3/9waPCCHZEMMi/AZb9v0mUzOZMAmMXOVPRb
 3hefZymyxzdfQ==
Message-ID: <54d6a0985b858c42671abf294cd64dec1970df5b.camel@ozlabs.org>
Subject: Re: SOL,obmc-console-client can't connect to the host OS
From: Jeremy Kerr <jk@ozlabs.org>
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>
Date: Fri, 23 Nov 2018 13:13:36 +0800
In-Reply-To: <tencent_3E424D8E19D15B754896EDBB@qq.com>
References: <mailman.13.1542934803.27188.openbmc@lists.ozlabs.org>
 <tencent_3E424D8E19D15B754896EDBB@qq.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 23 Nov 2018 05:13:38 -0000

Hi Xiuzhi,

> I am debugging the SOL, the obmc-console-client didn't work.
> My BMC and host OS runtime environments are:  
> 1, BMC: 
> 1) obmc-console-server is good
> # systemctl status obmc-console\@ttyVUART0
> [[0;1;32m●[[0m obmc-console@ttyVUART0.service - Phosphor Console Muxer
> listening on device /dev/ttyVUART0
>    Loaded: loaded (/lib/systemd/system/obmc-console@.service;
> indirect; vendor preset: enabled)
>    Active: [[0;1;32mactive (running)[[0m since Fri 1998-01-02 19:42:56
> UTC; 38min ago
>  Main PID: 1616 (obmc-console-se)
>    CGroup: /system.slice/system-obmc\
> x2dconsole.slice/obmc-console@ttyVUART0.service
>            └─1616 obmc-console-server --config /etc/obmc-console.conf
> ttyVUART0
> 
> Jan 02 19:42:56 haiguang1 systemd[1]: Started Phosphor Console Muxer
> listening on device /dev/ttyVUART0.
> 2) /etc/ obmc-console.conf
> lpc-address = 0x3f8
> sirq = 4
> local-tty = ttyS0
> local-tty-baud = 115200
> 
> 2, Host OS: redhat 7

What hardware platform is this?

> It seemed to lock and output nothing when I run "obmc-console-client"
> on BMC. And there is nothing in the log /var/log/obmc-console.log

This doesn't necessarily indicate a problem with the BMC though - are
you sure that the host is connecting something (like a getty) to its
serial device? Is there something on the host side of the serial
connection? (what are you expecting to see there?)

If the host is definitely using up that serial console, this could
either be an issue with the obmc-console infrastructure, or the UART
devices.

You can split up the debugging to eliminate parts of the stack there.
Try:

  - Stop obmc-console-server

  - from the BMC, read directly from the VUART (say,
    `cat /dev/ttyVUART0`)

  - from the host, write to the UART (`echo hello > /dev/ttyS0`, 
    changing to whatever tty is connected to the BMC, if it isn't
    ttyS0.).

If that works, then you know that the UART channel is OK, and it's
either obmc-console, or that nothing on the host is using that serial
port.

Regards,


Jeremy

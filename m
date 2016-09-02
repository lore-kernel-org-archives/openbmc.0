Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sQRsq4TL1zDrns
 for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2016 15:06:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WXkebyKX; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 35so6974832uaj.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Sep 2016 22:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qCNrp8XeOtdMyDHpps35DWM06HsI9E55XsXu6gbTjmU=;
 b=WXkebyKXlDQfxNxRnApCjUwuH5l+/Ep+Ym+5K29zsLbvmPcppn45SAid9ty48Ndmrw
 VG4wpvELyVUfw6fJ4MmZA6d4o1NlVOS7n55nUYNqGlkQexnWKtpgBLlxs34jPbixDbzI
 tFQdS5D1sGFp56ApPtDCuTmULEBV7av3O3LnXOy0NOQQtMzwR20DiNBrpnTZJSYsJKq7
 Rn/K7TBHfm/fnk7hwpcpF3B5ldFaqdKx7Bpxn5uXdPqLnb1xFMeuSIjQtXI44H/coxMC
 rFFLst0zP5Bk021n77AAXawVYH/MLj/Pl6rGj9DfYQ4oGxomfeg/ulObT4jMylxhGL/a
 UNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qCNrp8XeOtdMyDHpps35DWM06HsI9E55XsXu6gbTjmU=;
 b=YeMvqkJxe0EBmwBmczohge2T8Mm/VqdDwQz99tgOIet1G/6irY9VVMrqc5Gbi1isKM
 /kF/6J2s2x+1conHga9Y3Z0wdcVF3WpRpqIckQhbpgbuw3H2ZC6Y/N9vp+ZivzOchS4+
 /mltn2pQDwJRGWgdjM+nkAa+Dm2dnn8YDrSFx+LK8dBiu4uWGKn9uMPQ+2Lw8ME21qjb
 T9fpiNa1bqWocOqVpue9PwstlH424cgLaVNwm0BHKKimtKbSL2TlUmal43vIfl0nDRP0
 Rxp5SoHLGM8MFY8s2V2qAdUaOt8GyZ5TDTzxO5hacn7ZEQKDGako+CgDQUorvW57+sCA
 isKg==
X-Gm-Message-State: AE9vXwOK6KojsSAIqVGJmBd4kM7dgPutZZ1To4eMu9yKanvlvO6QaW7JO2AlnJV8wPf9wq7lY/a3+efXhn4qrA==
X-Received: by 10.176.6.6 with SMTP id f6mr9752674uaf.46.1472792765381; Thu,
 01 Sep 2016 22:06:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Thu, 1 Sep 2016 22:05:44 -0700 (PDT)
In-Reply-To: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Sep 2016 14:35:44 +0930
X-Google-Sender-Auth: KdwC126g_uapTWbD3ef8LGz8rtg
Message-ID: <CACPK8XfTS+jyVGFRXZxPb4MQD3rzbFXmjQbqFn5c=aq+HopqkQ@mail.gmail.com>
Subject: Re: [PATCH linux v5 0/7] Introducing the FSI device driver
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>
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
X-List-Received-Date: Fri, 02 Sep 2016 05:06:08 -0000

Hi Chris,

On Thu, Aug 25, 2016 at 5:24 AM,  <christopher.lee.bostic@gmail.com> wrote:
> From: Chris Bostic <cbostic@us.ibm.com>
>
> Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
> driver. FSI is a high fan out serial bus consisting of a clock and a serial
> data line capable of running at speeds up to 166 MHz.

Nice work on the cover letter. It's a good introduction.

I haven't had a chance to take a close look a the patches yet. They
are on top of the stack for Monday.

I was wondering if you have had a look at Jeremy's implementation yet?
If so, are there any ideas you have incorporated into your series?

Cheers,

Joel

>
> This set provides the core functionality of the FSI device driver.  Core
> function is defined as:
>     *  FSI client registration and notification of bus state changes
>     *  Device scanning and hotplug reporting to clients
>     *  Interrupt detection and routing
>     *  Bus error detection and cleanup
>
> This patch set does not include extended FSI function such as:
>     *  Hub master support
>     *  Cascaded master support
>     *  Application layer hot plug notification
>     *  Application layer FSI bus status interface
>     *  Host configuration allowing for various hardware / firmware
>        emulation implementations of the FSI master.
>     *  Soft FSI support.  Soft FSI is a device driver method of emulating
>        FSI master hardware by 'bit banging' standard I/O lines.
>
> Common FSI terminology:
>
> * Master
>     Controller of the FSI bus.  Only the master is allowed to control the
>     clock line and is the initiator of all transactions on a bus.
>
> * Slave
>     The receiver or target of a master initiated transaction.  The slave
>     cannot initiate communications on a bus and must respond to any
>     master requests for data.
>
> * CFAM
>     Stands for Common Field replaceable unit Access Macro.  A CFAM is an
>     ASIC residing in any device requiring FSI communications. CFAMs
>     consist of an array of hardware 'engines' used for various purposes.
>     I2C masters, UARTs, General Purpose IO hardware are common types of
>     these engines.
>
> * Configuration Space / Table
>     A table contained at the beginning of each CFAM address space.
>     This table lists information such as the CFAM's ID, which engine types
>     and versions it has available, as well as its addressing range.
>
> * Link
>     The combination of a serial clock and data line constituting one
>     FSI communications element. For each link there is a master on one
>     end and a CFAM/slave on the other end.
>
> * Engine
>     A self contained hardware function found within a CFAM.  Examples
>     include I2C masters, UARTs, GPIOs, etc...
>
> * Client
>     A device driver requiring access to its hardware via an FSI bus.
>     For example an I2C client would be a device driver requiring
>     access to an I2C master engine on a remote CFAM accessible via
>     an FSI link.  Clients register with the FSI bus and will receive
>     notifications of bus state changes as well as hot plug events related
>     to engines of interest to them.
>
> * Build Up
>     The process scanning a bus and creating a data structure representation
>     of all devices discovered in a tree.  A tree in this context is a
>     series of links and devices connected to those links.
>
> * Hub / Hub master
>     Provides extension to the existing primary FSI master.  Allows for
>     several chained FSI links in series to a target device thus increasing
>     potential fan out.
>
> * Cascaded master
>     A subset of functionality of the  hub master.  Cascaded masters can
>     access only a limited address range compared to hub masters.  This was
>     the first generation implementation, essentially, of hub type function.
>
> ---
>
> Chris Bostic (6):
>   drivers/fsi: Add FSI Master Functionality and Initialization
>   drivers/fsi: Add FSI master target device scanning function
>   drivers/fsi: Add initial FSI link buildup
>   drivers/fsi: Add FSI bus type and hook into LDM
>   drivers/fsi: Add FSI Bus Support for Clients
>   drivers/fsi: Add CFAM scanning function
>
> Christopher Bostic (1):
>   drivers/fsi: Initial stubs for FSI device driver.
>
>  drivers/Kconfig           |   2 +
>  drivers/Makefile          |   1 +
>  drivers/fsi/Kconfig       |   7 +
>  drivers/fsi/Makefile      |   5 +
>  drivers/fsi/build.c       | 876 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/fsi/fsi.h         | 134 +++++++
>  drivers/fsi/fsi_private.h | 123 +++++++
>  drivers/fsi/fsicfam.h     | 161 +++++++++
>  drivers/fsi/fsiinit.c     |  92 +++++
>  drivers/fsi/fsiinit.h     |  43 +++
>  drivers/fsi/fsilink.h     |  99 ++++++
>  drivers/fsi/fsimaster.c   | 619 ++++++++++++++++++++++++++++++++
>  drivers/fsi/fsimaster.h   | 682 ++++++++++++++++++++++++++++++++++++
>  drivers/fsi/fsislave.h    | 415 ++++++++++++++++++++++
>  drivers/fsi/ldm.c         | 347 ++++++++++++++++++
>  drivers/fsi/readwrite.c   | 123 +++++++
>  16 files changed, 3729 insertions(+)
>  create mode 100644 drivers/fsi/Kconfig
>  create mode 100644 drivers/fsi/Makefile
>  create mode 100644 drivers/fsi/build.c
>  create mode 100644 drivers/fsi/fsi.h
>  create mode 100644 drivers/fsi/fsi_private.h
>  create mode 100644 drivers/fsi/fsicfam.h
>  create mode 100644 drivers/fsi/fsiinit.c
>  create mode 100644 drivers/fsi/fsiinit.h
>  create mode 100644 drivers/fsi/fsilink.h
>  create mode 100644 drivers/fsi/fsimaster.c
>  create mode 100644 drivers/fsi/fsimaster.h
>  create mode 100644 drivers/fsi/fsislave.h
>  create mode 100644 drivers/fsi/ldm.c
>  create mode 100644 drivers/fsi/readwrite.c
>
> --
> 1.8.2.2
>

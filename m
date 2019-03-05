Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.195; helo=mail-qt1-f195.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44D8VR6tynzDqF7;
 Tue,  5 Mar 2019 19:01:32 +1100 (AEDT)
Received: by mail-qt1-f195.google.com with SMTP id u7so8080722qtg.9;
 Tue, 05 Mar 2019 00:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKhbe60C0wirjNE5o0bqdU75fTBTp1R5NQugGO5JnjE=;
 b=MKwT2zKfTX0jrl3aSNayFgfdk/d3xlV9heysX1l6os6bAmP5Z432/F6AugzSqC/m9l
 ixclQhHZgjKOtkBUCCBhOH9jnGJnXHeQn5y3T2xQizyGMWOk7SEKkbgxtvt5+rYa3xh5
 Ktb16ZD9eMidp0UWoLPTq+YmkdN9IKFLl1Ps0N+B54f6S2CgOby2TYFsQxeP9fPgXhtf
 POJHYTsmp6lnDDBQ+FRYHv9Q07ZEpUDIlS0h6At/FN7O2MGg4KX1BLNaEVHh+4M2Rgbk
 fv5qgd44+aXLe6oo7wwo1IdpsHSDWkV3fR+ymVGCJM5zK8dZz6Ej8aMd/DkYDLyNmuS2
 oPwA==
X-Gm-Message-State: APjAAAUOHI2dJ9PN8XXtJ1OnNz3GPclQNqm9QNIlNZtnMGlXNY8Xk/C3
 N465pjqDnTPnu9C+y03AJkpQwn4TuNo2FLUMHfY=
X-Google-Smtp-Source: APXvYqy7q9l6qrpjo7S5rvtT3cJ6qPYReoNCFI2qXqaavDktMpwKMRD8d3Mz2rkyjWmF6VTZSl3Ida2RMI0n7NLJ9W4=
X-Received: by 2002:ac8:237b:: with SMTP id b56mr441086qtb.343.1551772889379; 
 Tue, 05 Mar 2019 00:01:29 -0800 (PST)
MIME-Version: 1.0
References: <1551735420-16202-1-git-send-email-eajames@linux.ibm.com>
 <1551735420-16202-3-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1551735420-16202-3-git-send-email-eajames@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 Mar 2019 09:01:13 +0100
Message-ID: <CAK8P3a0eS11_T9wk4iLRT7A94Lh9gSf5QNGH4--pdA5HdEGMCw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drivers/misc: Add Aspeed XDMA engine driver
To: Eddie James <eajames@linux.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, 
 DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, 
 gregkh <gregkh@linuxfoundation.org>, Jeremy Kerr <jk@ozlabs.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 05 Mar 2019 08:01:36 -0000

On Mon, Mar 4, 2019 at 10:37 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> The XDMA engine embedded in the AST2500 SOC performs PCI DMA operations
> between the SOC (acting as a BMC) and a host processor in a server.
>
> This commit adds a driver to control the XDMA engine and adds functions
> to initialize the hardware and memory and start DMA operations.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Hi Eddie,

Thanks for your submission! Overall this looks well-implemented, but
I fear we already have too many ways of doing the same thing at
the moment, and I would hope to avoid adding yet another user space
interface for a specific hardware that does this.

Your interface appears to be a fairly low-level variant, just doing
single DMA transfers through ioctls, but configuring the PCIe
endpoint over sysfs.

Please have a look at the drivers/pci/endpoint framework first
and see if you can work on top of that interface instead.
Even if it doesn't quite do what you need here, we may be
able to extend it in a way that works for you, and lets others
use the same user interface extensions in the future.

It may also be necessary to split out the DMA engine portion
into a regular drivers/dma/ back-end to make that fit in with
the PCIe endpoint framework.

If you have already tried this without success, please let us
know in the description what problems you have hit, and why you
decided to create a new framework instead.

> +/*
> + * aspeed_xdma_op
> + *
> + * upstream: boolean indicating the direction of the DMA operation; upstream
> + *           means a transfer from the BMC to the host
> + *
> + * host_addr: the DMA address on the host side, typically configured by PCI
> + *            subsystem
> + *
> + * len: the size of the transfer in bytes; it should be a multiple of 16 bytes
> + */
> +struct aspeed_xdma_op {
> +       __u8 upstream;
> +       __u64 host_addr;
> +       __u32 len;
> +} __packed;

Side-note: packed structures are generally not great user space
interfaces. Regardless of where we end up with this, I'd recommend
naturally aligning each member inside of the structure, and using
explicit padding here.


     Arnd

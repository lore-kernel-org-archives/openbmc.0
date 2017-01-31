Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x243.google.com (mail-ot0-x243.google.com
 [IPv6:2607:f8b0:4003:c0f::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vC6T25jwbzDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 11:24:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TPKrZ6sV"; 
 dkim-atps=neutral
Received: by mail-ot0-x243.google.com with SMTP id 73so40198683otj.1
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 16:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=48/ulX/8DhXTOAzjo2gee0MIfm0hWJBPpPAoqyCvyp4=;
 b=TPKrZ6sV0WntgVBYIhy/7Vz34W5g8YRENtAaMhEF2CTS5MmwnLZIZB8UHVQffpgjQD
 zAq99j8/1TWzdk/z3gKFiPKzu8ou6UdxapDp0F5cZ71Wq44udjNNjDtNgdSlTk8feX/w
 eL/2vRsvYKb6OIQ414CFw3kl4iZdgITIH6bmVbgZUBYScUCPwy2nO1c31omDDeZfBJha
 nJL2p3PXiPPc0IkuJFjDr1f2T0zUh2RJrEEPHoumjVUCuG5aMvE9CyILm6ZT9QQ3yV0L
 29Upq9EKmhXvihj5aimgMPF3G78+ZCUQF8am0q1Xn2FvruhUDZIdUWEYG3UFRSxEpMgm
 574Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=48/ulX/8DhXTOAzjo2gee0MIfm0hWJBPpPAoqyCvyp4=;
 b=K4TnPG3DXA82khDHeLjYvpZZ4R28rpGX0+FqwlvjgpjYvJYs0+nF2X8U8fkG2hQkBS
 qyYVf95jFDDountxdpCRyVktOQSR2QBvZYgGfG/GHM6bZH7ezIOOzWEmeR1+POcPxXhU
 iFcnCFa90Cw/FkvDgqVAfFJOYqIJyNd4uQ/grKCzEXjIf9WVdb8FPJswWIV08R9pz8Yd
 BRjCKU2PAiEUMLVEj9p2d+uH6qWyKJWQN0rNj9Uh9KnXtINECw3jxeOZnABo8Gl4iQFk
 z7w8agmrlFAMAEumaN0ETA8Gh+dSVqsspG9TTCvuLVdj131D2/pt1spBzo/Itu7kRJ++
 MmoA==
X-Gm-Message-State: AIkVDXISCTybFb2c8tZ/toVpVtJQ3PQ+VoFGe6kIPuSJORwYwpoZpyWUhkeR9SWH1FR0nz+yFT/m32PyzMiyUA==
X-Received: by 10.157.48.69 with SMTP id w5mr11398914otd.110.1485822260807;
 Mon, 30 Jan 2017 16:24:20 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Mon, 30 Jan 2017 16:24:00 -0800 (PST)
In-Reply-To: <6af19fb7-e5aa-bcb5-8027-9cf609e30eda@linux.vnet.ibm.com>
References: <6af19fb7-e5aa-bcb5-8027-9cf609e30eda@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 31 Jan 2017 10:54:00 +1030
X-Google-Sender-Auth: ZcuFDXdzrenR7Z4TNglABe1lKlo
Message-ID: <CACPK8XdtA9syhXhd3=7YztmfP2BjWyProh4fhXXSZ4i=gGYhfA@mail.gmail.com>
Subject: Re: GPIO expander user space access(ie. pca9552)
To: Matt Barth <msbarth@linux.vnet.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 31 Jan 2017 00:24:23 -0000

On Tue, Jan 24, 2017 at 2:28 AM, Matt Barth <msbarth@linux.vnet.ibm.com> wrote:
> Is there a defined process/interface to access GPIO expanders from user
> space to be able to determine when the state changes? Possibly polling a fd
> or getting notified on the state change?

From the GPIO documentation:

 "value" ... reads as either 0 (low) or 1 (high). If the GPIO
 is configured as an output, this value may be written;
 any nonzero value is treated as high.

 If the pin can be configured as interrupt-generating interrupt
 and if it has been configured to generate interrupts (see the
 description of "edge"), you can poll(2) on that file and
 poll(2) will return whenever the interrupt was triggered. If
 you use poll(2), set the events POLLPRI and POLLERR. If you
 use select(2), set the file descriptor in exceptfds. After
 poll(2) returns, either lseek(2) to the beginning of the sysfs
 file and read the new value or close the file and re-open it
 to read the value.

Is this what you are after?

What action do you need to take when the interrupt fires?

Cheers,

Joel

>
> Previously this was an i2c device that was accessed over i2c and the set of
> interested bits were simply read into the application. An example is the use
> of a pca9552 for presence detection on chassis fans.

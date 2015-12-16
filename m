Return-Path: <joel.stan@gmail.com>
Received: from mail-ig0-x22c.google.com (mail-ig0-x22c.google.com
 [IPv6:2607:f8b0:4001:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9C08D1A0B99
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 10:39:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NjjarFGb; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=lHK85u47; 
 dkim-atps=neutral
Received: by mail-ig0-x22c.google.com with SMTP id jw2so11408334igc.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 15:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=MJlsYBOuJF/M2YkNf7iSBlJrSuuWCBu41+wGbnyyNmo=;
 b=NjjarFGbBEVGgGW7Sic3Uwyw1HwK1W0PiLm29ckn56WUNbvYmVwwMZqLTGL5BiEDnW
 iICQJnFIg0PjRNLaNftDgc+RrEjZ6JC4bWbi7wuiVFC931inBjbWhRwJusLTn++EkkaS
 OX5WAIyaNEFXfHcLDLwTSXL67tbBGtPy7GkMhQkpF5a8uA16mDV21K2LvzCwy9gtk9WP
 o8lFWET49z2jgcjwpsO8fNMjFxqxmOIZQ6H0CXzdsoCzFOXnJ4Tqo5bJKQJqtdPoCbRq
 bPULOSr1/4YAzvxH6xGLTCs1nqQH3BgWlPiyol0IWj+lbqhSxxYDG4KU1C+Am1Cm9ILu
 j+UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=MJlsYBOuJF/M2YkNf7iSBlJrSuuWCBu41+wGbnyyNmo=;
 b=lHK85u47qfx9TqyoV8U8no/AauzU6RCwh4HXY3X4T1Tnv7qHZ2qyEFC+SXLerJV+HV
 AigDkaUOF0AuD0DXGqKevSNCVM2MzpyX2SMJH24/TV3VS+84dOJ3lqtAMgDTUyCcpx94
 z2eJZowxfUcgko5o2gMuvh+IJD7qW+BsCvqt0=
X-Received: by 10.50.36.69 with SMTP id o5mr510290igj.3.1450309185513; Wed, 16
 Dec 2015 15:39:45 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.79.83.67 with HTTP; Wed, 16 Dec 2015 15:39:26 -0800 (PST)
In-Reply-To: <1450308034-19042-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450308034-19042-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450308034-19042-3-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Dec 2015 10:09:26 +1030
X-Google-Sender-Auth: _HZsO1-yyLK2jwQtIxKkFoazQZs
Message-ID: <CACPK8XfgL96LhYKG7k82yr6aTjyY0Ldf91kx8Bb8Ns3A_KgsLw@mail.gmail.com>
Subject: Re: [PATCH u-boot 2/2] drivers/net/aspeednic: Fix unreliable
 networking
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Cyril Bur <cyril.bur@au1.ibm.com>
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
X-List-Received-Date: Wed, 16 Dec 2015 23:39:48 -0000

On Thu, Dec 17, 2015 at 9:50 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>
> Hardware must be told to move data from its RX FIFO to system memory where
> the driver can then consume it.  There are two mechanisms for this, a 'do
> this automatically' register which can be set on device init or simply a
> 'copy data now' polling style which is what this patch does.
>
> Both options were investigated and as the entire network stack of u-boot is
> polling and we're only polling when we expect to receive a message it make
> sense to continue this down to the hardware level as well, doing the
> automatic copy actually causes more noise and unnecessary work.
>
> It should be noted that the NIC was largely functional before this patch.
> It appears that the reason it was working was that the hardware would quite
> happily DMA into the receive ring as long as there was was spare space.
> During heavy loads or on busy networks the receiving ring can fill up which
> causes the hardware to stop (and never resume) its DMA activities unless
> explicitly told to.
>
> Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/aspeednic.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
> index e7b0b95..d70c7ab 100644
> --- a/drivers/net/aspeednic.c
> +++ b/drivers/net/aspeednic.c
> @@ -1334,6 +1334,12 @@ static int aspeednic_recv(struct eth_device* dev)
>         * to the adapter.
>         */
>        rx_ring[rx_new].status &= cpu_to_le32(0x7FFFFFFF);
> +
> +      /*
> +       * Ask the hardware for any other packets now that we have a known
> +       * spare slot
> +       */
> +      OUTL(dev, POLL_DEMAND, RXPD_REG);
>  //      rx_ring[rx_new].status = cpu_to_le32(RXPKT_RDY);
>      }
>
> @@ -1342,6 +1348,12 @@ static int aspeednic_recv(struct eth_device* dev)
>      rx_new = (rx_new + 1) % rxRingSize;
>    }
>
> +  /*
> +   * Ask the hardware for more packets so that they'll be DMAed by the time
> +   * we return to this loop
> +   */
> +  OUTL(dev, POLL_DEMAND, RXPD_REG);
> +
>    return length;
>  }
>
> --
> 2.6.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsTnj5ct6zDqY6
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 09:52:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J/z13UVv"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id k13so82489ywk.2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 15:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=iATv6XzGBA+Jni5JqRQzNzgHF0Svytv3FCk/PwyTAeE=;
 b=J/z13UVvM4d44a1cPlBRD89ngDiRvc2MpcKaYmYFMTD0LGB4C73x3WFGN3b1f0YcME
 GTkQ3AnjGB7x5cr6zC2/v2lcjTinsiUaLpoWnthWfO4DpeMqezoCv1eYtgW2li1WsNEF
 M6mpXJI2bP5XnYCMV0m8/SQ6fXckbxKapssLrKvC9uXOd78ZKo3+8dMuzdnvbPdfkbNl
 BaCducoZVgmbgdgVpYki9Pqf8LIOrTg5sX1li4djn4p2pMGN0qmghhqXj/oQDJdpkMDG
 AGgTsjq8NyAQ2G2dB251DtO5GEFqdjFUJv6TCT+1F13oxNDaL1I8MbKcwW9alKUQl63J
 nmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=iATv6XzGBA+Jni5JqRQzNzgHF0Svytv3FCk/PwyTAeE=;
 b=eBD6x+IiGDmqcD1U+DLz8vWbluU/rAPlzGTJqGXVYxR0tlG1j78PeWFRiktP8tPTJV
 hgzgqr1Xj3HlPEo2sfiambjnQiZtMEDSXCVJp7ijNeTllI+hYMwsLErYEGI8tQ6SkQJ0
 VyXFVmSYl7oFBKXEOQyuFEbMbUxZyuT+FtAwasPPJVhoHWS5aMK6ksUqoZd+x6/kni4e
 zxeSedg2kmNEcvc03F5vFzpT4dqpoRCWWx3pyaxnsNYKMNW9qokX5Ab7Akx0N5dlVyE0
 hI6Dq8Jk/Po/cI7cgrALze17BKWmQyDnfQW2OVjV6Dp3b52e8s7e3djsmTX6hdD5Nz+H
 UkEA==
X-Gm-Message-State: AFeK/H3165+5RwK9GQb86Ek5D2Yp5iHpij94kJv9DK5duTGA6KaJDHnfR7YiGXHzQMg3LxkGNv5ybxeijoRJsw==
X-Received: by 10.129.101.195 with SMTP id z186mr17978921ywb.11.1490655175418; 
 Mon, 27 Mar 2017 15:52:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Mon, 27 Mar 2017 15:52:34 -0700 (PDT)
In-Reply-To: <1490343943.3177.34.camel@kernel.crashing.org>
References: <20170324032015.1194-1-joel@jms.id.au>
 <1490343943.3177.34.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Mar 2017 09:22:34 +1030
X-Google-Sender-Auth: USm4ZMSMryikTqqeSvcSDPWxQM8
Message-ID: <CACPK8Xddd+RKVFXNfuu=76sqoEavFGggs62B-Rp1HKhX5eoOAA@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250: Add flag so drivers can avoid probe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Mon, 27 Mar 2017 22:52:58 -0000

On Fri, Mar 24, 2017 at 6:55 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Fri, 2017-03-24 at 13:50 +1030, Joel Stanley wrote:
>> The probe assumes the other end will be reading bytes out of the
>> buffer
>> in order to probe the port at driver init. In some cases the other
>> end cannot be relied upon to read these bytes, so provide a flag for
>> them to skip this step.
>>
>> Bit 16 was chosen as the flags are a int and the top bits are taken.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>
> Only nit: "The probe" is unclear. "The probing of THRE irq behaviour"
> would be more precise. There are other forms of probing in that
> driver :-)

Good clarification. I applied this to dev-4.7 with the fix to the
commit message you suggested.

The vuart driver has not been submitted upstream. I will send it out
with this fix included.

Cheers,

Joel

>
> Cheers,
> Ben.
>
>> ---
>>  drivers/tty/serial/8250/8250_port.c | 2 +-
>>  drivers/tty/serial/aspeed-vuart.c   | 2 +-
>>  include/linux/serial_core.h         | 1 +
>>  3 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/8250/8250_port.c
>> b/drivers/tty/serial/8250/8250_port.c
>> index 427dd789c0e5..90994e0389df 100644
>> --- a/drivers/tty/serial/8250/8250_port.c
>> +++ b/drivers/tty/serial/8250/8250_port.c
>> @@ -2167,7 +2167,7 @@ int serial8250_do_startup(struct uart_port
>> *port)
>>               serial_port_out(port, UART_LCR, 0);
>>       }
>>
>> -     if (port->irq) {
>> +     if (port->irq && !(up->port.flags & UPF_NO_THRE_TEST)) {
>>               unsigned char iir1;
>>               /*
>>                * Test for UARTs that do not reassert THRE when the
>> diff --git a/drivers/tty/serial/aspeed-vuart.c
>> b/drivers/tty/serial/aspeed-vuart.c
>> index 42ccb380af41..b9559025d710 100644
>> --- a/drivers/tty/serial/aspeed-vuart.c
>> +++ b/drivers/tty/serial/aspeed-vuart.c
>> @@ -260,7 +260,7 @@ static int ast_vuart_probe(struct platform_device
>> *pdev)
>>       port.port.type = PORT_16550A;
>>       port.port.uartclk = clk;
>>       port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
>> -             | UPF_FIXED_PORT | UPF_FIXED_TYPE;
>> +             | UPF_FIXED_PORT | UPF_FIXED_TYPE |
>> UPF_NO_THRE_TEST;
>>
>>       if (of_find_property(np, "no-loopback-test", NULL))
>>               port.port.flags |= UPF_SKIP_TEST;
>> diff --git a/include/linux/serial_core.h
>> b/include/linux/serial_core.h
>> index a3d7c0d4a03e..2d1fb7423999 100644
>> --- a/include/linux/serial_core.h
>> +++ b/include/linux/serial_core.h
>> @@ -193,6 +193,7 @@ struct uart_port {
>>  #define UPF_NO_TXEN_TEST     ((__force upf_t) (1 << 15))
>>  #define UPF_MAGIC_MULTIPLIER ((__force upf_t)
>> ASYNC_MAGIC_MULTIPLIER /* 16 */ )
>>
>> +#define UPF_NO_THRE_TEST     ((__force upf_t) (1 << 19))
>>  /* Port has hardware-assisted h/w flow control */
>>  #define UPF_AUTO_CTS         ((__force upf_t) (1 << 20))
>>  #define UPF_AUTO_RTS         ((__force upf_t) (1 << 21))

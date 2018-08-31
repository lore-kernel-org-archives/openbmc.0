Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Av/KGD3W"; 
 dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 422BMB2Nw6zF39P
 for <openbmc@lists.ozlabs.org>; Sat,  1 Sep 2018 06:50:12 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id u11-v6so5976075plq.5
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 13:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mTKP/O+utSLeJ7+0sJi1DHw9VrvPnuDKukfYsJyxx/E=;
 b=Av/KGD3WKhLG1USpZrgD/B6T7c5WtLclimC+VTlbCGxu9I22TU5Y70Qiq7XzWiF7rv
 aYcovHljgD3ozc1zxVJdiYptzGw/vZW96z66cn3u5BKf1US2vjeZujS4rZFEYMMAMAQ/
 97AN2ojtHWE0jqZIJzu2Ytjj0qmUtwLpl/egXWa2cZMqwMB3Y1L6xWzhixIwT5RubxPe
 feBkH38Rq5Z+SPx/hTQhn6dWHJTewWm8nvXJQ/nyjRqDDx3HvHBi83KOe3DaxjS2LNsv
 n7rPG7gFZ8Kx8fPLhgoWVk+wj65CKfQyxdmnhbQRcsYeBS6jxyS9mNtlg50NGxy8TFAd
 FMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mTKP/O+utSLeJ7+0sJi1DHw9VrvPnuDKukfYsJyxx/E=;
 b=sFICAQ/ISjQZP6nna6V6MQQVGFhxtWG9t007IfEAeyrDQnb7/J66QlU/VrHSKj1WnV
 alhXLrIgpsYotB63Ein9jeid2N07TSl2Ky7w0rqv9SjqO/CMib/XibVj0Tu/MW5FRaqS
 X3aMkSIhhTMsJgy2I4oaIMNf240iGpys3f2WB4/fnG99IKD5E08wbJ/oW8QPxUN3NxNN
 XHNl+lB2M1n3jdEj8WATqZ//KX/PErkXrgrsLW78bDqOGJd71LpKjdwF4KPsgoAxG4i+
 h2CkUhERsuSYKAmL0GtDFQjICLXBXQtv1uOJ2EHCAtppMLjajaxgKJGBLFN4ciEy5qYj
 6EEg==
X-Gm-Message-State: APzg51ASzKDmcjsV2W/UsmWeaqVnl0dZbEXL3KcdK7Trxb1IFYoZtddy
 vtKb2FmhsL0JYyOKza7apTotQDxWzZW9edZ/JlGIKg==
X-Google-Smtp-Source: ANB0VdYD6FtkKfmd+KTI0Sv5ExaPjxsOsGGmPtjHkjP0zwfpXCtC2M0VpgPqLk8u+0no4/h9vpKYq2Cm6lXn+u+s7qA=
X-Received: by 2002:a17:902:b70f:: with SMTP id
 d15-v6mr17627524pls.53.1535748609778; 
 Fri, 31 Aug 2018 13:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzR73b_oZjAiH1x+KjL-i_WKpHUp=xEdRfq5H76u0FmSQ@mail.gmail.com>
 <20180831193919.GB44886@mauery.jf.intel.com>
In-Reply-To: <20180831193919.GB44886@mauery.jf.intel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 31 Aug 2018 13:49:57 -0700
Message-ID: <CAO=notxGLHB1P7cHg5dK0rixNupgQxrwhk=hjZm9G_9f34kpyg@mail.gmail.com>
Subject: Re: OEM IPMI EthStats
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2018 20:50:15 -0000

On Fri, Aug 31, 2018 at 12:39 PM Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
>
> On 30-Aug-2018 02:15 PM, Patrick Venture wrote:
> >Out of a desire to export link health information, we implemented an
> >OEM IPMI command that lets one grab ethernet statistics from a named
> >ethernet device on the BMC.  (The NCSI statistics IPMI commands were a
> >bit clunky and didn't do what we needed).
> >
> >The OEM IPMI commands spec is pretty short on this one:
> >
> >### Ethernet Statistics Command (0x30) {#ethernet-statistics-command-0x30}
>
> I would say that this command could be useful to the entire OpenBMC
> community, so registering it under the OpenBMC OEM table would be good.
>
> >There is the need to read a specific ethernet-level statistic value
> >from the BMC.  This is driven primarily to detect link errors that
> >require hardware swaps during manufacturing.
> >
> >This command will be well structured such that there is a request and
> >response which mirror to some extent.
> >
> >The request will specify the ethernet interface by name, as a
> >length-prepended string, and the field they're requesting by
> >identifier (an unsigned byte).
> >
> >If the command is not supported, the IPMI OEM handler will respond
> >accordingly, however, if the field is not supported or not recognized,
> >the command will return 0xcc (invalid field).
> >
> >The current ethernet statistics available (all future additions must append):
> >
> >|Identifier |Human Readable Name
> >|-----------|--------------------
> >|0          |rx_bytes
> >|1          |rx_compressed
> >|2          |rx_crc_errors
> >|3          |rx_dropped
> >|4          |rx_errors
> >|5          |rx_fifo_errors
> >|6          |rx_frame_errors
> >|7          |rx_length_errors
> >|8          |rx_missed_errors
> >|9          |rx_nohandler
> >|10         |rx_over_errors
> >|11         |rx_packets
> >|12         |tx_aborted_errors
> >|13         |tx_bytes
> >|14         |tx_carrier_errors
> >|15         |tx_compressed
> >|16         |tx_dropped
> >|17         |tx_errors
> >|18         |tx_fifo_errors
> >|19         |tx_heartbeat_errors
> >|20         |tx_packets
> >|21         |tx_window_errors
> >
> >Request
> >
> >|Byte(s) |Value |Data
> >|--------|------|----
> >|0x00    |Statistic ID |The identifier of the desired statistic
> >|0x01    |Length       |Where you expect the cable, eth0 or eth1, etc
> >|0x02..  |The name     |The string, not null-terminated
>
> Rather than using actual ethernet device names, it might be better to
> use IPMI channel numbers or 0..N-1 for the Nth ethernet device. Other
> than that, the interface looks good to me.

Sure, because this code doesn't go through the normal IPMI channel
configuration it didn't natively have accept to that information.
Certainly follow-on work could enable that as an option.  Depending on
some magic string checks, as is often how things like this are done.

>
> --Vernon
>
> >Response
> >
> >|Byte(s) |Value  |Data
> >|--------|-------|----
> >|0x00    |Stat ID|The identifier of the desired statistic
> >|0x01....|Uint64 |The value.  Because these are counters we don't
> >anticipate negative values, and we don't expect overflow.
>
>

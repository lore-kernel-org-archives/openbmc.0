Return-Path: <chip@bilbrey.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bilbrey.org
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=chip@bilbrey.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bilbrey.org header.i=@bilbrey.org header.b="O0qdumcK"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVVpG24ypzDr6m
 for <openbmc@lists.ozlabs.org>; Mon,  6 Nov 2017 09:33:24 +1100 (AEDT)
Received: by mail-pf0-x243.google.com with SMTP id p87so6310466pfj.3
 for <openbmc@lists.ozlabs.org>; Sun, 05 Nov 2017 14:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bilbrey.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=WSXLT23MIkKb66daiIWw5n1SCKugPMsbxB092WOWi6Y=;
 b=O0qdumcKazFL0NgNPhbvCWuX4v93HKmQS/xk+41Kv4RDF1g5TgxXkiC6pqcanlZodd
 AqIQU9QyVLAoGymFl9haVzF9fyPIh83eegQHkyNQUbf3aMBijvWrRfPs6DMepCdihiky
 qK7uiszka2RC8yQPGsCWvhObC1SF4B3zMaSsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=WSXLT23MIkKb66daiIWw5n1SCKugPMsbxB092WOWi6Y=;
 b=cr4Yx52eqGHlhgltldrrRN5+b9Az7OxHyKGK05U4J7nn1EH4RnhgfnqI1jIfXJTYRN
 tah1rXguxnLB/Ypwgd19itNHqADqBaGDfwLhJV10bxCEZftBjDnQgkod67HK9W3AoPf1
 Hfb7yff+gZ4W3C84MYLpibk3PE1fWaE447VPESjeIp07bEDxyWoFpZ4/vaSzFBfN43lS
 FpcMe3UfvAbhh0dhvNfaCkfsqTqSj5J0YnvoRUVagAUYBiqRnO7P2ra84Bkp+0oQK6Kv
 ltiHW/s0JacuofbZv/O4/+yHyU81cqUUF8agECQrBlK5iaGXGPyufi3ZBdfJZK5TRxb/
 fEEw==
X-Gm-Message-State: AMCzsaU3L0JYkFBpyx/F9fFSmQCynYQrb0OF1XjtJLFjHRMc4sLtAODd
 3ip3HpDP9Pna9IbT/TVYuk4ggQ==
X-Google-Smtp-Source: ABhQp+TSf/1uYqlv6AP0iIeoI7BScS/HQAPadngMs3fZYkUjF4/B0bFUHjV9UmdqhgLYeKpf8baUOQ==
X-Received: by 10.84.133.132 with SMTP id f4mr12896020plf.197.1509921202363;
 Sun, 05 Nov 2017 14:33:22 -0800 (PST)
Received: from omicron ([2001:5b0:49de:808:3602:86ff:fe41:dd4f])
 by smtp.gmail.com with ESMTPSA id v190sm17385135pgv.25.2017.11.05.14.33.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Nov 2017 14:33:21 -0800 (PST)
References: <1509724449-26221-2-git-send-email-oleksandrs@mellanox.com>
User-agent: mu4e 0.9.18; emacs 25.1.1
From: Chip Bilbrey <chip@bilbrey.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org, mec@shout.net,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org,
 davem@davemloft.net, mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
Subject: Re: [v11,1/4] drivers: jtag: Add JTAG core driver
In-reply-to: <1509724449-26221-2-git-send-email-oleksandrs@mellanox.com>
Date: Sun, 05 Nov 2017 14:32:53 -0800
Message-ID: <8760aoz78q.fsf@bilbrey.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 07 Nov 2017 10:13:12 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Nov 2017 22:33:27 -0000


Oleksandr Shamray writes:
> diff --git a/include/uapi/linux/jtag.h b/include/uapi/linux/jtag.h
> new file mode 100644
> index 0000000..0b25a83
> --- /dev/null
> +++ b/include/uapi/linux/jtag.h
> [...]
> +/**
> + * enum jtag_xfer_mode:
> + *
> + * @JTAG_XFER_HW_MODE: hardware mode transfer
> + * @JTAG_XFER_SW_MODE: software mode transfer
> + */
> +enum jtag_xfer_mode {
> +	JTAG_XFER_HW_MODE,
> +	JTAG_XFER_SW_MODE,
> +};

Is this essentially selecting between bit-bang mode or not?  Is there a
generally applicable reason to select SW mode over HW (or vice versa)?
This sounds like it's tied to device-specific capability which shouldn't
be exposed in a generic user API.

> +/**
> + * struct jtag_xfer - jtag xfer:
> + *
> + * @mode: access mode
> + * @type: transfer type
> + * @direction: xfer direction
> + * @length: xfer bits len
> + * @tdio : xfer data array
> + * @endir: xfer end state
> + *
> + * Structure represents interface to Aspeed JTAG device for jtag sdr xfer
> + * execution.

Probably should remove the reference to Aspeed here.

> +/* ioctl interface */
> +#define __JTAG_IOCTL_MAGIC	0xb2
> +
> +#define JTAG_IOCRUNTEST	_IOW(__JTAG_IOCTL_MAGIC, 0,\
> +			     struct jtag_run_test_idle)
> +#define JTAG_SIOCFREQ	_IOW(__JTAG_IOCTL_MAGIC, 1, unsigned int)
> +#define JTAG_GIOCFREQ	_IOR(__JTAG_IOCTL_MAGIC, 2, unsigned int)
> +#define JTAG_IOCXFER	_IOWR(__JTAG_IOCTL_MAGIC, 3, struct jtag_xfer)
> +#define JTAG_GIOCSTATUS _IOWR(__JTAG_IOCTL_MAGIC, 4, enum jtag_endstate)

I notice the single-open()-per-device lock was dropped by request in an
earlier revision of your patches, but multiple processes trying to drive
a single JTAG master could wreak serious havoc if transactions get
interleaved. Would something like an added JTAG_LOCKCHAIN/UNLOCKCHAIN
ioctl() for exclusive client access be reasonable to prevent this?

-Chip

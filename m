Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::231; helo=mail-lf0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vTRWaNRB"; 
 dkim-atps=neutral
Received: from mail-lf0-x231.google.com (mail-lf0-x231.google.com
 [IPv6:2a00:1450:4010:c07::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrxkW3XRVzDqyG
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 17:48:51 +1000 (AEST)
Received: by mail-lf0-x231.google.com with SMTP id c80so24192580lfh.0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FYBMDvxg2kudXjsIL16HHpUIOpsTCKtWCrNDQhHRegY=;
 b=vTRWaNRBDHPvnQtE8kWaJHOWTOgzEDSiGX0wioVCG/nxPxh+9Dc9tQMR0prbEkeMLF
 bh3drIJfWtf4GU/shyQR8PHeJOS+NV0c6PXr9Sc06WF7Ql3rC4/JLIy/BaWsf2Y1V8OB
 PMV0JHd+H0k6uStbYVgQFCYbk9ANcuXDWpcceX9ByTMqYgj9kkoIAmyNiPjC8aE1OACR
 97AnZOcl4PYXuVF0HN/bhWHA9O7u5eEuWNQAIiqywEJDVdZDFZHwqG++Mq9jXSW5oEzB
 25+jrALlUUNuDJDuqzwE/q3Ojelpaur6CppbRlQLGy1nkMpLM16KVKwvcvpYmXcqGyWJ
 f+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=FYBMDvxg2kudXjsIL16HHpUIOpsTCKtWCrNDQhHRegY=;
 b=QwazSOeRowUtRNMh8qr3rKunwbQm/HWbmL+N+nbdJR4TIZj8wBUyN6xiI9vrMX1ZDk
 Q7mE55YT2JZP2m/ecuHjajfUpYEUyKgKMq2cdFKSp2r2qSiLIzeDpuJkRiGkSlJAuVcI
 6UH22jJvcfSkcfGIZk4k/1c6cYiV2MiVHsDphr690YIYoLb1+01cde2bmZOVdMVkPO4+
 sSu9JpaRLlHC1vhpjdlQWuNiJ3N8pq1S1LflC203n86hh9Ke1ctAnIOnKQEIkJa6PGNW
 QkduMaB0RQzmNEDYlNUo0U/zRvzMymKSnenttjh53r+EArF93kF+dhuuC9rrjH2cYl1l
 HdkA==
X-Gm-Message-State: AHPjjUj3+CToMI9l6pQ+tgmWFcMBxy0hGOdFNys8NahAJCWuVKDowoJv
 NvJMQLm7LGuoJ7y0mO4Wsq4PbmIqZg==
X-Google-Smtp-Source: AOwi7QABZwlIbFxokCsfcxL1QswBfYpfl/7oYecJO+aAm1jyS7LM9GV+7/z7h+/ev1DEpyMI226tQAhUHj18rKoBfEs=
X-Received: by 10.46.95.19 with SMTP id t19mr82072ljb.182.1505202528412; Tue,
 12 Sep 2017 00:48:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 12 Sep 2017 00:48:27 -0700 (PDT)
In-Reply-To: <20170908215728.115818-3-xow@google.com>
References: <20170908215728.115818-3-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Sep 2017 17:48:27 +1000
X-Google-Sender-Auth: hGKENiuuIWZlGM6-5FUvZYSLkYs
Message-ID: <CACPK8XcXdZkpAvP6sUQforgPRzB+otkzz7DRG=yNx7-kmiJMCg@mail.gmail.com>
Subject: Re: [linux, 2/5] ARM: dts: aspeed: zaius: Update hotswap controller
 address for EVT3
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 12 Sep 2017 07:48:52 -0000

On Sat, Sep 9, 2017 at 7:57 AM, Xo Wang <xow@google.com> wrote:
> The LM5066I hotswap controller is at PMBus device address 0x54 starting
> with the EVT3 motherboard.
>
> Signed-off-by: Xo Wang <xow@google.com>

Applied to dev-4.10,

Cheers,

Joel

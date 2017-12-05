Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KNvIOjPk"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yrNJd6JWQzDrpn
 for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2017 11:43:13 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id r143so21258998lfe.13
 for <openbmc@lists.ozlabs.org>; Mon, 04 Dec 2017 16:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2EiIVAcnTYMET0nl63hZa0cVCe8NXloI4kl4gWbCgmk=;
 b=KNvIOjPkbRmiUzLpwC+rDa8oAQRbP0YJboQ66hFZvJvR3KEcSBrnphbeB7l12zpgv6
 AxOCZsFDpeQJzrWHG313tKBeoeKdsg2QXyotaRi/haz7eD/YTNfVnPQUfWN1QSBuYQZ2
 fdjlfq5JGNStuxkxiKK2azk8QgZ/ivEC6VAX4vXcXofjhCAK+gpM2UttOxj33K6TJxtc
 W/wBhiDgX4Ou53hjkMfVttqa3C9Ag2VBFytvHp7hXMy5TiVooUvvvErGuqxXg3YCUgIA
 nHArenOq80X3x9Vv+DABUhaWYyXlLxQM64Bj4QOb3F0e9Uj9Z8ISKLT1gZuJLjEjjWsR
 2EKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2EiIVAcnTYMET0nl63hZa0cVCe8NXloI4kl4gWbCgmk=;
 b=j41WuwJELhxMVISDFyss2Pv/zY36eJdNf1HYgx5zp8F2zNvkZL4H9ojyyRccQ8ZPQa
 0XnBbtDwR4WrKoUUZ1MSIHNXyJHkgz4kv0jZy7OXeIRUtfpztNtuFEJQhs3UNFy7LgPL
 4huranBMUjyMRWSvMMKVZkq859IrFvhCwuCeakfvc+J1HcdMxgPg/l9TrFKZSt44L6mW
 2mGdAROopAzGCfuN26fAAQcRPyh840uhuGR/ozSctA9e31c1ytX8sD3Umx9NyVv8elG/
 MbwFNo3knQ11XfJR7yaCGrGbFKcMvdIcLHLeF1mNr2WG8IC728S4LqwsaIDARpM6Oi6U
 PWyA==
X-Gm-Message-State: AJaThX4GuRwB+nyoXKVznsVbdcyq9M1m/AqjMnMqES8pxTSUXoj6DpBW
 tprKo6ppFYk36VcOiY2z+wIcBcLzpbLwwNMzWpwWOeSx
X-Google-Smtp-Source: AGs4zMaCDk4P4ic+mo9dknSlzsytGD2Lt69pxcpDZi0OV2WUGQr261fPvQmnVTG2nuiMHuSR5TtvaPb99fZ5B+URFk4=
X-Received: by 10.46.93.2 with SMTP id r2mr9622517ljb.182.1512434590040; Mon,
 04 Dec 2017 16:43:10 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Mon, 4 Dec 2017 16:42:49 -0800 (PST)
In-Reply-To: <1512376203-147224-1-git-send-email-yong.b.li@linux.intel.com>
References: <1512376203-147224-1-git-send-email-yong.b.li@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Dec 2017 11:12:49 +1030
X-Google-Sender-Auth: qFoZG5iviCGxsAMJgRXyhKjW7BI
Message-ID: <CACPK8XfXtjxaRXnbK3uCz4RscvRXCHkp==eU4O4dXghOErVypQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/1] pinctrl: aspeed: Allow disabling Port
 D and Port E loopback mode
To: Yong Li <yong.b.li@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 05 Dec 2017 00:43:15 -0000

On Mon, Dec 4, 2017 at 7:00 PM, Yong Li <yong.b.li@linux.intel.com> wrote:
> Backport pinctrl patch from kernel 4.12
>
> This patch is used to control the pass-through functions for GPIOE/GPIOD
>
> It is included in kernel V4.12:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c825676b0823fd43a4d08bf865f81bb188b51db1

Thanks. I've backported this to 4.10, as well as the "pinctrl: aspeed:
Fix ast2500 strap register write logic" that you submitted (and
Andrew's fix "pinctrl: aspeed: Allow disabling Port D and Port E
loopback mode").

Cheers,

Joel
